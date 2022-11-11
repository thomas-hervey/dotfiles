#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

echo "installing nvm"
brew install nvm											# node version manager

# Remove outdated versions from the cellar.
brew cleanup

echo "installing a version of node"
# test to see if nvm folder exists
if [ ! -d ~/.nvm ]; then
  mkdir ~/.nvm
fi
# export nvm dir path to .zshrc
printf '\n#### Node version manager ####\n' >> ~/.zshrc
echo 'export NVM_DIR=~/.nvm'  >> ~/.zshrc
echo 'source $(brew --prefix nvm)/nvm.sh' >> .zshrc

# install node
nvm install node


echo "Installing npm, yarn"
brew install npm											# Package manager
brew install yarn											# Package manager

echo "Installing global npm packages..."
npm install -g create-react-app       # React starter
npm install -g eslint									# JS linter
npm install -g babel-eslint						# es7 eslint
npm install -g eslint-config-airbnb		# Airbnb's .eslintrc as an extensible shared config
npm install -g eslint-config-prettier	# Turns off all rules that are unnecessary or might conflict with Prettier.


npm install -g typescript # install typescript
npm install -g ts-node # install ts-node
npm install -g tslint # install tslint


npm install -g expo-cli								# The command-line tool for creating and publishing Expo apps
npm install -g express								# Fast, unopinionated, minimalist web framework for node.
npm install -g express-generator			# Express' application generator
npm install -g @google-cloud/storage  # GCS
npm install -g lighthouse             # Audit tool
npm install -g loadtest               # API load testing
npm install -g @nestjs/cli            # NestJS API scaffolding
npm install -g prettier								# Prettier is an opinionated code formatter
npm install -g webpack								# Packs CommonJs/AMD modules for the browser