# Setup Python/Virtualenv
load_virtualenv () {
    source /usr/local/bin/virtualenvwrapper.sh
}
workon () {
    load_virtualenv
    workon "$@"
}
mkvirtualenv () {
    load_virtualenv
    mkvirtualenv "$@"
}
rmvirtualenv () {
    load_virtualenv
    rmvirtualenv "$@"
}

# Setup RVM
rvm () {
    source ${HOME}/.rvm/scripts/rvm
    rvm "$@"
}

# Setup NVM
nvm () {
    source $(brew --prefix nvm)/nvm.sh
    nvm "$@"
}

# Init chef
chef () {
    eval "$(chef shell-init zsh)"
    chef "$@"
}
