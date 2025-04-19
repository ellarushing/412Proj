'''
auth_routes.py will handle the login and OAuth with Spotify
'''

from flask import Blueprint, redirect, request, session
import requests
import urllib.parse
from config import SPOTIFY_CLIENT_ID, SPOTIFY_CLIENT_SECRET, SPOTIFY_REDIRECT_URI

auth_bp = Blueprint('auth', __name__)

# /login route
@auth_bp.route('/login')
def login():
    # creates a dictionary
    scope = "user-read-private user-read-email playlist-read-private"
    params = {
        "client_id": SPOTIFY_CLIENT_ID,
        "response_type": "code", # this tells Spotify I need the auth code
        "redirect_uri" : SPOTIFY_REDIRECT_URI,
        "scope": scope
    }
    # need to construct the URL -> use urllib.parse.urlencode
    # user -> /auth/login -> redirect to Spotify -> Spotify asks user -> Spotify redirects w/auth code
    query_string = urllib.parse.urlencode(params)
    # 'https://accounts.spotify.com/authorize?' taken from Spotify forDevelopers
    url = 'https://accounts.spotify.com/authorize?' + query_string
    return redirect(url)




# /callback route
@auth_bp.route('/callback')
def callback():
    pass