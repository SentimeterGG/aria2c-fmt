#!/usr/bin/env bash
set -e

SCRIPT_NAME="aria2c-fmt"
INSTALL_PATH="/usr/local/bin/$SCRIPT_NAME"

echo ":: Removing $SCRIPT_NAME..."

sudo rm -f "$INSTALL_PATH"

sudo sed -i '\|aria2c-fmt|d' /etc/pacman.conf

echo ":: Removal complete."
