# Set user variables
USER_ENV_FILE=~/.user-env.sh
if [[ $- == *i* ]]; then # if interactive shell
  if [[ ! -f $USER_ENV_FILE ]]; then # no var file
    source ~/synced_folder/first-run-setup.sh
  fi
fi
[[ -f $USER_ENV_FILE ]] && source $USER_ENV_FILE

# Scripted Configurations
source ~/.provisioned_bash_profile

PS1=$'\e[40m[\h \W$(__git_ps1 " (%s)")]\e[0m \e[0;37m$\e[0m '

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
[ -n ${CM_GIT_USER_NAME} ] && git config --global user.name "${CM_GIT_USER_NAME}"
[ -n ${CM_GIT_USER_EMAIL} ] && git config --global user.email ${CM_GIT_USER_EMAIL}
git config --global core.editor vim
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.status.changed yellow
git config --global color.status.added green
git config --global color.status.untracked red
git config --global push.default current
alias g='git'

# Rspec
alias rspec='rspec --color'

# Bundler
alias b='bundle'
alias be='bundle exec'

# Stackato
alias stk='stackato'
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
