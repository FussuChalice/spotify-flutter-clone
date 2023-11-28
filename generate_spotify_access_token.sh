#!/bin/bash

:: Instruction: https://developer.spotify.com/documentation/web-api/tutorials/getting-started

curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=<your client id>&client_secret=<your client secret>" > spotify_access_token.json