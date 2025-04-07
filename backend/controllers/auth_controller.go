/*
auth_controller is in charge of
	- handling incoming HTTP requests
	- running logic
	- send back responses

Handles everything related to who is allowed in and credentials
	- Spotify OAuth
	- building /login and /callback


*/

// declares as part of the controllers package for organization
package controllers

import (
	"bytes"         // build HTTP body data
	"encoding/json" // parse and return JSON
	"fmt"           // format strings for Printf etc
	"io"            // reading HTTP response body
	"net/http"      // making HTTP Requests and responses
	"net/url"       // encode paramters into url
	"spotify-recommender/config"

	"github.com/gin-gonic/gin" // import gin framework for http routes
)

func login(c *gin.Context) {
	/* scope is telling spotify what kind of access we need
		https://developer.spotify.com/documentation/web-api/concepts/scopes
		- user-read-private
			- Country
			- Display Name
			- Profile Image
			- Spotify Premium (Y/N)
		- user-read-email
			- email address
	*/
	scope := "user-read-private user-read-email"
	/*
	fmt.Sprintf -> builds spotify login url
	https://developer.spotify.com/documentation/web-api/tutorials/code-flow
		- this shows the redirect flow
	*/
	params := url.Values{}
	params.Set("client_id", config.SpotifyClientID)
	params.Set("response_type", "code")
	params.Set("redirect_uri", config.RedirectURI)
	params.Set("scope", scope)
	redirectURL := "https://accounts.spotify.com/authorize?" + params.Encode()
	c.Redirect(http.StatusTemporaryRedirect, redirectURL)
}



