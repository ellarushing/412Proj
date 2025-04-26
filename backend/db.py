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


class Tracks(db.Model):
    __tablename__ = 'tracks'

    id = db.Column(db.String, primary_key = True)
    name = db.Column(db.String, nullable = False)
    artist = db.Column(db.String)
    playlist_id = db.Column(db.String, db.ForeignKey('playlists.id'))
    popularity = db.Column(db.Integer)
    duration_ms = db.Column(db.Integer)

    def __init__(self, id, name, artist, playlist_id, popularity, duration_ms):
        self.id = id
        self.name = name
        self.artist = artist
        self.playlist_id = playlist_id
        self.popularity = popularity
        self.duration_ms = duration_ms
