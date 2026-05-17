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
HOTKEYS=~/Library/Preferences/com.apple.symbolichotkeys.plist

set_hotkey() {
    local key=$1 param0=$2 param1=$3 param2=$4
    /usr/libexec/PlistBuddy \
        -c "Delete :AppleSymbolicHotKeys:${key}" \
        -c "Add :AppleSymbolicHotKeys:${key}:enabled bool true" \
        -c "Add :AppleSymbolicHotKeys:${key}:value:type string standard" \
        -c "Add :AppleSymbolicHotKeys:${key}:value:parameters array" \
        -c "Add :AppleSymbolicHotKeys:${key}:value:parameters:0 integer ${param0}" \
        -c "Add :AppleSymbolicHotKeys:${key}:value:parameters:1 integer ${param1}" \
        -c "Add :AppleSymbolicHotKeys:${key}:value:parameters:2 integer ${param2}" \
        "$HOTKEYS" 2>/dev/null || \
    /usr/libexec/PlistBuddy \
        -c "Add :AppleSymbolicHotKeys:${key}:enabled bool true" \
        -c "Add :AppleSymbolicHotKeys:${key}:value:type string standard" \
        -c "Add :AppleSymbolicHotKeys:${key}:value:parameters array" \
        -c "Add :AppleSymbolicHotKeys:${key}:value:parameters:0 integer ${param0}" \
        -c "Add :AppleSymbolicHotKeys:${key}:value:parameters:1 integer ${param1}" \
        -c "Add :AppleSymbolicHotKeys:${key}:value:parameters:2 integer ${param2}" \
        "$HOTKEYS"
}

# Move left a space: Ctrl+Left Arrow
set_hotkey 79 65535 123 11796480
# Move left a space: Ctrl+Shift+Left Arrow
set_hotkey 80 65535 123 11927552
# Move right a space: Ctrl+Right Arrow
set_hotkey 81 65535 124 11796480
# Move right a space: Ctrl+Shift+Right Arrow
set_hotkey 82 65535 124 11927552
# Mission Control: Ctrl+Up Arrow
set_hotkey 32 65535 126 11796480
# Application windows (Expose): Ctrl+Down Arrow
set_hotkey 33 65535 125 11796480

# --- Dock layout ---
dockutil --remove all --no-restart
dockutil --add /System/Applications/Launchpad.app --label "Apps" --no-restart
dockutil --add /Applications/Arc.app --no-restart
dockutil --add /Applications/Safari.app --no-restart
dockutil --add /System/Applications/Photos.app --no-restart
dockutil --add /System/Applications/FaceTime.app --no-restart
dockutil --add /System/Applications/Messages.app --no-restart
dockutil --add /Applications/Slack.app --no-restart
dockutil --add /System/Applications/Calendar.app --no-restart
dockutil --add /System/Applications/Notes.app --no-restart
dockutil --add "/System/Applications/System Settings.app" --no-restart
dockutil --add /System/Applications/"iPhone Mirroring.app" --no-restart
dockutil --add ~/Downloads --view fan --display folder --no-restart

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
