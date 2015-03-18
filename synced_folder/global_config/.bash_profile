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
alias s='stackato'

# Stackato v2
# Usage: slv2 ship.org
slv2() {
  stackato target https://api.paas.$1.mtnsatcloud.com
  stackato login ${CM_STACKATO_EMAIL} --password ${CM_STACKATO_PASS}
}
alias slv2=slv2

# Stackato v3
# Usage: slv3 ship.org
slv3() {
  stackato target https://api.paasv2.$1.mtnsatcloud.com --space ${CM_STACKATO_V3_SPACE} --organization ${CM_STACKATO_V3_ORG}
  stackato login ${CM_STACKATO_V3_USER} --passwd ${CM_STACKATO_V3_PASS}
}
alias slv3=slv3

alias central='slv3 central.mtn'

alias sea1='slv3 sea1.mtn'
alias sea2='slv3 sea2.mtn'
alias mia1='slv3 mia1.mtn'
alias mia2='slv3 mia2.mtn'
alias magic='slv3 magic1.dis'
alias dream='slv3 dream1.dis'
alias wonder='slv3 wonder1.dis'
alias fantasy='slv3 fantasy1.dis'
alias breakaway='slv3 breakaway1.ncl'

alias sob='slv3 spiritofbritain1.pof'
alias sof='slv3 spiritoffrance1.pof'
alias pok='slv3 prideofkent1.pof'
alias pob='slv3 prideofburgundy1.pof'
alias poc='slv3 prideofcanterbury1.pof'
alias poh='slv3 prideofhull1.pof'
alias por='slv3 prideofrotterdam1.pof'
alias pobr='slv3 prideofbruges1.pof'
alias poy='slv3 prideofyork1.pof'

# Expects an argument in the form of: magic1.dis OR se2.mtn
advHealth() {
  url="prod.seanet.$1.mtn.mtnsatcloud.com/status/zoo"
  curl $url | jshon
}
alias sshealth=advHealth

alias sredis='stackato tunnel seanet_redis redis-cli'
