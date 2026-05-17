# Setup instructions for a new mac

## Automated setup

1. Setup TouchID
1. Sign into Apple ID & App Store
1. Run System Update to latest patch level
1. `curl -o setup-mac.sh https://raw.githubusercontent.com/coccyx/dotfiles/main/executable_setup-mac.sh && bash ./setup-mac.sh`
1. Open 1Password, login
1. Login to GitHub via `gh auth login`
1. Open Tailscale and login to personal email
1. Run ssh-keygen
1. Use ssh-copy-id to add ssh keys to local machines
1. `/opt/homebrew/bin/chezmoi init --apply coccyx`
1. `/opt/homebrew/bin/chezmoi cd; git remote set-url origin git@github.com:coccyx/dotfiles.git`
1. `echo "/opt/homebrew/bin/bash" | sudo tee -a /etc/shells`
1. `chsh -s /opt/homebrew/bin/bash`
1. `bash ~/.local/share/chezmoi/executable_setup-macos-defaults.sh`

## iCloud & Sync

1. Enable iCloud Drive in Settings > User (Clint Sharp) > iCloud > iCloud Drive
1. Enable Settings > Internet Accounts > iCloud Drive Options > Documents & Desktop

## App logins & configuration

1. Open 1Password, login
1. Open Arc, enable syncing (`Cmd ,`), add to Dock
1. Open Rectangle, authorize accessibility
1. Open Dropbox, login
1. Open accessibility, enable Dropbox and zoom.us
1. Login to Slack (work and personal emails)
1. Open Signal
1. Open iTerm > General > Preferences > Custom location -> ~/.config/iterm2
1. Open Spotify & login
1. Open Tailscale and login to personal email
1. Open Docker
1. Open Logi Options, setup, including Natural Scroll on mouse
1. Open Ollama
1. Open Obsidian, open vault at ~/Vaults/Notes
1. Open Self Service & install Office & Teams

## Manual installs (no Homebrew cask available)

1. Lumina
1. Virtual ][
1. RemotePlay
