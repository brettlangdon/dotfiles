# Enable completions
autoload -Uz compinit && compinit

# Load in custom functions
source ${ZSH_DIR}/lib/functions.zsh

# Load in aliases
source ${ZSH_DIR}/lib/aliases.sh

# Load in base environment variables
source ${ZSH_DIR}/.env.zsh

# Load homebrew shell variables
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Bootstrap starship
eval "$(starship init zsh)"

