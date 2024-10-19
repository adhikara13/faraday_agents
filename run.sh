#!/bin/bash

read -p "Enter the token: " TOKEN

CONFIG_DIR="./configs"
if [ ! -d "$CONFIG_DIR" ]; then
  echo "Configs directory not found: $CONFIG_DIR"
  exit 1
fi

# Iterate over each .yaml file in the configs directory and run the command in parallel
for CONFIG_FILE in "$CONFIG_DIR"/*.yaml; do
  if [ -f "$CONFIG_FILE" ]; then
    # Run the faraday-dispatcher command in the background
    faraday-dispatcher run --config-file "$CONFIG_FILE" --token "$TOKEN" &
    echo "Started: faraday-dispatcher run --config-file $CONFIG_FILE --token $TOKEN"
  fi
done