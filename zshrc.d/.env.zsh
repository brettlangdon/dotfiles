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

# Aider
export OLLAMA_API_BASE=http://127.0.0.1:11434
export AIDER_ANALYTICS_DISABLE=1
export AIDER_AUTO_COMMITS=0
export AIDER_GITIGNORE=0
export AIDER_ARCHITECT=1
export AIDER_AUTO_ACCEPT_ARCHITECT=0
export AIDER_MODEL="anthropic/claude-3-5-haiku-20241022"
export AIDER_DIRTY_COMMITS=0
export AIDER_ATTRIBUTE_AUTHOR=0
export AIDER_ATTRIBUTE_COMMITTER=0
export AIDER_COMMIT_PROMPT="You are an expert software engineer that generates concise, \
one-line Git commit messages based on the provided diffs.
Review the provided context and diffs which are about to be committed to a git repo.
Review the diffs carefully.
Generate a one-line commit message for those changes.
The commit message should be structured as follows: <type>: <description>
Use these for <type>: fix, feat, build, chore, ci, docs, style, refactor, perf, test

Ensure the commit message:
- Starts with the appropriate prefix.
- Is in the imperative mood (e.g., \"add feature\" not \"added feature\" or \"adding feature\").
- Does not exceed 72 characters.
- <description> is lower sentence case.
- <type> should not contain a scope, e.g., \"fix:\" not \"fix(core):\".

Reply only with the one-line commit message, without any additional text, explanations, \
or line breaks."

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

