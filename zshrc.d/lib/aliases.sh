alias emacs="emacs -nw"

# macOS
alias stayawake="caffeinate -s -d -i"
alias clear-dns="sudo dscacheutil -flushcache || sudo killall -HUP mDNSResponder"

# History
alias reload-history="fc -Ri"

# Docker
alias docker-start="open --background /Applications/Docker.app"

# SSH
alias socks-proxy="ssh -D 9050 -C -N ${1}"
