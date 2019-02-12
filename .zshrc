export LANG=ja_JP.UTF-8

# alias
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"
# デフォルトのrを無効化。Rの起動を有効にする
disable r

# alias
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# tree
alias tree="tree -NC" 

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

# workon
# VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# source /usr/local/bin/virtualenvwrapper.sh

## ----------------------------
# zsh config
## ----------------------------
bindkey -e
# 自動補完の有効化
autoload -U compinit; compinit
autoload -Uz colors; colors

setopt auto_cd
setopt nobeep
setopt hist_ignore_dups
setopt auto_cd
# バックグランドジョブが終了したら通知
setopt no_tify
setopt print_eight_bit
setopt ignore_eof

# emacs likes key-bind
bindkey -e

# history management
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_ignore_dups
setopt hist_no_store

# プロンプト
fpath+=("/usr/local/share/zsh/site-functions")
autoload -U promptinit; promptinit
# PURE_PROMPT_SYMBOL=">"
prompt pure
# syntax highlight
source ~/.zplug/repos/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## ----------------------------
## zplug
## ----------------------------
if [[ -f $HOME/.zplug/init.zsh ]]; then
    source ~/.zplug/init.zsh

    zplug mafredri/zsh-async, from:github
    zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
    zplug zsh-users/zsh-syntax-highlighting, from:github
    #, defer:2

    # Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

fi
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
