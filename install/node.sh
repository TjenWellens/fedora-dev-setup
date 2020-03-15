#!/usr/bin/env zsh

set -Eeuxo pipefail

# Node
export SHELL="zsh"
curl -L https://git.io/n-install | bash -s - '-y'
source ~/.zshrc
npm i -g meta
npm i -g loop