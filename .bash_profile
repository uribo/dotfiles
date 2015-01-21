source ~/.bashrc
source "$HOME/.nvm/nvm.sh"

export PATH=/usr/local/bin:$PATH

[ -s "/Users/uri/.nvm/nvm.sh" ] && . "/Users/uri/.nvm/nvm.sh" # This loads nvm
. /Users/uri/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true # for opam
# added for Anaconda
export PATH=/Users/uri/anaconda/bin:$PATH