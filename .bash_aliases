export PATH=~/bin:$PATH
alias repoclean='sudo echo "Cleaning with 8 threads"; repo forall -j8 -p -c sudo git clean -xqdf'
. /etc/bash_completion.d/git-prompt

if [ $(hostname) != $WORKING_COMPUTER ]
then
  DISPLAY_HOSTNAME="\[$(tput setaf 6)\]$(hostname) \[$(tput sgr0)\]"
fi

# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="[$DISPLAY_HOSTNAME\w]\[$(tput setaf 2)\]\$(__git_ps1 \" (%s)\")\[$(tput sgr0)\]\\$\[$(tput sgr0)\] "
