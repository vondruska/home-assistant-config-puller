#!/bin/sh
echo "Setting up Git..."
mkdir -p "$XDG_CONFIG_HOME/git"

git config --file="$XDG_CONFIG_HOME/git/config" credential.helper 'store'

echo "https://$GIT_USERNAME:$GIT_PASSWORD@$GIT_HOST" > "$XDG_CONFIG_HOME/git/credentials"
