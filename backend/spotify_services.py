# use this to get the users profile
import requests


# gets user info
def get_user_profile(access_token):
    headers = {
        # take token and send it to the Spotify endpoint
        "Authorization": f"Bearer {access_token}"
    }
    response = requests.get("https://api.spotify.com/v1/me", headers=headers)
    response.raise_for_status() # get an error if request failed
    return response.json() # return json of the request


def get_user_playlists(access_token):
    headers = {
        # take token and send it to the Spotify endpoint
        "Authorization": f"Bearer {access_token}"
    }
    url = "https://api.spotify.com/v1/me/playlists"
    response = requests.get(url, headers=headers)
    response.raise_for_status()
    return response.json()




