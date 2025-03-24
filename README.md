# Music Recommendations

```
spotify-recommender/
├── backend/
│   ├── app/
│   │   ├── models/
│   │   │   ├── __init__.py
│   │   │   ├── user.py
│   │   │   ├── song.py
│   │   │   ├── artist.py
│   │   │   ├── playlist.py
│   │   │   └── similarity.py
│   │   ├── routes/
│   │   │   ├── __init__.py
│   │   │   ├── main.py
│   │   │   ├── auth.py
│   │   │   ├── spotify.py
│   │   │   └── recommendations.py
│   │   ├── services/
│   │   │   ├── __init__.py
│   │   │   ├── spotify_service.py
│   │   │   └── recommendation_service.py
│   │   └── __init__.py
│   ├── config.py
│   ├── requirements.txt
│   └── run.py
├── frontend/
│   ├── public/
│   │   ├── index.html
│   │   ├── favicon.ico
│   │   └── manifest.json
│   ├── src/
│   │   ├── components/
│   │   │   ├── Login.jsx
│   │   │   ├── Register.jsx
│   │   │   ├── Dashboard.jsx
│   │   │   ├── Navbar.jsx
│   │   │   ├── SpotifyCallback.jsx
│   │   │   ├── Playlists.jsx
│   │   │   └── Recommendations.jsx
│   │   ├── services/
│   │   │   └── api.js
│   │   ├── App.js
│   │   ├── index.js
│   │   └── index.css
│   ├── package.json
│   └── README.md
└── database/
    ├── schema.sql
    └── sample_data.sql
```
