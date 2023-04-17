#!/usr/bin/env bash

# Install: Xcode, Homebrew, avrdude, avr-gcc

echo ""
echo "- Installing development software..."
echo ""

# Ask for the administrator password upfront
echo "- Checking password..."
echo ""
sudo -v

# Install Xcode command line tools
echo "- Installing Xcode command line tools..."
echo ""
xcode-select --install
echo ""

# Install Homebrew and update
echo "- Installing Homebrew..."
echo ""
if test ! $(which brew); then
  echo ""
  echo "Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Make sure we’re using the latest Homebrew.
echo "- Checking if Homebrew is up-to-date..."
echo ""
brew update

# Install avrdude
echo ""
echo "- Installing avrdude..."
echo ""
brew install avrdude

# Install avr-gcc
#echo ""
#echo "- Installing avr-gcc..."
#echo ""
#brew tap osx-cross/avr
#brew install avr-gcc

# Install avra
#echo ""
#echo "- Installing avra..."
#echo ""
#brew install avra

# Install tavrasm
echo ""
echo "- Installing tavrasm..."
echo ""
brew tap tristanperich/homebrew-tavrasm
brew install tavrasm

echo ""
echo "Done"
echo ""

