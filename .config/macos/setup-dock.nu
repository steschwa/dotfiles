#!/usr/bin/env nu

# prevent changing dock position
defaults write com.apple.Dock position-immutable -bool true

# prevent resizing dock
defaults write com.apple.Dock size-immutable -bool true

# hide dock if unused
defaults write com.apple.Dock autohide -bool true

# set dock icons size
defaults write com.apple.Dock tilesize -int 46

killall Dock
