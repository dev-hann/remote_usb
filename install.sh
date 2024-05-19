#!/bin/bash

# Base URL for the files
BASE_URL="https://github.com/dev-hann/remote_usb/releases/latest/download"

# Determine the OS type
OS_TYPE=$(uname)

# Set the file name based on the OS type
if [ "$OS_TYPE" == "Linux" ]; then
    FILE_URL="$BASE_URL/rusb_unix"
elif [ "$OS_TYPE" == "Darwin" ]; then
    FILE_URL="$BASE_URL/rusb_osx"
else
    echo "Unsupported OS: $OS_TYPE"
    exit 1
fi

# Destination directory
DEST_DIR="/usr/local/sbin"

# Filename
FILE_NAME="rusb"

# Check if the destination directory exists
if [ ! -d "$DEST_DIR" ]; then
    echo "Error: Destination directory $DEST_DIR does not exist."
    exit 1
fi

# Download the file
echo "Downloading $FILE_NAME from $FILE_URL..."
curl -L -o "$FILE_NAME" "$FILE_URL"

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to download $FILE_NAME."
    exit 1
fi

# Move the file to the destination directory
echo "Copying $FILE_NAME to $DEST_DIR..."
sudo mv "$FILE_NAME" "$DEST_DIR/"

# Check if the move was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy $FILE_NAME to $DEST_DIR."
    exit 1
fi

# Make the file executable
echo "Making $DEST_DIR/$FILE_NAME executable..."
sudo chmod +x "$DEST_DIR/$FILE_NAME"

# Check if chmod was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to make $FILE_NAME executable."
    exit 1
fi

echo "Successfully installed $FILE_NAME to $DEST_DIR."
