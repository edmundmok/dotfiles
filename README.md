# dotfiles

## Set-up
1. Install iTerm2
2. Download Solarized Dark colors (import to iTerm2 + move vim colors to `~/.vim/colors`)
3. Install Powerline fonts
4. Switch to a suitable Powerline font
5. Remap Caps Lock to Control
6. `brew install vim`
    - Make sure that your path lists `/usr/local/bin` before `/usr/bin`: `/usr/local/bin:/usr/bin`
    - `/usr/local/bin` is homebrew's path.
    - `which vim` should return `/usr/local/bin/vim` instead of `/usr/bin/vim`
    - Why?
        - `macvim` doesn't allow copy to system clipboard with e.g. `"*yy`

Add private `zsh` configs to `~/.zsh.private`
