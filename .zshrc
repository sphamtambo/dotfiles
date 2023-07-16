# Enable colors and change prompt:
autoload -U colors && colors

###################################################
#		custom prompt sesstings
###################################################

# git prompt to contain git branch if applicable
# autoload -Uz vcs_info  
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# zstyle ':vcs_info:git*' formats "%{$fg[cyan]%}%s %{$reset_color%}%{$fg[blue]%}%b%{$reset_color%} %{$fg[red]%} %m%u%c%{$reset_color%} "
# # zstyle ':vcs_info:git*' formats "%{$fg[cyan]%}%s %{$reset_color%}%{$fg[blue]%}%b%{$reset_color%} %{$fg[red]%}(%a) %m%u%c%{$reset_color%} "
# zstyle ':vcs_info:*' enable git
# setopt prompt_subst
#
# # prompt setup
# PROMPT='%B%{$fg[red]%}['; # opening bracket 
# PROMPT+='%{$fg[green]%}%n%  '; # username
# PROMPT+='%{$fg[cyan]%}@ '; # @
# PROMPT+='%{$fg[yellow]%}%1~'; # 1 for working directory 
# PROMPT+='%{$fg[red]%}]'; # closing bracket
# PROMPT+='%{$reset_color%} '; # reset colors
# PROMPT+='%B%{$fg[white]%}$%b '; # pound sign color
#
# RPROMPT='${vcs_info_msg_0_} '; # git repository details

###################################################
#			spaceship prompt sesstings
###################################################

# Display time
# SPACESHIP_TIME_SHOW=true

# Display username always
# SPACESHIP_USER_SHOW=always

# Do not truncate path in repos
SPACESHIP_DIR_TRUNC_REPO=false

# Package info
SPACESHIP_PACKAGE_PREFIX="via·"
SPACESHIP_PACKAGE_SUFFIX=" "
SPACESHIP_PACKAGE_COLOR="green"

###################################################
#		keybindings	
###################################################

# Use emacs keybindings  
# bindkey -e

# Use vi keybindings  
bindkey -v
bindkey "^F" vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^B" backward-word
bindkey "^D" delete-word
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY    # Immediately append commands to history file.
setopt HIST_IGNORE_ALL_DUPS  # Never add duplicate entries.
setopt HIST_IGNORE_SPACE     # Ignore commands that start with a space.
setopt HIST_REDUCE_BLANKS    # Remove unnecessary blank lines.

# Use modern completion system
autoload -Uz compinit
compinit
_comp_options+=(globdots)    # include hidden files

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Load aliases if they exist.
source ~/.zsh_aliases

# make nvim default editor
export EDITOR='nvim'
export VISUAL='nvim'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sphalo/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sphalo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sphalo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sphalo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

PATH=~/home/sphalo/anaconda3:$PATH
PATH=/home/sphalo/anaconda3/bin/jupyter:$PATH
# export PATH="/home/sphalo/anaconda3/bin:$PATH"  # commented out by conda initialize
export PATH="$HOME/.local/bin":$PATH

# Load / source zsh plugins.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/spaceship/spaceship.zsh
source ~/.zsh/z/z.sh
