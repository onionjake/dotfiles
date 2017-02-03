export PATH=~/bin:$PATH
export EDITOR=vim
alias repoclean='sudo echo "Cleaning with 8 threads"; repo forall -j8 -p -c sudo git clean -xqdf'
. /etc/bash_completion.d/git-prompt

if [ $(hostname) != "$WORKING_COMPUTER" ]
then
  DISPLAY_HOSTNAME="\[$(tput setaf 6)\]$(hostname) \[$(tput sgr0)\]"
fi

# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="[$DISPLAY_HOSTNAME\w]\[$(tput setaf 2)\]\$(__git_ps1 \" (%s)\")\[$(tput sgr0)\]\\$\[$(tput sgr0)\] "


# Create a global log of all git commits.
git() 
{ 
  if [[ $1 == "commit" ]]; then 
    command git "$@" 
    rc=$?
    if [[ $rc == 0 ]]; then
      # Success, add it to the global commit log
      
      # TODO: respect git's -C option
      echo "Commit to $(git rev-parse --show-toplevel) on $(date):" >> ~/.gitcommitlog 
      cat $(git rev-parse --git-dir)/COMMIT_EDITMSG >> ~/.gitcommitlog
    fi
  else 
    command git "$@"
  fi
}

alias tmux="tmux -2"

export PATH=$PATH:$GOPATH/bin

# unlimited bash history
export HISTSIZE=""
shopt -s histappend

HISTTIMEFORMAT='%F %T '

set -o vi
bind -m vi-command ".":insert-last-argument


## This needs to be split back out

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

