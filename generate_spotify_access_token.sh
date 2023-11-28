#!/bin/bash

:: Instruction: https://developer.spotify.com/documentation/web-api/tutorials/getting-started

curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=0fa761327b7a4787a964cea122c160f4&client_secret=4e6cf52288654385a4a28ff3769d5e65" > spotify_access_token.json