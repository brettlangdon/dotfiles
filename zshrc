#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Configure emacs as default editor
export GIT_EDITOR="emacs -nw"
export VISUAL="emacs -nw"
export EDITOR="emacs -nw"

PATH="/usr/local/bin:/usr/local/sbin:/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:~/.local/bin"

# Configure oh-my-zsh
export TERM="xterm-256color"
ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
# DEV: `pip` and `nvm` are very slow to load
plugins=(brew git git-extras python node npm fabric)

test -e ${ZSH}/oh-my-zsh.sh && source ${ZSH}/oh-my-zsh.sh
unsetopt inc_append_history
unsetopt share_history # share command history data

# Setup Go
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export NODE_PATH=/usr/local/lib/node_modules
export ACK_PAGER_COLOR="less -x4SRFX"

# Setup Python/Virtualenv
export WORKON_HOME=~/.env
export PYTHONDONTWRITEBYTECODE=1
load_virtualenv () {
    source /usr/local/bin/virtualenvwrapper.sh
}
workon () {
    load_virtualenv
    workon "$@"
}
mkvirtualenv () {
    load_virtualenv
    mkvirtualenv "$@"
}
rmvirtualenv () {
    load_virtualenv
    rmvirtualenv "$@"
}


# Setup custom aliases
alias up="vagrant up && vagrant ssh"
alias stayawake="caffeinate -s -d -i"
alias emacs="emacs -nw"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Setup RVM
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
export rvm_project_rvmrc=1
rvm () {
    source ${HOME}/.rvm/scripts/rvm
    rvm "$@"
}

# Setup NVM
export NVM_DIR=~/.nvm
nvm () {
    source $(brew --prefix nvm)/nvm.sh
    nvm "$@"
}

# Setup iterm2 shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# Init chef
chef () {
    eval "$(chef shell-init zsh)"
    chef "$@"
}
