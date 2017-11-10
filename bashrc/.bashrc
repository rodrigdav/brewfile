alias tar='gtar'
alias gs='git status'
alias gpl='git pull'
alias gph='git push'
alias ls='ls -la'
alias g='~/Documents/git/'
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

#Delete git tag
function dgt() {
  git pull
  git tag -d $@
  git push origin :refs/tags/$@
}

#Create git tag
function cgt () {
  git tag $@
  git push origin tag $@
}

# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\[\e[36m\]\u\[\e[m\]: \[\e[31m\]\w\[\e[m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

source /usr/local/etc/bash_completion.d/git-completion.bash

export EDITOR=$(which code)
set -o vi
