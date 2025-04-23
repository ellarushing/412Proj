# use this to get the users profile
import requests


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
        images = playlist['images'][0]['url'] if playlist['images'] else None

        print(f"{playlist_id} | {name} | {owner} | Pulblic: {is_public} | Tracks: {track_count}")
        

