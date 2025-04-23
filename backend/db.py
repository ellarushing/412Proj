# gives python way to do database operations
from flask_sqlalchemy import SQLAlchemy

# define playlist in db
db = SQLAlchemy()

# matches with spot_services
# can add more (possibly genre or popularity?)
class Playlist(db.Model):
    __tablename__ = 'playlists'

    id = db.Column(db.String, primary_key = True)
    name = db.Column(db.String, nullable = False)
    owner = db.Column(db.String)
    track_count = db.Column(db.Integer)
    image_url = db.Column(db.String)
    spotify_url = db.Column(db.String)

    def __init__(self, id, name, owner, track_count, image_url, spotify_url):
        self.id = id
        self.name = name
        self.owner = owner
        self.track_count = track_count
        self.image_url = image_url
        self.spotify_url = spotify_url



