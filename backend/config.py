# needs to use .env
import os
from dotenv import load_dotenv

load_dotenv()

# for Spotify information
SPOTIFY_CLIENT_ID = os.getenv("SPOTIFY_CLIENT_ID")
SPOTIFY_CLIENT_SECRET = os.getenv("SPOTIFY_CLIENT_SECRET")
SPOTIFY_REDIRECT_URI = os.getenv("SPOTIFY_REDIRECT_URI")

# for backend set up
FLASK_SECRET_KEY= os.getenv("FLASK_SECRET_KEY")
DATABASE_URL = os.getenv("DATABASE_URL")

FRONTEND_URL = os.getenv("FRONTEND_URL")