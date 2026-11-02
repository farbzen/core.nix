#!/usr/bin/env bash
nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history
