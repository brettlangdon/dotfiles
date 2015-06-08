#!/usr/bin/env bash
export TERM="xterm-256color"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(brew git git-extras pip python node npm tmux)
RPROMPT+='$(~/.battery.rb)'

source $ZSH/oh-my-zsh.sh
unsetopt inc_append_history
unsetopt share_history # share command history data

export GOPATH=~/go
PATH=/usr/local/bin:/usr/local/sbin:/sbin:$PATH
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin:~/.arcanist/arcanist/bin:~/.local/bin:~/.composer/vendor/bin
export NODE_PATH=/usr/local/lib/node_modules
export EDITOR=emacs

export WORKON_HOME=~/.env
source /usr/local/bin/virtualenvwrapper.sh
export PYTHONDONTWRITEBYTECODE=1

hash -d src=~/src
