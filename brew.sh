#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install brew if its not already installed.
if ! type brew &>/dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi;

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion@2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
#brew install php
brew install gmp

# Install font tools.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
#brew install bfg
#brew install binutils
brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
#brew install nmap
brew install pngcheck
#brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
#brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2                    # EXIF and IPTC metadata manipulation library and tools https://exiv2.org/
brew install git
brew install git-lfs
#brew install gs                       # Interpreter for PostScript and PDF https://www.ghostscript.com/
brew install imagemagick
#brew install lua                      # Powerful, lightweight programming language https://www.lua.org/
#brew install lynx                     # Text-based web browser https://invisible-island.net/lynx/
#brew install p7zip
#brew install pigz
brew install pv
#brew install rename
#brew install rlwrap
#brew install ssh-copy-id
brew install tree
brew install vbindiff
#brew install zopfli

# My additions
brew install adr-tools                 # Command-line tool for working with Architecture Decision Records https://github.com/npryce/adr-tools
brew install alt-tab                   # Enable Windows-like alt-tab https://alt-tab-macos.netlify.app/
brew install alure                     # Manage common tasks with OpenAL applications (required for bucklespring) https://kcat.tomasu.net/alure.html
brew install curl                      # Get a file from an HTTP, HTTPS or FTP server https://curl.se/
brew install ddev/ddev/ddev            # Containerized web development environments, defined in config. Supports PHP, Node.js, and Python (experimental). Requires docker or alternative. https://ddev.com/
brew install dos2unix                  # Convert text between DOS, UNIX, and Mac formats https://waterlan.home.xs4all.nl/dos2unix.html
brew install fdupes                    # Identify or delete duplicate files https://github.com/adrianlopezroche/fdupes
brew install ffmpeg                    # Play, record, convert, and stream audio and video https://ffmpeg.org/
brew install gh                        # GitHub command-line tool https://cli.github.com/
brew install handbrake                 # Video transcoder https://handbrake.fr/
brew install jq                        # Command-line JSON processor https://jqlang.github.io/jq/
brew install lesspipe                  # Input filter for the pager less https://www-zeuthen.desy.de/~friebel/unix/lesspipe.html
brew install mods                      # AI on the command-line https://github.com/charmbracelet/mods
brew install pkg-config                # Manage compile and link flags for libraries (required for bucklespring) https://freedesktop.org/wiki/Software/pkg-config/
brew install python                    # Python 3 https://www.python.org/
brew install rogue                     # Dungeon crawling video game https://sourceforge.net/projects/roguelike/
brew install rsync                     # Utility that provides fast incremental file transfer https://rsync.samba.org/
brew install scrcpy                    # Display and control your Android device https://github.com/Genymobile/scrcpy
brew install sevenzip                  # 7-Zip is a file archiver with a high compression ratio https://7-zip.org
brew install sshuttle                  # Proxy server that works as a poor man's VPN https://github.com/sshuttle/sshuttle
brew install tailscale                 # Easiest, most secure way to use WireGuard and 2FA https://tailscale.com/
brew install telnet                    # User interface to the TELNET protocol
brew install zed                       # Multiplayer code editor https://zed.dev/

# brew install --cask whatsapp         # Native desktop client for WhatsApp https://www.whatsapp.com/
# brew install mkcert                  # Simple tool to make locally trusted development certificates (ddev assumes this, but I try to make do without it because I consider it a security hole) https://github.com/FiloSottile/mkcert
brew install --cask discord            # Voice and text chat software https://discord.com/
brew install --cask disk-inventory-x   # Disk usage utility https://www.derlien.com/
brew install --cask docker             # Docker Desktop (conflicts with docker formula) https://www.docker.com/products/docker-desktop/
brew install --cask firefox            # Web browser https://www.mozilla.org/firefox/
brew install --cask google-chrome      # Web browser https://www.google.com/chrome/
brew install --cask iterm2             # Terminal emulator https://www.iterm2.com/
brew install --cask musicbrainz-picard # Music tagger https://picard.musicbrainz.org/
brew install --cask obsidian           # Knowledge base that works on top of a local folder of plain text Markdown files https://obsidian.md/
brew install --cask phpstorm           # PHP IDE by JetBrains https://www.jetbrains.com/phpstorm/
brew install --cask slack              # Team communication and collaboration software https://slack.com/intl/en-gb
brew install --cask transmission       # BitTorrent client https://transmissionbt.com/
brew install --cask vlc                # Multimedia player https://www.videolan.org/vlc/
brew install --cask zoom               # Video communication and virtual meeting platform https://www.zoom.us/

# Remove outdated versions from the cellar.
brew cleanup
