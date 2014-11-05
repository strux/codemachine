################################################################################
# First run setup
################################################################################
USER_ENV_FILE=~/synced_folder/local_config/user-env.sh
if [[ $- == *i* ]]; then # if interactive shell
  if [[ ! -f $USER_ENV_FILE ]]; then # no var file
    bash ~/synced_folder/scripts/first-run.sh
  fi
fi
[[ -f $USER_ENV_FILE ]] && source $USER_ENV_FILE

export TERM=xterm-256color
export LC_ALL=en_US.utf-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR=vim
export PATH=/usr/local/bin:$PATH

PS1=$'\e[0;33m\u2605\e[0m \e[40m[\h \W$(__git_ps1 " (%s)")]\e[0m \e[0;37m$\e[0m '

alias ll='ls -lh'
alias la='ls -ah'
alias lla='ls -ahl'

################################################################################
# Vagrant
################################################################################
alias v=vagrant

################################################################################
# rbenv
################################################################################
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

################################################################################
# Git / Hub
################################################################################
eval "$(hub alias -s)"
source ~/.git-completion.bash
source ~/.git-prompt.sh
source ~/.hub.bash_completion.sh
[ -n ${CM_GIT_USER_NAME} ] && git config --global user.name "${CM_GIT_USER_NAME}"
[ -n ${CM_GIT_USER_EMAIL} ] && git config --global user.email ${CM_GIT_USER_EMAIL}
alias g='git'

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f ~/.git-completion.bash ]; then
  complete -o default -o nospace -F _git g;
fi

################################################################################
# Rspec
################################################################################
alias rspec='rspec --color'

################################################################################
# Bundler
################################################################################
alias b='bundle'
alias be='bundle exec'

################################################################################
# Stackato
################################################################################
alias stk='stackato'
alias s='stackato'
if [[ -n ${CM_STACKATO_EMAIL} && -n ${CM_STACKATO_PASS} ]]; then
  alias stkl="stackato login ${CM_STACKATO_EMAIL} --password ${CM_STACKATO_PASS}"
fi

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

# Stackato v3
# Usage: sl ship.org
sl() {
  stackato target https://api.paasv2.$1.mtnsatcloud.com --space ${CM_STACKATO_V3_SPACE} --organization ${CM_STACKATO_V3_ORG}
  stackato login ${CM_STACKATO_V3_USER} --passwd ${CM_STACKATO_V3_PASS}
}
alias sl=sl

alias sea1='sl sea1.mtn'
alias sea2='sl sea2.mtn'
alias sob='sl spiritofbritain1.pof'
alias sof='sl spiritoffrance1.pof'
alias pok='sl prideofkent1.pof'
alias pob='sl prideofburgundy1.pof'
