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
load_nvm () {
    unset -f node npm yarn
    source $(brew --prefix nvm)/nvm.sh
}
nvm () {
    load_nvm
    nvm "$@"
}
node () {
    load_nvm
    node "$@"
}
npm () {
    load_nvm
    npm "$@"
}
yarn () {
    load_nvm
    yarn "$@"
}


# Init chef
chef () {
    eval "$(chef shell-init zsh)"
    chef "$@"
}
