##
## charaset
##
case "${OSTYPE}" in
	linux*)
		export LANG=en_US.UTF-8
		export TERM=xterm-256color
        ;;
	cygwin*)
		export LANG=ja_JP.UTF-8
		export TERM=xterm-256color
		;;
esac
case ${UID} in
	0)
		LANG=C
		;;
esac

# load zgen
source "$HOME/.zsh/zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    # plugins
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zaw

    # bulk load
    zgen loadall <<EOPLUGINS
EOPLUGINS

    # save all to init script
    zgen save
fi


## 
## modules
##
autoload colors; colors
#autoload predict-on; predict-on
autoload -Uz compinit; compinit
autoload zed
zmodload zsh/mathfunc


##
## key bind
##
bindkey -v
bindkey "^R" zaw-history

##
## show current directory in title
##
case "${TERM}" in
kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac



##
## prompt
##
PROMPT="
%{${fg[green]}%}${USER}%{${fg[red]}%}@%{${fg[green]}%}${HOST%%.*} %{${fg[yellow]}%}%~%{${reset_color}%}
"
PROMPT2='> '

case ${UID} in
0)
	PROMPT="${PROMPT}# "
    ;;
*)
	PROMPT="${PROMPT}$ "
	;;
esac


##
## command history
##
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


## setopt 
setopt no_beep
setopt auto_param_keys
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history
setopt auto_list
setopt list_packed
setopt auto_pushd
setopt auto_cd
setopt correct


## aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias where='command -v'
alias j='job -l'
alias zh='cat ~/.zsh_history | grep'

## local zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


