##
## charaset
##
case "${OSTYPE}" in
	linux*)
		export LANG=ja_JP.UTF-8
        ;;
	cygwin*)
		export LANG=ja_JP.SJIS
		export JLESSCHARSET=japanese-sjis
		export OUTPUT_CHARSET=sjis
		;;
esac
case ${UID} in
	0)
		LANG=C
		;;
esac

## 
## modules
##
autoload colors; colors
#autoload predict-on; predict-on
autoload -Uz compinit; compinit
autoload zed


##
## key bind
##
bindkey -v
bindkey "^R" history-incremental-search-backward

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
alias where='command -v'
alias j='job -l'


## proxy


## local zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
