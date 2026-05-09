#!/usr/bin/env bash

set -e

SCRIPT_NAME="aria2c-fmt"
INSTALL_PATH="/usr/local/bin/$SCRIPT_NAME"

echo ":: Installing $SCRIPT_NAME..."

sudo install -Dm755 "$SCRIPT_NAME" "$INSTALL_PATH"

if ! grep -q "XferCommand.*aria2c-fmt" /etc/pacman.conf; then
  echo ":: Adding XferCommand to pacman.conf..."
  echo "" | sudo tee -a /etc/pacman.conf >/dev/null
  echo "XferCommand = $INSTALL_PATH -x 16 -s 16 -k 1M -d / -o %o %u" | sudo tee -a /etc/pacman.conf >/dev/null
else
  echo ":: XferCommand already exists."
fi

echo ":: Installation complete."
