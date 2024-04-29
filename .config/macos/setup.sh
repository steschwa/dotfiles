########################################################################
# Lock dock (prevent resize)
########################################################################

# enable (allow resize)
defaults write com.apple.Dock position-immutable -bool yes
defaults write com.apple.Dock size-immutable -bool yes

# disable (prevent resize)
defaults write com.apple.Dock position-immutable -bool no
defaults write com.apple.Dock size-immutable -bool no

reload dock
killall Dock
