#!/usr/bin/env zsh
unsetopt inc_append_history share_history
setopt NO_BEEP histignorealldups

export ZSH_DIR=${ZSH_DIR:-$HOME/.zshrc.d}
source ${ZSH_DIR}/bootstrap.zsh

# # Setup iterm2 shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
