alias tar='gtar'
alias gs='git status'
alias gpl='git pull'
alias gph='git push'
alias ls='ls -la'
alias g='cd ~/Documents/git/'
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
#source /Users/davidr/kube-ps1/kube-ps1.sh
export PS1="\[\e[36m\]\u\[\e[m\]: \[\e[31m\]\w\[\e[m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

source /usr/local/etc/bash_completion.d/git-completion.bash
eval "$(direnv hook bash)"
export EDITOR=$(which code)

# Load rbenv automatically by appending
# the following to ~/.bash_profile:

eval "$(rbenv init -)"

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
