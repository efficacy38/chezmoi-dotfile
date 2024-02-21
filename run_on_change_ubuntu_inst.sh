#!/bin/bash

# update deb package repository
type -p curl >/dev/null || (
	sudo apt update && \
	sudo apt install curl -y
)

# setup gh cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
	sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
	sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | \
	sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# setup glab cli
curl -L https://packages.gitlab.com/glab/glab/gpgkey | sudo apt-key add -
sudo curl -o /etc/apt/sources.list.d/glab.list https://packages.gitlab.com/glab/glab/ubuntu/$(lsb_release -cs)/glab.list


# install packages
sudo apt-get update
sudo apt-get install -y glab gh ripgrep bat libnotify-bin

# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

