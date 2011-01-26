export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:/Users/eng/.rvm/bin:/usr/local/mysql/bin:$PATH

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}
 
export EDITOR='mate -w'
export SVN_EDITOR="mate -w"
export GIT_EDITOR="mate -w"

# export PS1='\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[1;37m\]:\[\e[1;31m\]\W\[\e[1;33m\]`if [ "$(~/.rvm/bin/rvm-prompt i v)" != "" ]; then echo " → $(~/.rvm/bin/rvm-prompt i v)"; fi`$(parse_git_branch)\[\e[0;39m\] '
# export PS1='\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[1;37m\]:\[\e[1;31m\]\W\[\e[1;33m\]$(parse_git_branch)\[\e[0;39m\] '
export PS1='\[\e[1;31m\]\w\[\e[1;33m\]$(parse_git_branch)\[\e[0;39m\] $ '

export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
export CDPATH=:/Users/eng/git:$CDPATH

alias e='mate'
alias ll='ls -alG'
alias et='mate app/ config/ config.ru db/ Gemfile lib/ public/javascripts public/stylesheets spec/ test/ vendor/'

alias gst='git status'
alias ga='git add .'
alias gc='git commit -a'
alias gcp='git add . && git commit -a && git push'
alias gb='git branch'
alias gcb='git checkout -b'

alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias rtu='rake test:units'

alias qd="git add . && git commit -a -m 'bump' && git push && cap deploy"

alias rt="ssh -t proposalpath.com 'cd /u/apps/proposalpath/shared/log && tail -f production.log'"

cppp() {
  cap proposalpath:process_photos -s photoset=$@
}

flatten() {
  # find . -type f -name "*mp3" -print0 | xargs -0 -J% mv % /Users/taylor/Desktop/foo
  find . -type f -print0 | xargs -0 -J% mv % .
}

# http://matthewhutchinson.net/2010/9/19/rails-3-bash-aliases-and-irbrc-configs
sc () {
  if [ -f ./script/rails ]; then 
    rails c $@
  else
    ./script/console $@
  fi
}

sg () {
  if [ -f ./script/rails ]; then
    rails g $@
  else
    ./script/generate $@
  fi
}

ss () {
  if [ -f ./script/rails ]; then 
    rails s $@
  else
    ./script/server $@
  fi
}

# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"