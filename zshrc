ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git brew pip python node npm urltools golang)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/Cellar/ruby/1.9.3-p374/bin:/usr/local/bin:/usr/local/sbin:$PATH
export WORKON_HOME=~/environments
alias up="vagrant up && vagrant ssh"
source /usr/local/bin/virtualenvwrapper.sh
export NODE_PATH=/usr/local/lib/node_modules
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export CHEF_PATH=~/Magnetic/chef-repo
unsetopt inc_append_history
unsetopt share_history # share command history data
