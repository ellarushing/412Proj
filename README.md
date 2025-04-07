# Music Recommendations

### 🛠️ Tech Stack

- **Frontend**: React
- **Backend**: Go + GORM
- **Database**: PostgreSQL
- **Auth**: Spotify OAuth 2.0
- **APIs**: Spotify Web API

- **C** : Add a new playlist or song rating; R: Get user playlists or recommendations;
- **R** : Get user playlists or recommendations
- **U** : Update user preferences or ratings
- **D** : Remove a song from recommendations

- **Complex Query 1** : Recursive query to fetch all related artists
- **Complex Query 2**: A query using window functions to rank songs by similarity score or frequency

```
spotify-recommender/
├── backend/
│   ├── controllers/
        ├── auth_controller.go
        ├── spotify_controller.go
        ├── recommendations_controller.go
│   ├── models/
│   │   ├── user.go
│   │   ├── song.go
│   │   ├── artist.go
│   │   ├── playlist.go
│   │   ├── similarity.go
│   │   └── playlist_song.go
│   ├── routes/
│   │   └── routes.go
│   ├── services/
│   │   ├── spotify.go
│   │   └── recommendation.go
│   ├── database/
│   │   └── connect.go
│   ├── config/
│   │   └── config.go
│   ├── go.mod
│   ├── go.sum
│   └── main.go
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
