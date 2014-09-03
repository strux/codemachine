# Set user variables
USER_ENV_FILE=~/synced_folder/user-env.sh
if [[ $- == *i* ]]; then # if interactive shell
  if [[ ! -f $USER_ENV_FILE ]]; then # no var file
    source ~/synced_folder/first-run-setup.sh
  fi
fi
[[ -f $USER_ENV_FILE ]] && source $USER_ENV_FILE

# Scripted Configurations
source ~/.provisioned_bash_profile

PS1=$'\e[1;31m|\e[0m\u\e[1;31m\u2318\e[0m \h \W$(__git_ps1 " (%s)")\e[1;31m|\e[0m \u2219 '

export TERM=xterm-256color
export LC_ALL=en_US.utf-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR=vim
export PATH=/usr/local/bin:$PATH

alias ll='ls -lh'
alias la='ls -ah'
alias lla='ls -ahl'

# Vagrant
alias v=vagrant

# Git / Hub
eval "$(hub alias -s)"
source ~/.git-completion.bash
source ~/.git-prompt.sh
source ~/.hub.bash_completion.sh
git config --global user.name "${CM_GIT_USER_NAME}"
git config --global user.email ${CM_GIT_USER_EMAIL}
# CM_GIT_USER_NAME

# Rspec
alias rspec='rspec --color'

# Bundler
alias b='bundle'
alias be='bundle exec'

# Stackato
alias stk='stackato'
alias stkl="stackato login ${CM_STACKATO_EMAIL} --password ${CM_STACKATO_PASS}"

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
