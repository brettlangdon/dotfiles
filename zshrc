#!/usr/bin/env bash
PATH="/usr/local/bin:/usr/local/sbin:/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:~/.local/bin"

# Configure oh-my-zsh
export TERM="xterm-256color"
ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(brew git git-extras pip python node npm nvm)

test -e ${ZSH}/oh-my-zsh.sh && source ${ZSH}/oh-my-zsh.sh
unsetopt inc_append_history
unsetopt share_history # share command history data

# Setup Go
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"
export GO15VENDOREXPERIMENT="1"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export NODE_PATH=/usr/local/lib/node_modules
export EDITOR=emacs
export ACK_PAGER_COLOR="less -x4SRFX"

# Setup Python/Virtualenv
export WORKON_HOME=~/.env
test -e /usr/local/bin/virtualenvwrapper.sh && source /usr/local/bin/virtualenvwrapper.sh
export PYTHONDONTWRITEBYTECODE=1

hash -d src=~/src

# Setup custom aliases
alias up="vagrant up && vagrant ssh"
alias stayawake="caffeinate -s -d -i"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Setup RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export rvm_project_rvmrc=1
test -e ${HOME}/.rvm/scripts/rvm && source ${HOME}/.rvm/scripts/rvm

# Check if dinghy is installed, and run shellinit if it exists
which dinghy 2>1 >/dev/null && eval $(dinghy shellinit)

# Setup NVM
export NVM_DIR=~/.nvm
test -e $(brew --prefix nvm)/nvm.sh && source $(brew --prefix nvm)/nvm.sh

# Setup iterm2 shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
