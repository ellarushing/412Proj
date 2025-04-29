// src/App.jsx
import { useEffect, useState } from 'react'

const BACKEND = 'http://127.0.0.1:5001/auth'

export default function App() {
  const [playlists, setPlaylists] = useState([])
  const [tracks, setTracks] = useState([])
  const [selectedPlaylistID, setId] = useState(null)
  const [loggedIn, setLoggedIn] = useState(false)

  // setLoading -> rerender the components
  const [loading, setLoading] = useState(false)

  const [message, setMessage] = useState('')

  const [searchTerm, setSearchTerm] = useState('')
  const [searchResults, setSearchResults] = useState([])

  const [playlistName, setPlaylistName] = useState('')

  const [showTopTracks, setShowTopTracks] = useState(false)
  const [topTracks, setTopTracks] = useState([])

  const [showLongTracks, setShowLongTracks] = useState(false)
  const [longTracks, setLongTracks] = useState([])

  // check to see if we're logged in
  useEffect(() => {
    checkLoginStatus()
  }, [])

  // make sure we're logged in
  const checkLoginStatus = () => {
    setLoading(true)
    fetch(`${BACKEND}/playlistAll`, {
      credentials: 'include',
      redirect: 'manual'
    })
      .then(res => {
        // safety precaution
        if (res.type === 'opaqueredirect') {
          // We're not logged in
          setLoggedIn(false)
          setMessage('Please log in to access your playlists')
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(data => {
        setLoggedIn(true)
        setPlaylists(data.playlists)  // might be []
        // is there a playlist, if not, need to try and resync the playlist
        setMessage(data.playlists.length > 0 ? 'Successfully loaded playlists' : 'No playlists found. Try syncing your playlists.')
      })
      .catch((err) => {
        console.log("Error in checkLoginStatus:", err.message)
        // Make sure we set loggedIn to false when we catch errors
        setLoggedIn(false)
      })
      .finally(() => setLoading(false))
  }

  // Spotify OAAuth
  const login = () => {
    setMessage('Redirecting to Spotify login...')
    // Direct browser navigation instead of fetch
    window.location.href = `${BACKEND}/login`
  }

  
  // Sync into the DB, then re-fetch playlists
  const syncPlaylists = () => {
    setLoading(true)
    setMessage('Syncing playlists...')
    fetch(`${BACKEND}/sync_playlists`, {
      credentials: 'include',
      redirect: 'manual'
    })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(() => {
        setMessage('Playlists synced successfully!')
        return fetch(`${BACKEND}/playlistAll`, {
          credentials: 'include',
          redirect: 'manual'
        })
      })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(data => setPlaylists(data.playlists))
      .catch(err => {
        console.error("Error in syncPlaylists:", err.message)
        setMessage('Error syncing playlists')
        if (err.message === 'not logged in') {
          setLoggedIn(false)
        }
      })
      .finally(() => setLoading(false))
  }

  // Load tracks when a playlist is clicked
  const handlePlaylistClick = (id) => {
    setLoading(true)
    setId(id)
    setTracks([])
    setMessage(`Loading tracks from playlist...`)
    
    // First, sync tracks for this playlist
    fetch(`${BACKEND}/sync_tracks/${id}`, {
      credentials: 'include',
      redirect: 'manual'
    })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(() => {
        // Then fetch the tracks
        return fetch(`${BACKEND}/playlist_tracks/${id}`, {
          credentials: 'include',
          redirect: 'manual'
        })
      })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(data => {
        setTracks(data.tracks)
        setMessage(`Loaded ${data.tracks.length} tracks`)
      })
      .catch(err => {
        console.error("Error in handlePlaylistClick:", err.message)
        setMessage('Error loading tracks')
        if (err.message === 'not logged in') {
          setLoggedIn(false)
        }
      })
      .finally(() => setLoading(false))
  }

  // Create vibe playlist
  const createVibePlaylist = () => {
    setLoading(true)
    setMessage('Creating vibe playlist...')
    fetch(`${BACKEND}/create_vibe_playlist`, {
      credentials: 'include',
      redirect: 'manual'
    })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(data => {
        setMessage(data.message)
        // Refresh playlists to show the new one
        return fetch(`${BACKEND}/playlistAll`, {
          credentials: 'include',
          redirect: 'manual'
        })
      })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(data => setPlaylists(data.playlists))
      .catch(err => {
        console.error("Error in createVibePlaylist:", err.message)
        setMessage('Error creating vibe playlist')
        if (err.message === 'not logged in') {
          setLoggedIn(false)
        }
      })
      .finally(() => setLoading(false))
  }

  // Update playlist name
  const updatePlaylistName = (playlistId) => {
    if (!playlistName.trim()) {
      setMessage('Please enter a playlist name')
      return
    }
    
    setLoading(true)
    setMessage('Updating playlist name...')
    
    const formData = new FormData()
    formData.append('new_name', playlistName)
    
    fetch(`${BACKEND}/update_playlist_name/${playlistId}`, {
      method: 'POST',
      credentials: 'include',
      redirect: 'manual',
      body: formData
    })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(data => {
        setMessage(data.message)
        // Refresh playlists to show the updated name
        return fetch(`${BACKEND}/playlistAll`, {
          credentials: 'include',
          redirect: 'manual'
        })
      })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(data => {
        setPlaylists(data.playlists)
        setPlaylistName('') // Clear input
      })
      .catch(err => {
        console.error("Error in updatePlaylistName:", err.message)
        setMessage('Error updating playlist name')
        if (err.message === 'not logged in') {
          setLoggedIn(false)
        }
      })
      .finally(() => setLoading(false))
  }

  // Delete playlist
  const deletePlaylist = (playlistId) => {
    if (!confirm('Are you sure you want to delete this playlist?')) return
    
    setLoading(true)
    setMessage('Deleting playlist...')
    fetch(`${BACKEND}/delete_playlist/${playlistId}`, {
      credentials: 'include',
      redirect: 'manual'
    })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        // Function may not return json
        if (res.headers.get('content-type')?.includes('application/json')) {
          return res.json()
        }
        return {}
      })
      .then(() => {
        setMessage('Playlist deleted successfully')
        if (selectedPlaylistID === playlistId) {
          setId(null)
          setTracks([])
        }
        // Refresh playlists
        return fetch(`${BACKEND}/playlistAll`, {
          credentials: 'include',
          redirect: 'manual'
        })
      })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(data => setPlaylists(data.playlists))
      .catch(err => {
        console.error("Error in deletePlaylist:", err.message)
        setMessage('Error deleting playlist')
        if (err.message === 'not logged in') {
          setLoggedIn(false)
        }
      })
      .finally(() => setLoading(false))
  }

  // Search tracks
  const searchTracks = () => {
    if (!searchTerm.trim()) {
      setMessage('Please enter a search term')
      return
    }
    
    setLoading(true)
    setMessage('Searching tracks...')
    fetch(`${BACKEND}/search_tracks/${encodeURIComponent(searchTerm)}`, {
      credentials: 'include',
      redirect: 'manual'
    })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(data => {
        setSearchResults(data.matching_tracks)
        setMessage(`Found ${data.matching_tracks.length} tracks matching "${searchTerm}"`)
      })
      .catch(err => {
        console.error("Error in searchTracks:", err.message)
        setMessage('Error searching tracks')
        if (err.message === 'not logged in') {
          setLoggedIn(false)
        }
      })
      .finally(() => setLoading(false))
  }

  // Get top 5 tracks
  const fetchTopTracks = () => {
    setLoading(true)
    setMessage('Fetching top tracks...')
    fetch(`${BACKEND}/top_five`, {
      credentials: 'include',
      redirect: 'manual'
    })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(data => {
        setTopTracks(data.top_tracks)
        setShowTopTracks(true)
        setMessage(`Loaded top ${data.top_tracks.length} tracks by popularity`)
      })
      .catch(err => {
        console.error("Error in fetchTopTracks:", err.message)
        setMessage('Error fetching top tracks')
        if (err.message === 'not logged in') {
          setLoggedIn(false)
        }
      })
      .finally(() => setLoading(false))
  }

  // Get long tracks
  const fetchLongTracks = () => {
    setLoading(true)
    setMessage('Fetching long tracks...')
    fetch(`${BACKEND}/long_tracks`, {
      credentials: 'include',
      redirect: 'manual'
    })
      .then(res => {
        if (res.type === 'opaqueredirect') {
          throw new Error('not logged in')
        }
        return res.json()
      })
      .then(data => {
        setLongTracks(data.long_tracks)
        setShowLongTracks(true)
        setMessage(`Loaded ${data.long_tracks.length} tracks longer than 5 minutes`)
      })
      .catch(err => {
        console.error("Error in fetchLongTracks:", err.message)
        setMessage('Error fetching long tracks')
        if (err.message === 'not logged in') {
          setLoggedIn(false)
        }
      })
      .finally(() => setLoading(false))
  }

  // Formats milliseconds to mm:ss
  const formatDuration = (ms) => {
    const minutes = Math.floor(ms / 60000)
    const seconds = ((ms % 60000) / 1000).toFixed(0)
    return `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`
  }

  // function to display Tracks
  const TrackDisplay = ({ tracks, title }) => (
    <div>
      <h2>{title}</h2>
      <div style={{ display: 'flex', flexWrap: 'wrap' }}>
        {tracks.map((t, i) => (
          <div key={i} style={{ margin: 10, width: 150, textAlign: 'center' }}>
            {t.album_image_url && (
              <img
                src={t.album_image_url}
                alt=""
                style={{ width: 120, height: 120, objectFit: 'cover' }}
              />
            )}
            <p style={{ marginBottom: 0 }}><b>{t.name}</b></p>
            <p style={{ marginTop: 5 }}>{t.artist}</p>
            <div style={{ fontSize: '0.8rem' }}>
              <span>🔥 {t.popularity}</span>
              <span style={{ marginLeft: 10 }}>⏱️ {formatDuration(t.duration_ms)}</span>
            </div>
          </div>
        ))}
      </div>
    </div>
  )

  return (
    <div style={{ padding: 20, maxWidth: 1200, margin: '0 auto' }}>
      <h1>Spotify Playlist Application</h1>

      {!loggedIn && (
        <div style={{ marginBottom: 20, textAlign: 'center' }}>
          <p>Please log in with Spotify to access your playlists.</p>
          <button
            onClick={login}
            style={{
              backgroundColor: '#1DB954',
              color: '#F3E9DC',
              border: 'none',
              padding: '10px 20px',
              borderRadius: '20px',
              fontSize: '16px',
              fontWeight: 'bold',
              cursor: 'pointer'
            }}
          >
            Login with Spotify
          </button>
        </div>
      )}

      {/* Sync once logged in */}
      {loggedIn && (
        <div style={{ marginBottom: 20 }}>
          <button
            onClick={syncPlaylists}
            style={{
              backgroundColor: '#271C1B',
              color: '#F3E9DC',
              border: 'none',
              padding: '10px 20px',
              borderRadius: '4px',
              margin: '0 10px 10px 0',
              cursor: 'pointer'
            }}
          >
            Sync My Playlists
          </button>
          
          <button
            onClick={createVibePlaylist}
            style={{
              backgroundColor: '#855C40',
              color: '#F3E9DC',
              border: 'none',
              padding: '10px 20px',
              borderRadius: '4px',
              margin: '0 10px 10px 0',
              cursor: 'pointer'
            }}
          >
            Create Vibe Playlist
          </button>
          
          <button
            onClick={fetchTopTracks}
            style={{
              backgroundColor: '#AD5438',
              color: '#F3E9DC',
              border: 'none',
              padding: '10px 20px',
              borderRadius: '4px',
              margin: '0 10px 10px 0',
              cursor: 'pointer'
            }}
          >
            Show Top Tracks
          </button>
          
          <button
            onClick={fetchLongTracks}
            style={{ 
              backgroundColor: '#D49175',
              color: '#F3E9DC',
              border: 'none',
              padding: '10px 20px',
              borderRadius: '4px',
              margin: '0 10px 10px 0',
              cursor: 'pointer'
            }}
          >
            Show Long Tracks
          </button>
        </div>
      )}

      {/* Search functionality */}
      {loggedIn && (
        <div style={{ marginBottom: 20 }}>
          <input
            type="text"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            placeholder="Search tracks..."
            style={{
              color: '#F3E9DC',
              padding: '10px',
              borderRadius: '4px',
              border: '1px solid #ccc',
              width: '300px',
              marginRight: '10px'
            }}
            onKeyPress={(e) => e.key === 'Enter' && searchTracks()}
          />
          <button
            onClick={searchTracks}
            style={{
              backgroundColor: '#BFA188',
              color: '#F3E9DC',
              border: 'none',
              padding: '10px 20px',
              borderRadius: '4px',
              cursor: 'pointer'
            }}
          >
            Search
          </button>
        </div>
      )}

      <div style={{ display: 'flex', flexWrap: 'wrap', gap: '20px' }}>
        {/* Left column - Playlists */}
        {loggedIn && playlists.length > 0 && (
          <div style={{ flex: '1', minWidth: '300px' }}>
            <h2>Your Playlists</h2>
            <ul style={{ color: '#F3E9DC', listStyle: 'none', padding: 0 }}>
              {playlists.map(pl => (
                <li key={pl.id} style={{ margin: '8px 0', display: 'flex', alignItems: 'center' }}>
                  <button
                    onClick={() => handlePlaylistClick(pl.id)}
                    style={{
                      flex: '1',
                      backgroundColor: selectedPlaylistID === pl.id ? '#6F4939' : '#F3E9DC',
                      color: selectedPlaylistID === pl.id ? '#F3E9DC' : 'black',
                      border: '1px solid #6F4939',
                      padding: '8px 15px',
                      borderRadius: '4px',
                      textAlign: 'left',
                      cursor: 'pointer'
                    }}
                  >
                    {pl.name}
                  </button>
                  <button
                    onClick={() => deletePlaylist(pl.id)}
                    style={{
                      marginLeft: '5px',
                      backgroundColor: '#C75B39',
                      color: '#F3E9DC',
                      border: 'none',
                      padding: '5px 10px',
                      borderRadius: '4px',
                      cursor: 'pointer'
                    }}
                    title="Delete playlist"
                  >
                    X
                  </button>
                </li>
              ))}
            </ul>

            {/* Update playlist name */}
            {selectedPlaylistID && (
              <div style={{ marginTop: 20 }}>
                <h3>Update Playlist Name</h3>
                <div style={{ display: 'flex' }}>
                  <input
                    type="text"
                    value={playlistName}
                    onChange={(e) => setPlaylistName(e.target.value)}
                    placeholder="New playlist name"
                    style={{
                      flex: '1',
                      padding: '8px',
                      borderRadius: '4px',
                      border: '1px solid #ccc',
                      marginRight: '10px'
                    }}
                  />
                  <button
                    onClick={() => updatePlaylistName(selectedPlaylistID)}
                    style={{
                      backgroundColor: '#BFA188',
                      color: '#F3E9DC',
                      border: 'none',
                      padding: '8px 15px',
                      borderRadius: '4px',
                      cursor: 'pointer'
                    }}
                  >
                    Update
                  </button>
                </div>
              </div>
            )}
          </div>
        )}

        {/* Right column - Content */}
        <div style={{ flex: '2', minWidth: '300px' }}>
          {/* Search Results */}
          {searchResults.length > 0 && (
            <TrackDisplay tracks={searchResults} title="Search Results" />
          )}

          {/* Top Tracks */}
          {showTopTracks && topTracks.length > 0 && (
            <TrackDisplay tracks={topTracks} title="Top 5 Tracks by Popularity" />
          )}

          {/* Long Tracks */}
          {showLongTracks && longTracks.length > 0 && (
            <TrackDisplay tracks={longTracks} title="Tracks Longer Than 5 Minutes" />
          )}

          {/* Selected Playlist Tracks */}
          {selectedPlaylistID && tracks.length > 0 && (
            <TrackDisplay tracks={tracks} title="Playlist Tracks" />
          )}
        </div>
      </div>
    </div>
  )
}