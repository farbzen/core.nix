#!/usr/bin/env bash
echo ":: Refreshing nix-index cache"
filename="index-$(uname -m | sed 's/^arm64$/aarch64/')-$(uname | tr "[:upper:]" "[:lower:]")"
mkdir -p ~/.cache/nix-index && cd ~/.cache/nix-index || exit 1
wget -q -N "https://github.com/nix-community/nix-index-database/releases/latest/download/${filename}"
ln -f "${filename}" files
echo ":: Done"
