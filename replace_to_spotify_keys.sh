#!/bin/bash

read -p "Enter your client ID: " client_id

read -p "Enter your client secret: " client_secret

file_paths=(
    "generate_spotify_access_token.sh" 
    "lib/config.dart" 
)

for file_path in "${file_paths[@]}"; do

  sed -i "s/<your client id>/$client_id/g" "$file_path"
  sed -i "s/<your client secret>/$client_secret/g" "$file_path"
  echo "Replaced values in $file_path"
done

echo "Replacement completed for all files."