export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export EDITOR=emacs
export VISUAL=emacs
export GIT_EDITOR=emacs
alias e='emacs'

chpwd() ls -G

plugins=(git dotnet zsh_reload)

source $ZSH/oh-my-zsh.sh

# Open current command line in emacs
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

source ~/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
