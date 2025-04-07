package config

import (
	"log"
	"os"
	"github.com/joho/godotenv"
)

// define the variables
var (
	SpotifyClientID	string
	SpotifyClientSecret string
	RedirectURI string
)

// get the variables from the env file
func LoadConfig() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal(("Error loading .env file"))
	}
	SpotifyClientID = os.Getenv("SPOTIFY_CLIENT_ID")
	SpotifyClientSecret = os.Getenv("SPOTIFY_CLIENT_SECRET")
	RedirectURI = os.Getenv("SPOTIFY_REDIRECT_URI")
}

