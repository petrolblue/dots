#             _                
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__ 
# (_)___|___/_| |_|_|  \___|
#                           
#  By petrolblue (based on Druskus's config)            
#

# History in cache directory:
HISTSIZE=50000
SAVEHIST=50000
HISTFILE="$XDG_CACHE_HOME"/zsh/history

# Prompt
PROMPT="%~ > "

# Aliases
alias l="ls -la"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Include hidden files.
_comp_options+=(globdots)		
# Autocomplete from the middle of the word
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
compinit
# foldend

# History
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY             # write and import history on every command
setopt HIST_FIND_NO_DUPS 

# OTHER
setopt INTERACTIVE_COMMENTS    # allow comments in command line
setopt NOBEEP

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# vim:foldmarker=foldstart,foldend
