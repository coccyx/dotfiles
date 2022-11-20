# Setup instructions for a new mac

1. Delete most everything from the Dock
1. Sign into Apple ID & Apple Store
1. Set to dark mode with accent Orange in System Preferences>General
1. Grab and run setup-mac.sh from https://github.com/coccyx/dotfiles/main/setup-mac.sh
1. Login to 1Password
1. Open Dropbox, login
1. Open accessibility, enable Dropbox and zoom.us
1. Open Edge, make it the default browser
  1. Open settings, search for vertical tabs, turn on
  1. System Preferences, search for default browser, set to Edge
  1. Login to gmail and google calendar, pin tabs
  1. Login to gmail from personal email address
  1. Move Edge to right place on Dock
1. Login to Slack
  1. Signin to work and personal emails
1. Open Rectangle
  1. Authorize accessibility
1. Open Signal
1. Enable System Preferences>Internet Accounts>Icloud Drive Options>Documents & Desktop
1. Open iterm>General>Preferences>Custom location -> ~/.config/iterm2
1. Open Spotify & login
1. Open Self Service & install Office & Teams
1. Open Tailscale and login to personal email
1. Set keyboard shortcut for moving virtual desktops and expose in Keyboard>Shortcuts>Mission Control and shortcut
1. Open Docker
1. Open Logi Options, setup, including Natural Scoll on mouse
1. Run ssh-keygen
1. Use ssh-copy-id to add ssh keys to local machines
1. Login to GitHub
1. `/opt/homebrew/bin/chezmoi init --apply coccyx`
1. `chezmoi cd; git remote set-url origin git@github.com:coccyx/dotfiles.git`
1. `sudo echo "/opt/homebrew/bin/bash" >> /etc/shells`
1. `chsh -s /opt/homebrew/bin/bash`
