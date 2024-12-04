# Tristan Perich: Introduction to Hardware Programming in Assembly Language

Here you can install the development tools, and download the code template files for the workshop. There are a few command-line instructions to run from the Terminal app in Mac OS, which install the various tools we will use to program assembly code onto the microchips. Please also download the template code files we will use, at bottom. Currently only works on Mac OS.


## 1. Install Xcode:
Apple's Xcode includes the basic developer tools for the Mac OS.

To install, open Terminal and run (copy + paste + press enter):
```
xcode-select --install
```


## 2. Install Homebrew:
[Homebrew](https://brew.sh) is a package manager for the Mac OS, which makes it easy to install various development tools and libraries.

To install, open Terminal and run:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

You may need to enter your admin password, or press "enter" to continue the installation.


## 3. Install avrdude:
avrdude is the tool used to download code onto an AVR microchip.

To install, open Terminal and run:
```
brew install avrdude
```


## 4. Install tavrasm:
tavrasm is a tool that assembles code files in assembly language.

To install, open Terminal and run:

```
brew tap tristanperich/homebrew-tavrasm
brew install tavrasm
```


# Download Code
Download the code template files here:

https://github.com/tristanperich/assembly-workshop-files/archive/refs/heads/main.zip

