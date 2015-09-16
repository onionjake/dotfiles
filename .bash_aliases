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

export GOPATH=~/.gostuff
