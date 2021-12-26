##
## term, charaset, ...
##
case "${OSTYPE}" in
	linux*)
		export LANG=en_US.UTF-8
		export TERM=screen-256color
        ;;
	cygwin*)
		export LANG=ja_JP.UTF-8
		export TERM=screen-256color
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
## load fzf
##
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modeules,.git}"'
export FZF_DEFAULT_OPTS='--height 40% --reverse'
export FZF_TMUX_OPTS="-p"

## 
## modules
##
autoload colors; colors
autoload -Uz compinit; compinit -u
autoload -Uz vcs_info
autoload zed
zmodload zsh/mathfunc
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
# autoload predict-on; predict-on


##
## load zgen
##
if [ -e ~/.zsh/zgenom/zgenom.zsh ]; then
    source ~/.zsh/zgenom/zgenom.zsh
else
    echo "install zgenom ..." 
    git clone https://github.com/jandamm/zgenom ~/.zsh/zgenom
    source ~/.zsh/zgenom/zgenom.zsh
    echo "done!"
fi
if ! zgenom saved; then
    echo "Creating a zgenom save"

    # zgen prezto 
    zgenom load zsh-users/zsh-completions
    zgenom load b4b4r07/emoji-cli
    zgenom load ytet5uy4/fzf-widgets
    zgenom load zsh-users/zaw
    zgenom load unixorn/fzf-zsh-plugin
    zgenom prezto
    zgenom prezto git
    zgenom prezto tmux
    zgenom prezto syntax-highlighting
    # zgen load Treri/fzf-zsh
    # zgen load pierpo/fzf-docker
    # zgen oh-my-zsh
    # zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
    # zgen load zsh-users/zsh-syntax-highlighting
    # zgen load bhilburn/powerlevel9k powerlevel9k

    zgenom save
    zgenom compile ~/.zshrc
fi

##
## key bind
##
bindkey -v
bindkey "^R" fzf-insert-history
bindkey "^@" fzf-change-recent-directory
bindkey -s "^T" "tm\n" #zaw-tmux
bindkey '^G^F' zaw-git-files
bindkey '^G^B' fzf-git-checkout-branch # zaw-git-branches
bindkey -s '^G^R' "fzf-git-branch\n"
# bindkey "^^" zaw-

##
## command history
##
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
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
if which trash-put &> /dev/null; then
    alias rm='trash-put'
fi


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
# plugins=(... fzf-docker ...)



