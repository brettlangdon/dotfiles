# Load in custom functions
source ${ZSH_DIR}/lib/functions.zsh

# Load in aliases
source ${ZSH_DIR}/lib/aliases.sh

# Load in base environment variables
source ${ZSH_DIR}/.env.zsh

# Load in oh-my-zsh
source ${ZSH}/oh-my-zsh.sh

# Load virtualenvwrapper if it exists
# DEV: Load the lazy script for faster load times
test -x /usr/local/bin/virtualenvwrapper_lazy.sh && source /usr/local/bin/virtualenvwrapper_lazy.sh

# Load zsh-syntax-highlighting if it exists
# DEV: brew install zsh-syntax-highlighting
test -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
