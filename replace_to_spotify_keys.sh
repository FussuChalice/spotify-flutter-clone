#!/bin/bash

################################################################################
# Script: replace_to_spotify_keys.sh
# Description: A Bash script to replace placeholder values in specified files
#              with Spotify Developer credentials (Client ID and Client Secret).
################################################################################

# Usage:
#   1. Run the script.
#   2. Enter your Spotify Developer Client ID and Client Secret when prompted.

# Files to be updated with Spotify Developer credentials
file_paths=(
    "generate_spotify_access_token.sh" 
    "lib/config.dart" 
)

# Prompt user for Spotify Developer credentials
read -p "Enter your client ID: " client_id
read -p "Enter your client secret: " client_secret

# Replace placeholder values in specified files
for file_path in "${file_paths[@]}"; do
  sed -i "s/<your client id>/$client_id/g" "$file_path"
  sed -i "s/<your client secret>/$client_secret/g" "$file_path"
  echo "Replaced values in $file_path"
done

echo "Replacement completed for all files."