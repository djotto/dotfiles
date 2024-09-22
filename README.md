# djotto's dotfiles

Initially based on [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles), customized and converted to
[chezmoi](https://www.chezmoi.io/), with some bits nicked from
[nhs-england-tools/dotfiles](https://github.com/nhs-england-tools/dotfiles/) and other places I forget. I even wrote
the odd script myself.

Mac-only right now. Do not attempt to use as-is (at best it will make your machine weird). Do not attempt to fork (I
rebase this project). Steal bits instead.

## Setup

* Setup mac, including a network connection

* Give "Full Disk Access" to Terminal
  1. pre-Sonoma: System Preferences -> Security & Privacy -> Privacy -> Full Disk Access -> Terminal
  2. post-Sonoma: System Settings -> Privacy & Security -> Full Disk Access -> Terminal
* Copy `secrets.kdbx` to `~`
* Install brew, chezmoi and dotfiles
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install chezmoi
  chezmoi init --apply djotto
  ```
* Reboot
* Workaround for firefox issue:
  ```
  brew uninstall firefox
  brew install firefox
  ```
  Run firefox. Quit firefox.
  ```
  chezmoi apply
  ```
* Replace read-only copy of dotfiles with read-write copy:
  ```
  gh auth login
  cd ~/.local/share
  rm -rf chezmoi
  git clone git@github.com:djotto/dotfiles.git chezmoi
  ```
