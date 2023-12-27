#!/bin/bash

################################################################################
# Script: generate_spotify_access_token.sh
# Description: A Bash script to generate a Spotify Access Token using client credentials.
#              Follow the instructions provided in the link for more details: 
#              https://developer.spotify.com/documentation/web-api/tutorials/getting-started
################################################################################

# Usage:
#   1. Replace '<your_client_id>' with your actual Spotify Developer Client ID.
#   2. Replace '<your_client_secret>' with your actual Spotify Developer Client Secret.

# Instructions:
#   - Visit https://developer.spotify.com/documentation/web-api/tutorials/getting-started
#     for a step-by-step guide on how to obtain your Spotify Developer credentials.

# Endpoint: Spotify Token API
SPOTIFY_TOKEN_URL="https://accounts.spotify.com/api/token"

# Request Access Token using Client Credentials
curl -X POST "$SPOTIFY_TOKEN_URL" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=<your client id>&client_secret=<your client secret>" > spotify_access_token.json

# Notes:
#   - This script generates a Spotify Access Token using client credentials.
#   - Ensure that you have the correct client ID and client secret from the Spotify Developer Dashboard.
#   - The generated access token is saved in the 'spotify_access_token.json' file.
#   - Make sure to keep your credentials secure and do not share them publicly.