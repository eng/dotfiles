export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:/Users/eng/.rvm/bin:$PATH

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}
 
export EDITOR='mate -w'
export SVN_EDITOR="mate -w"
export GIT_EDITOR="mate -w"

export PS1='\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[1;37m\]:\[\e[1;31m\]\W\[\e[1;33m\]$(parse_git_branch)\[\e[0;39m\] '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
export CDPATH=:/Users/eng/git:$CDPATH

alias e='mate'
alias ll='ls -alG'
alias et='mate app/ config/ config.ru db/ Gemfile lib/ public/javascripts public/stylesheets spec/ test/ vendor/'

alias gst='git status'
alias ga='git add .'
alias gc='git commit -a'
alias gcp='git add . && git commit -a && git push'
alias qd="git add . && git commit -a -m 'bump' && git push && cap deploy"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.