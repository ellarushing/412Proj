# use this to get the users profile
import requests
import db


'''
For endpoints in auth_routes.py
'''

# gets user info
def get_user_profile(access_token):
    headers = {
        # take token and send it to the Spotify endpoint
        "Authorization": f"Bearer {access_token}"
    }
    response = requests.get("https://api.spotify.com/v1/me", headers=headers)
    response.raise_for_status() # get an error if request failed
    return response.json() # return json of the request

# gets user playlists
def get_user_playlists(access_token):
    headers = {
        # take token and send it to the Spotify endpoint
        "Authorization": f"Bearer {access_token}"
    }
    url = "https://api.spotify.com/v1/me/playlists"
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return response.json()


def get_playlist_tracks(access_token, playlist_id):
    headers = {
        "Authorization": f"Bearer {access_token}"
    }

    url = f"https://api.spotify.com/v1/playlists/{playlist_id}/tracks"
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return response.json()

def get_audio_features(access_token, track_id):
    if not access_token:
        print("Warning: No access token provided to get_audio_features")
        raise ValueError("No access token provided")
    

    headers = {
        "Authorization": f"Bearer {access_token}"
    }
    url = f"https://api.spotify.com/v1/audio-features/{track_id}"
    response = requests.get(url, headers=headers)

    if response.status_code != 200:
            print(f"Error {response.status_code} for track {track_id}: {response.text}")


    response.raise_for_status()
    return response.json()



'''
For Database
'''

def playlists_to_db(playlists_json):
    # loop through each playlist from json paramaters
    for playlist in playlists_json['items']:
        playlist_id = playlist['id']
        name = playlist['name']
        owner = playlist['owner']['display_name']
        is_public = playlist['public']
        track_count = playlist['tracks']['total']
        # some playlists might have no images
        image_url = playlist['images'][0]['url'] if playlist['images'] else None
        spotify_url = playlist['external_urls']['spotify']

        new_playlist = db.Playlist(
            id=playlist_id,
            name=name,
            owner=owner,
            track_count=track_count,
            image_url=image_url,
            spotify_url=spotify_url
        )
        # insert into the database
        db.db.session.merge(new_playlist)
    db.db.session.commit()

    print(f"{playlist_id} | {name} | {owner} | Public: {is_public} | Tracks: {track_count}")
        

def tracks_to_db(tracks_json, playlist_id):
    from uuid import uuid4

    for track in tracks_json['items']:
        track = track['track']
        track_id = track['id']
        track_name = track['name']
        artist_name = track['artists'][0]['name'] # just get the first artist
        album_name = track['album']['name']
        popularity = track['popularity']
        duration_ms = track['duration_ms']

        new_track = db.Tracks(
            id = track_id,
            name = track_name,
            artist = artist_name,
            playlist_id = playlist_id, # parameter
            popularity = popularity,
            duration_ms = duration_ms
        )
        db.db.session.merge(new_track)
    db.db.session.commit()
    

