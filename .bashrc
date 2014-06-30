#command prompt
export  PS1="\[\033[1;32m\]\W \u $ \[\033[0m\] "

#alias
alias safari="open -a Safari"
alias sublime="open -a Sublime\ Text\ 2"
alias evernote="open -a Evernote"
alias r="open -a R"
alias ls="ls -aG"
alias rm="rm -i"
alias wc="wc -l"

PATH=$HOME/.cabal/bin:$PATH

export DISPLAY=":0.0"

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export NODE_PATH=/usr/local/lib/node_modules
NPM_PATH=/usr/local/bin/npm
export PATH=/usr/local/bin:~/bin:$NPM_PATH:$NODE_PATH:$PATH

export GISTY_DIR="/Users/uri/Dropbox/git/gists"
export GISTY_ACCESS_TOKEN=05ccb840dc440ba8fd04de7790d5c01ac8cebcac
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## git-completion
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
    export PS1="\[\033[ 1;32m\]\u:\[\033[ 34m\]\w\[\033[ 31m\]$(__git_ps1)\[\033[ 00m\]\$ "
