# to source autojump
source /etc/profile

# Path to your oh-my-zsh configuration.
ZSH=$HOME/Projects/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tyok"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(command-not-found gem) # don't use bundler, git: slow!

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export EDITOR=vim
export rvm_path=$HOME/.rvm

alias all="ls -hal"
alias gvim="gvim -f $@ &> /dev/null" # eradicate gvim error when exiting
                                     # add -f so gvim wouldn't run slowly
# alias gvim="echo 'no! gvim crash gnome 3'"
alias hgrep="history | grep $@"
alias pgrep="ps ax | grep $@"

alias b='bundle'
alias be='bundle exec'
alias ber='bundle exec rake'
alias bo='bundle open'

alias g='git'
alias gr='git remote'
alias gsub='git submodule'

# LOL
alias plz="sudo"
