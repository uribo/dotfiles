source ~/.bashrc
source "$HOME/.nvm/nvm.sh"

export PATH="/usr/local/sbin:$PATH"
export POSTGRES_HOME=/usr/local/opt/postgresql/
export PGLIB=${POSTGRES_HOME}/lib
export PGDATA=/usr/local/var/postgres
export PATH=${POSTGRES_HOME}/bin:${PATH}

[ -s "/Users/uri/.nvm/nvm.sh" ] && . "/Users/uri/.nvm/nvm.sh" # This loads nvm
. /Users/uri/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true # for opam
# added for Anaconda
export PATH=/Users/uri/anaconda/bin:$PATH
# hub: https://github.com/github/hub
eval "$(hub alias -s)"