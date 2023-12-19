#!/bin/bash
set -eux

CHEZMOI_RELEASE_URL="https://github.com/twpayne/chezmoi/releases"
# get file in tmp
latest_url=$(curl -fsSL -o /dev/null -w "%{url_effective}" \
"$CHEZMOI_RELEASE_URL/latest")
latest_version=${latest_url##*/v}

curl -sfSL "$CHEZMOI_RELEASE_URL/download/v$latest_version/chezmoi-linux-amd64" \
	-o /tmp/chezmoi
chmod +x /tmp/chezmoi
mv /tmp/chezmoi "$HOME/.local/bin/chezmoi"

export PATH="$PATH:/usr/local/bin/chezmoi"

chezmoi init https://github.com/efficacy38/chezmoi-dotfile.git
chezmoi update

