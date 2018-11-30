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
autoload -Uz compinit; compinit -u
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
autoload -Uz vcs_info
autoload zed
zmodload zsh/mathfunc


##
## load zgen
##
if [ -e ~/.zsh/zgen/zgen.zsh ]; then
    source ~/.zsh/zgen/zgen.zsh
else
    echo "zgen is not found, fetch it now..." 
    git clone https://github.com/tarjoilija/zgen ~/.zsh/zgen
    source ~/.zsh/zgen/zgen.zsh
    echo "done!"
fi
if ! zgen saved; then
    echo "Creating a zgen save"

    # zgen oh-my-zsh

    zgen prezto 
    zgen prezto git
    zgen prezto tmux
    zgen prezto syntax-highlighting
    # zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions
    zgen load zsh-users/zaw
    # zgen load bhilburn/powerlevel9k powerlevel9k
    zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
    zgen load b4b4r07/emoji-cli
    zgen load Treri/fzf-zsh

    zgen save
fi

##
## key bind
##
bindkey -v
bindkey "^R" zaw-history
bindkey "^@" zaw-cdr
bindkey "^T" zaw-tmux
bindkey '^P' zaw-process
bindkey '^G^F' zaw-git-files
bindkey '^G^B' zaw-git-branches
bindkey '^G^L' zaw-git-log
# bindkey "^^" zaw-

##
## command history
##
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups
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
setopt prompt_subst


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
if which trash-put &> /dev/null; then
    alias rm='trash-put'
fi


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
## prompt
##
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

precmd() { vcs_info }

PROMPT="
%{${fg[green]}%}${USER}%{${fg[red]}%}@%{${fg[green]}%}${HOST%%.*} %{${fg[yellow]}%}%~%{${reset_color}%} "'${vcs_info_msg_0_}'"
"
PROMPT2='> '

case ${UID} in
0)
	PROMPT="${PROMPT}# "
    ;;
*)
	PROMPT="%{${fg[green]}%}${PROMPT}$%{${reset_color}%} "
	;;
esac


eval `dircolors $HOME/.zsh/dircolors.256dark`
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
