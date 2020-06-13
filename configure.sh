#!/bin/bash

TMP_DIR="/tmp/"$(uuidgen)

mkdir -p ${TMP_DIR}
cd ${TMP_DIR}

##############################################################################
## CONFIGS
##############################################################################
echo "Applying MAC Default configs . . ."
# Show Full File Path in Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES; killall Finder

# Make Hidden Apps “Hidden” in Dock
defaults write com.apple.Dock showhidden -bool TRUE; killall Dock

# Eliminate the Dock Reveal Delay
defaults write com.apple.dock autohide-time-modifier -float 0.12;killall Dock

# Change Mac software update frequency in days
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 3

# Disable different language options, and enable key repeat on hold
defaults write -g ApplePressAndHoldEnabled -bool FALSE

# Login Window Text
sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "This mac is attached to an icloud account. The device is rendered useless without access to icloud. if found pls call +17747019412. Reward included"

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -boolean TRUE; killall Dock

# Change screenshot type to png/pdf/tiff/jpg
sudo defaults write com.apple.screencapture type png

##############################################################################
## Packages
##############################################################################
echo "Installing Packages . . ."
# Install Mac Development Tools
sudo xcode-select --install

echo "Installing Homebrew . . ."
# Install Homebrew
CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Brew packages
brew install wget fish ranger figlet pandoc tree coreutils koekeishiya/formulae/skhd koekeishiya/formulae/yabai mas docker

# Tap cask
brew tap homebrew/cask

# Move config files here
cp .skhdrc ~/
cp .yabairc ~/

# Start services
brew services start koekeishiya/formulae/skhd
brew services start koekeishiya/formulae/yabai

# Install Conda
wget https://repo.anaconda.com/archive/Anaconda3-2020.02-MacOSX-x86_64.sh
bash Anaconda3-2020.02-MacOSX-x86_64.sh -b

# Install Iterm
wget https://iterm2.com/downloads/stable/iTerm2-3_3_11.zip
unzip iTerm2-3_3_11.zip
mv iTerm.app /Applications

# Install BTT
wget https://folivora.ai/releases/BetterTouchTool.zip
unzip BetterTouchTool.zip
mv BetterTouchTool.app /Applications

# Install Cheatsheet
wget https://mediaatelier.com/CheatSheet/CheatSheet_1.3.4.zip
unzip CheatSheet_1.3.4.zip
mv CheatSheet.app /Applications

# Install Bartender
wget https://www.macbartender.com/Demo/Bartender%203.zip
unzip Bartender\ 3.zip
mv Bartender\ 3.app /Applications

# Install Filezilla
wget https://dl4.cdn.filezilla-project.org/client/FileZilla_3.48.1_macosx-x86.app.tar.bz2?h=MAKcjBSdfxcOYs6S_OsUBg&x=1592055745
tar -xvf FileZilla_3.48.1_macosx-x86.app.tar.bz2
mv FileZilla.app /Applications

# App Cleaner
wget https://freemacsoft.net/downloads/AppCleaner_3.5.zip
unzip AppCleaner_3.5.zip
mv AppCleaner.app /Applications

# Install Trashit
wget https://nonamescriptware.com/wp-content/uploads/Trashit.zip
unzip Trashit.zip
mv Trash\ It\!\ 7.5 /Applications

# Install Mac Fans Control
wget https://crystalidea.com/downloads/macsfancontrol.zip
unzip macsfancontrol.zip
mv Macs\ Fan\ Control.app /Applications

##############################################################################
## Cask Application
##############################################################################

# Install terminal fonts
brew tap homebrew/cask-fonts && brew cask install font-iosevka && brew cask install font-iosevka-slab

# Install Chrome
brew cask install google-chrome sublime-text monitorcontrol vlc zoom handbrake all-in-one-messenger transmission

# Signin to mas
mas signin kingspprathyush@gmail.com

# Install Amphetamine
mas lucky amphetamine

# Install Irvue
mas lucky irvue

# Install Timeout
mas lucky timeout

##############################################################################
## Cleanup
##############################################################################
echo "Cleaning up temporary files . . ."
rm -rf ${TMP_DIR}

echo "####################################"
echo "Installation Completed Successfully"
echo "####################################"

