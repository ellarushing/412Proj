'''
auth_routes.py will handle the login and OAuth with Spotify
'''

from flask import Blueprint, redirect, request, session
import requests
import urllib.parse
import config

import spotify_services

auth_bp = Blueprint('auth', __name__)
import db

# /login route
# this works 4/19 commit
@auth_bp.route('/login')
def login():
    # creates a dictionary
    scope = "user-read-private user-read-email playlist-read-private"
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

    return "Login Successful on callback endpoint"

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
        return redirect('/auth/login')
    
    playlists_data = spotify_services.get_user_playlists(access_token)
    spotify_services.playlists_to_db(playlists_data)
    return {"message": "Playlist Syncing Success"}

@auth_bp.route('/sync_tracks/<playlist_id>')
def sync_tracks(playlist_id):
    access_token = session.get('access_token')
    if not access_token:
        return redirect('/auth/login')

    tracks_data = spotify_services.get_playlist_tracks(access_token, playlist_id)
    spotify_services.tracks_to_db(tracks_data, playlist_id)
    return {"message": "Tracks Syncing Success"}



'''
    # loop through and grab all the data
    for item in playlists_data:
        playlist = db.Playlist(
            id = item['id'],
            name = item['name'],
            owner = item['owner']['display_name'],
            track_count = item['tracks']['total'],
            image_url = item['images'][0]['url'] if item['images'] else None,
            spotify_url = item['external_urls']['spotify']
        )
        # insert into the database
        db.db.session.merge(playlist)
    db.db.session.commit()
'''





# Query #1 - Simple
# grabs all the playlists
@auth_bp.route('/playlistAll')
def playlistAll():
    access_token = session.get('access_token')
    if not access_token:
        return redirect('/auth/login')
    
    playlists = db.Playlist.query.all()
    return {
        # go through each item in playlist, get the name
        "playlists": [p.name for p in playlists]
    }


