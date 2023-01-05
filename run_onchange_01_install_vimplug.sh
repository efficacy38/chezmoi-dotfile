#!/bin/bash
set -e
set -x

# load the nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install --lts
nvm use --lts

nvim -c "PlugInstall" -c "q" -c "q"

# install coc
pushd ~/.config/nvim/autoload/plugged/coc.nvim/
npm install -g yarn
yarn install
popd

# install nvim plugins
nvim -c "CocInstall coc-yaml coc-pyright coc-clangd" -c "q" -c "q"


