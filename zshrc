#!/usr/bin/env bash
PATH="/usr/local/bin:/usr/local/sbin:/sbin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:/usr/local/opt/go/libexec/bin:~/.local/bin"

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
export PATH="$PATH:$GOPATH/bin"
export GO15VENDOREXPERIMENT="1"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export NODE_PATH=/usr/local/lib/node_modules
export EDITOR=emacs
export ACK_PAGER_COLOR="less -x4SRFX"

export WORKON_HOME=~/.env
source /usr/local/bin/virtualenvwrapper.sh
export PYTHONDONTWRITEBYTECODE=1

hash -d src=~/src
