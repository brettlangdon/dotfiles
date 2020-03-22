alias emacs="emacs -nw"

# macOS
alias stayawake="caffeinate -s -d -i"
alias clear-dns="sudo dscacheutil -flushcache || sudo killall -HUP mDNSResponder"

# History
alias reload-history="fc -Ri"

# Docker
alias docker-login="aws ecr get-login --no-include-email --region us-east-1 | sh"
alias docker-start="open --background /Applications/Docker.app"
alias docker-top='watch -n 1 "clear && docker top $1"'

# SSH
alias socks-proxy="ssh -D 9050 -C -N ${1}"
