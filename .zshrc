# to source autojump
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && source ~/.autojump/etc/profile.d/autojump.zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/Projects/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerborder"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(command-not-found gem zsh-syntax-highlighting git-flow-completion history-substring-search) # don't use bundler, git: slow!

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs...
export EDITOR=vim
export rvm_path=$HOME/.rvm
export TERM=xterm-256color

alias all="ls -hal --group-directories-first"
alias gvim="gvim -f $@ &> /dev/null" # eradicate gvim error when exiting
                                     # add -f so gvim wouldn't run slowly
# alias gvim="echo 'no! gvim crash gnome 3'"
alias hgrep="history | grep $@"
alias pgrep="ps ax | grep $@"

alias rpry="pry -r ./config/environment"
alias rake="noglob rake" # allows square brackts for rake task invocation
alias b='bundle'
alias be='bundle exec'
alias ber='bundle exec rake'
alias bo='bundle open'

alias g='git'
alias gr='git remote'
alias gsub='git submodule'

# LOL
alias plz="sudo"

export MY_RUBY_HOME="/home/tyok/.rbenv/versions/1.9.3-p125-perf"
# moar rails speed
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export PATH="./bin:$PATH"

export GOROOT="$HOME/Projects/go"
export PATH="$PATH:$GOROOT/bin"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
