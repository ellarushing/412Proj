from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import config
# auth_bp is the blueprint for routing
from auth_routes import auth_bp
import db
from flask_cors import CORS


app = Flask(__name__)
app.secret_key = config.FLASK_SECRET_KEY # from config.py
app.config['SQLALCHEMY_DATABASE_URI'] = config.DATABASE_URL
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db.db.init_app(app)

# Updated CORS configuration - allow both localhost:5173 and 127.0.0.1:5173
CORS(app,
    supports_credentials=True,
    origins=["http://127.0.0.1:5173"],
    expose_headers=["Content-Type", "Authorization"],
    allow_headers=["Content-Type", "Authorization"])

app.register_blueprint(auth_bp, url_prefix='/auth')


@app.route("/")
def home():
    return "<p> It works </p>"



if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5001, debug=True)