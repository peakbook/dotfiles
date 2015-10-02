##
## term, charaset, ...
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

##
## load local .zshrc
##
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


## 
## modules
##
autoload colors; colors
#autoload predict-on; predict-on
autoload -Uz compinit; compinit
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
autoload zed
zmodload zsh/mathfunc


##
## load zgen
##
source "$HOME/.zsh/zgen/zgen.zsh"
if ! zgen saved; then
    echo "Creating a zgen save"

    # zgen oh-my-zsh

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions
    zgen load zsh-users/zaw
    # zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

    zgen save
fi


##
## key bind
##
bindkey -v
bindkey "^R" zaw-history
bindkey "^@" zaw-cdr


##
## command history
##
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


##
## dir history
##
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":chpwd:*" recent-dirs-max 5000
zstyle ":chpwd:*" recent-dirs-default true
zstyle ":completion:*" recent-dirs-insert both


##
## setopt 
##
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


##
## aliases
##
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias where='command -v'
alias j='job -l'
alias zh='cat ~/.zsh_history | grep'


##
## colored man
##
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}


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

