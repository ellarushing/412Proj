from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import config
# auth_bp is the blueprint for routing
from auth_routes import auth_bp
import db

app = Flask(__name__)
app.secret_key = config.FLASK_SECRET_KEY # from config.py
app.config['SQLALCHEMY_DATABASE_URI'] = config.DATABASE_URL
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db.db.init_app(app)

app.register_blueprint(auth_bp, url_prefix='/auth')


@app.route("/")
def home():
    return "<p> It works </p>"



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)