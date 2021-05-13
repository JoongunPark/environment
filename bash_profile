source ~/.bashrc

function prompt_style {
    local __user_at_host="\[\033[38;5;214m\]\u\[\033[38;5;15m\]@\[\033[38;5;81m\]\h\[\033[38;5;15m\]"
    local __directory="\[\033[38;5;212m\]\w"
    local __git_branch='\[\033[38;5;212m\](`git rev-parse --abbrev-ref HEAD 2> /dev/null`)'
    local __prompt_symbol="\[\033[38;5;198m\]$"
    local __font_color="\[\033[0m\]"
    #export PS1="[\[$(tput sgr0)\]\[\033[38;5;217m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;81m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput sgr0)\]\[\033[38;5;222m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;198m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
    export PS1="[$__user_at_host] $__directory $__prompt_symbol $__font_color"
}

prompt_style

# Tmux default 256 color
alias tmux='tmux -2'

export FZF_DEFAULT_OPTS='
	--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
	--color info:183,prompt:110,spinner:107,pointer:167,marker:215'
