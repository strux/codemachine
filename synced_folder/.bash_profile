PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '

export TERM=xterm-256color
export LC_ALL=en_US.utf-8

alias ll='ls -lh'
alias la='ls -ah'
alias lla='ls -ahl'

alias stk='stackato'
alias stkl='stackato login '

alias b='bundle'
alias be='bundle exec'

alias v=vagrant
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
