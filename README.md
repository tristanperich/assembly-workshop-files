# Tristan Perich: Introduction to Hardware Programming in Assembly Language

A few development tools are required. Please install the following:

## 1. Install Xcode:
Xcode includes the basic developer tools for the Mac OS.

To install, open Terminal and run:
```
xcode-select --install
```

## 2. Install Homebrew:
Homebrew is a package manager for the Mac OS, which makes it easy to install various development tools and libraries.
You may need to enter your admin password, or press "enter" to continue the installation.

To install, open Terminal and run:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/administrator/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/administrator/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## 3. Install avrdude:
avrdude is the tool used to download code onto an AVR microchip.

To install, open Terminal and run:
```
brew install avrdude
```


## 4. Install tavrasm:
tavrasm is a tool that assembles code files in assembly language. To install, open Terminal and run:
To install, open Terminal and run:

```
brew tap tristanperich/homebrew-tavrasm
brew install tavrasm
```
