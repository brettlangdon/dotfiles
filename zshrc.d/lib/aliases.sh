alias up="vagrant up && vagrant ssh"
alias stayawake="caffeinate -s -d -i"
alias emacs="emacs -nw"
alias docker-login="aws ecr get-login --no-include-email --region us-east-1 | sh"
alias docker-start="open --background /Applications/Docker.app"
alias clear-dns="sudo dscacheutil -flushcache || sudo killall -HUP mDNSResponder"
alias docker-top='watch -n 1 "clear && docker top $1"'
