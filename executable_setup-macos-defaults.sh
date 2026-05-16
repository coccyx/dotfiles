#!/bin/bash

# Configures macOS system preferences from the command line.
# Run once on a fresh machine after apps are installed.

set -e

# --- Appearance ---
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# --- Dock ---
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 53
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 93

# --- Keyboard: Mission Control shortcuts ---
# Move left a space: Ctrl+Left Arrow
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:79:enabled true" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:79:value:parameters:0 65535" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:79:value:parameters:1 123" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:79:value:parameters:2 11796480" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Move left a space: Ctrl+Shift+Left Arrow
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:80:enabled true" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:80:value:parameters:0 65535" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:80:value:parameters:1 123" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:80:value:parameters:2 11927552" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Move right a space: Ctrl+Right Arrow
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:81:enabled true" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:81:value:parameters:0 65535" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:81:value:parameters:1 124" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:81:value:parameters:2 11796480" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Move right a space: Ctrl+Shift+Right Arrow
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:82:enabled true" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:82:value:parameters:0 65535" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:82:value:parameters:1 124" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:82:value:parameters:2 11927552" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Mission Control: Ctrl+Up Arrow
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:32:enabled true" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:32:value:parameters:0 65535" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:32:value:parameters:1 126" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:32:value:parameters:2 11796480" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# Application windows (Expose): Ctrl+Down Arrow
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:33:enabled true" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:33:value:parameters:0 65535" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:33:value:parameters:1 125" ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:33:value:parameters:2 11796480" ~/Library/Preferences/com.apple.symbolichotkeys.plist

# --- Finder: use list view ---
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# --- Rectangle: import config ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/rectangle-config.plist" ]; then
    defaults import com.knollsoft.Rectangle "$SCRIPT_DIR/rectangle-config.plist"
fi

# --- Restart affected services ---
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true

echo "macOS defaults configured. Log out and back in for keyboard shortcuts to take effect."
