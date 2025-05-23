'''
auth_routes.py will handle the login and OAuth with Spotify
'''

from flask import Blueprint, redirect, request, session
import requests
import urllib.parse
import config

import spotify_services
from flask import current_app as app, session, jsonify
from requests.exceptions import HTTPError

auth_bp = Blueprint('auth', __name__)
import db

# /login route
# this works 4/19 commit
@auth_bp.route('/login')
def login():
    # creates a dictionary
    scope = "user-read-private user-read-email playlist-read-private playlist-modify-public playlist-modify-private user-read-playback-state user-top-read user-library-read streaming"


    params = {
        "client_id": config.SPOTIFY_CLIENT_ID,
        "response_type": "code", # this tells Spotify I need the auth code
        "redirect_uri" : config.SPOTIFY_REDIRECT_URI,
        "scope": scope
    }
    # need to construct the URL -> use urllib.parse.urlencode
    # user -> /auth/login -> redirect to Spotify -> Spotify asks user -> Spotify redirects w/auth code
    query_string = urllib.parse.urlencode(params)
    # 'https://accounts.spotify.com/authorize?' taken from Spotify forDevelopers
    url = 'https://accounts.spotify.com/authorize?' + query_string
    return redirect(url)


# /callback route, exchange code for access token
# refer here: https://developer.spotify.com/documentation/web-api/tutorials/code-flow
@auth_bp.route('/callback')
def callback():
    # post request to /api/token
    token_url = "https://accounts.spotify.com/api/token"
    # grab and save code here
    code = request.args.get('code')
    payload = {
        "grant_type": "authorization_code",
        "code": code, # this is gathered from previous code
        "redirect_uri": config.SPOTIFY_REDIRECT_URI,
        # less secure but for the project scope, easier to do then base64 encoding in headers
        "client_id": config.SPOTIFY_CLIENT_ID,
        "client_secret": config.SPOTIFY_CLIENT_SECRET
    }
    headers = {
        "Content-Type": "application/x-www-form-urlencoded"
    }

    # send the request via post
    response = requests.post(token_url, data=payload, headers=headers)
    # spotify returns a json data
    token_info = response.json()

    # access_token and refresh_token is a string, save in a variable
    access_token = token_info.get('access_token')
    refresh_token = token_info.get('refresh_token')

    # use flask session to store user-specific data (ie cookies)
    # https://www.geeksforgeeks.org/how-to-use-flask-session-in-python-flask/
    session['access_token'] = access_token
    session['refresh_token'] = refresh_token

    return redirect(config.FRONTEND_URL)

@auth_bp.route('/me')
def me():
    access_token = session.get('access_token')
    # if we don't have an access token, redirect user to login to get token
    if not access_token:
        return redirect('/auth/login')
    
    # use spotify_services.py get_user_profile function
    profile_data = spotify_services.get_user_profile(access_token)
    return profile_data


@auth_bp.route('/playlists')
def playlists():
    access_token = session.get('access_token')
    if not access_token:
        return redirect('/auth/login')

    profile_data = spotify_services.get_user_playlists(access_token)
    return profile_data
    
'''
For database
'''

@auth_bp.route('/sync_playlists')
def sync_playlists():
    access_token = session.get('access_token')
    if not access_token:
        return jsonify(error="Not authenticated"), 401
    try:
        playlists_data = spotify_services.get_user_playlists(access_token)
    except HTTPError as e:
        if e.response.status_code == 401:
            # token expired or invalid — clear session and ask to re-login
            session.pop('access_token', None)
            session.pop('refresh_token', None)
            return jsonify(error="Session expired, please log in again"), 401
        app.logger.exception("Spotify API error")
        return jsonify(error="Spotify API error"), 500



    #playlists_data = spotify_services.get_user_playlists(access_token)
    spotify_services.playlists_to_db(playlists_data)
    return {"message": "Playlist Syncing Success"}, 200



@auth_bp.route('/sync_tracks/<playlist_id>')
def sync_tracks(playlist_id):
    access_token = session.get('access_token')
    if not access_token:
        return redirect('/auth/login')

    tracks_data = spotify_services.get_playlist_tracks(access_token, playlist_id)
    spotify_services.tracks_to_db(tracks_data, playlist_id)
    return {"message": "Tracks Syncing Success"}


# Query #1 - Simple, grabs all the playlists
@auth_bp.route('/playlistAll')
def playlistAll():
    access_token = session.get('access_token')
    if not access_token:
        return redirect('/auth/login')
    
    playlists = db.Playlist.query.all()
    return {
        # go through each item in playlist, get the name
        "playlists": [
            {"id" : p.id, "name" : p.name}
            for p in playlists
        ]
    }

# Query #2 - Simple, grabs all the tracks
@auth_bp.route('/create_vibe_playlist')
def create_vibe_playlist():
    access_token = session.get('access_token')
    if not access_token:
        return redirect('/auth/login')
    
    # create a new playlist
    from uuid import uuid4
    playlist_id = str(uuid4())[:8] # creates random ID w/8 digits

    # creates a new playlist w/random id
    # adds to the database
    vibe_playlist = db.Playlist(
        id = playlist_id,
        name = "Vibe Playlist",
        owner = "Autogenerated",
        track_count = 0,
        image_url = None,
        spotify_url = None
    )
    db.db.session.add(vibe_playlist)

    # grab all the tracks
    tracks = db.Tracks.query.all()
    wanted_tracks = []

    for track in tracks:
        if track.popularity and track.duration_ms:
            if track.popularity > 50 and track.duration_ms < 240000:
                wanted_tracks.append(track)

    # create a copy of the track for the new playlist
    # do not override and change the original playlists
    for track in wanted_tracks:
        #track.playlist_id = playlist_id
        new_track = db.Tracks (
            id = str(uuid4())[:8], # give it a new ID
            name = track.name,
            artist = track.artist,
            playlist_id = playlist_id,  # Link to new playlist
            popularity = track.popularity,
            duration_ms = track.duration_ms,
            album_image_url = track.album_image_url

        )
        db.db.session.add(new_track)

    vibe_playlist.track_count = len(wanted_tracks)
    db.db.session.commit()

    return {"message": f"Created Vibe Playlist with {len(wanted_tracks)} tracks!"}

# Query #3 - Simple, List tracks for a playlist
@auth_bp.route('/playlist_tracks/<playlist_id>')
def playlist_tracks(playlist_id):
    access_token = session.get('access_token')
    if not access_token:
        return redirect('/auth/login')
    
    # grab the tracks associated to the playlist
    tracks = db.Tracks.query.filter_by(playlist_id=playlist_id).all()

    return {
        "tracks": [
            {
                "name" : t.name,
                "artist" : t.artist,
                "popularity" : t.popularity,
                "duration_ms": t.duration_ms,
                "album_image_url": t.album_image_url
            }
            for t in tracks
        ]
    }

# Query #4 - Simple, Update playlist name
# Can delete this, easy CRUD Operation though
@auth_bp.route('/update_playlist_name/<playlist_id>', methods=['POST'])
def update_playlist_name(playlist_id):
    access_token = session.get('access_token')
    #if not access_token:
    #    return redirect('/auth/login')
    # save the new name
    new_name = request.form.get('new_name')
    if not new_name:
        return {"error": "New name not provided"}, 400
    playlist = db.Playlist.query.get(playlist_id)
    playlist.name = new_name
    db.db.session.commit()

    return {"message": f"Playlist {playlist_id} renamed to {new_name} successfully!"}

# Query #5 - Simple, Delete a playlist
@auth_bp.route('/delete_playlist/<playlist_id>')
def delete_playlist(playlist_id):
    access_token = session.get('access_token')
    if not access_token:
        return redirect('/auth/login')
    
    # use the ID to find the playlist name
    playlist = db.Playlist.query.get(playlist_id)
    # delete all associating tracks
    db.Tracks.query.filter_by(playlist_id=playlist_id).delete()
    db.db.session.delete(playlist)
    db.db.session.commit()
    return {"message": "Playlist deleted successfully"}, 200

# Query #6 - Simple, Search through tracks
@auth_bp.route('/search_tracks/<search_term>')
def search_tracks(search_term):
    access_token = session.get('access_token')
    if not access_token:
        return redirect('/auth/login')
    # use ilike to make it non-cap sensitive
    tracks = db.Tracks.query.filter(db.Tracks.name.ilike(f"%{search_term}%")).all()
    return {
        "matching_tracks" : [
            {
                "name" : t.name,
                "artist": t.artist,
                "popularity": t.popularity,
                "duration_ms": t.duration_ms,
                "album_image_url": t.album_image_url
            }
            for t in tracks
        ]
    }
    
# Query #7 - Complex Grab Top 5 Popular Tracks
@auth_bp.route('/top_five')
def top_five():
    # uses ORDER BY
    # Limit 5 -> aggregation + selection
    access_token = session.get('access_token')
    if not access_token:
        return redirect('/auth/login')
    tracks = db.Tracks.query.order_by(db.Tracks.popularity.desc()).limit(5).all()
    return {
        "top_tracks" : [
            {
                "name" : t.name,
                "artist" : t.artist,
                "popularity" : t.popularity,
                "duration_ms": t.duration_ms,
                "album_image_url": t.album_image_url
            }
            for t in tracks
        ]
    }

# Query #8 - List all long tracks
@auth_bp.route('/long_tracks')
def long_tracks():
    access_token = session.get('access_token')
    if not access_token:
        return redirect('/auth/login')
    # set duration to over 5 minutes
    tracks = db.Tracks.query.filter(db.Tracks.duration_ms > 300000).all()
    return {
        'long_tracks' : [
            {
                "name": t.name,
                "artist": t.artist,
                "popularity": t.popularity,
                "duration_ms": t.duration_ms,
                "album_image_url": t.album_image_url
            }
            for t in tracks
        ]
    }