export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM="xterm-256color"
export ACK_PAGER_COLOR="less -x4SRFX"

# Configure emacs as default editor
# Configure emacs as default editor
export GIT_EDITOR="emacs -nw -Q"
export VISUAL="emacs"
export EDITOR="emacs"

# Configure Go
export GOPATH=~/go

# Configure virtualenv
export WORKON_HOME=~/.env
export PYTHONDONTWRITEBYTECODE=1

# Configure ZSH
export ZSH=$ZSH_DIR/oh-my-zsh
export ZSH_THEME="agnoster"
export DISABLE_AUTO_UPDATE="true"
export COMPLETION_WAITING_DOTS="true"
# DEV: `pip` and `nvm` are very slow to load
export plugins=(git git-extras python node npm fabric)

# Configure RVM
export rvm_project_rvmrc=1

# Configure NVM
export NVM_DIR=~/.nvm

# Configure Path
PATH="/usr/local/bin:/usr/local/sbin:/sbin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:~/.local/bin"
PATH="$PATH:$GOPATH/bin"
PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Load in any additional .env files provided
for f in $(find $ZSH_DIR/ -print -type f -maxdepth 1 -s | grep '\.env\..*\.zsh')
do
    source "$f"
done
