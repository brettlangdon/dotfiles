export TERM="xterm-256color"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git pip python node npm tmux knife)

source $ZSH/oh-my-zsh.sh

PATH=/usr/local/bin:/usr/local/sbin:/sbin:$PATH
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:~/.arcanist/arcanist/bin:~/.local/bin
export NODE_PATH=/usr/local/lib/node_modules
export GOPATH=~/go
export WORKON_HOME=~/.env
export EDITOR=emacs
unsetopt inc_append_history
unsetopt share_history # share command history data

export WORKON_HOME=~/.env
source /usr/local/bin/virtualenvwrapper.sh
hash -d src=~/src
