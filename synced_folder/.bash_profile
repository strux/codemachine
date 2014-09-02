PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '

export TERM=xterm-256color
export LC_ALL=en_US.utf-8
export EDITOR=vim
export PATH=/usr/local/bin:$PATH

alias ll='ls -lh'
alias la='ls -ah'
alias lla='ls -ahl'

# Vagrant
alias v=vagrant

# Git / Hub
source ~/.git-completion.sh
source ~/.git-prompt.sh
eval "$(hub alias -s)"

# Rspec
alias rspec='rspec --color'

# Bundler
alias b='bundle'
alias be='bundle exec'

# Stackato
alias stk='stackato'

# Expects an argument in the form of: magic1.dis OR se2.mtn
ss() {
  stk target https://api.paas.$1.mtnsatcloud.com
  stkl
  stk apps
}
alias ss=ss

# Expects an argument in the form of: magic1.dis OR se2.mtn
advHealth() {
  url="prod.seanet.$1.mtn.mtnsatcloud.com/status/zoo"
  curl $url | jshon
}
alias sshealth=advHealth

# Scripted Configurations
