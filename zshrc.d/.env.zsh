# Configure history
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt INC_APPEND_HISTORY_TIME
export HISTSIZE=1000000
export SAVEHIST=1000000

# Omit `/` from the list of word characters so delete work on a path only deletes sub-path and not the whole thing
export WORDCHARS=${WORDCHARS/\/}

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM="xterm-256color"
export ACK_PAGER_COLOR="less -x4SRFX"

# Configure emacs as default editor
export GIT_EDITOR="emacs -nw -Q"
export VISUAL="emacs -nw -Q"
export EDITOR="emacs -nw -Q"

# Configure Go
export GOPATH=~/go

# Configure virtualenv
export PYTHONDONTWRITEBYTECODE=1

# Configure Homebrew
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_DIR=/opt/homebrew
export HOMEBREW_BIN=/opt/homebrew/bin

# Configure GPG
export GPG_TTY=$(tty)

# Configure Path
PATH="/usr/local/bin:/usr/local/sbin:/sbin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:$HOME/.local/bin"
PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
PATH="$HOME/.cargo/bin:$PATH"
PATH="~/.local/bin:/usr/local/bin:/usr/local/sbin:/sbin:$PATH"
PATH="$HOME/.poetry/bin:$PATH"
PATH="/opt/homebrew/bin:$PATH"
command -v pyenv 2>&1 > /dev/null && PATH="$(pyenv root)/shims:${PATH}"
export PATH="$PATH"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# Load 1password cli plugins
op_plugins="$HOME/.config/op/plugins.sh"
[ -f $op_plugins ] && source $op_plugins

# Load zsh-fast-syntax-highlighting if it exists
# DEV: brew install zsh-fast-syntax-highlighting
zfsh=/opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
[ -f $zfsh ] && source $zfsh

# Load in any additional .env files provided
for f in $(find $ZSH_DIR/ -maxdepth 1 -print -type f | grep '\.env\..*\.zsh' | sort)
do
    source "$f"
done

