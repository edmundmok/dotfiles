# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Enable 256 colors support
export TERM=xterm-256color

# Homebrew PATH
export PATH=/usr/local/bin:$PATH

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Display name only when in localhost
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# filesystem aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....='cd../../..'
alias .....='cd ../../../..'

# list all(-a) files in long(-l), human-readable(-h), sorted by timestamp (-t) with file-type indicator(-F) format
alias l="ls -lhtaF"
alias rmf="rm -rf"

# disk free, with  human-readable output, i.e. Ki/Gi instead of pure bytes
alias df="df -h"

# calculate disk usage for a folder, with human-readable(-h) output and display grand total(-c)
alias du="du -h -c"

# tmux aliases
alias ta="tmux attach"
alias tat="tmux attach -t"
alias td="tmux detach"
alias tl="tmux ls"
alias tn="tmux new-session -s"
alias tk="tmux kill-session -t"

# common configs
alias vrc="${EDITOR} ~/.vimrc"
alias tmc="${EDITOR} ~/.tmux.conf"
alias zrc="${EDITOR} ~/.zshrc"
alias zrcp="${EDITOR} ~/.zshrc.private"

alias v="vim" # too lazy to type 3 chars
alias sz="source ~/.zshrc && echo '.zshrc reloaded'"

# open apps from cmdline
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# finally, load local zshrc (e.g. private stuff)
# if exists and can read
ZSHRC_PRIVATE_NAME=".zshrc.private"
ZSHRC_PRIVATE_PATH="${HOME}/${ZSHRC_PRIVATE_NAME}"

# shell doesn't expand tilde while using condition
# so we need to use ${HOME} instead of ~
# else, it will think file does not exist
[ -r $ZSHRC_PRIVATE_PATH ] && source $ZSHRC_PRIVATE_PATH && echo "${ZSHRC_PRIVATE_NAME} reloaded"

# fzf key bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# disable HIST_VERIFY on history expansion
# so !! executes immediately instead of expanding into the actual
# historical input
setopt no_hist_verify
