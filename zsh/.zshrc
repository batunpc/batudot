#===================
#           _
#   _______| |__
#  |_  / __|  _ \
#   / /\__ \ | | |
#  /___|___/_| |_|
#
#===================
#brew
eval "$(/opt/homebrew/bin/brew shellenv)"
# Welcome messages
fortune | lolcat
echo ""
plugins=(zsh-syntax-highlighting git)

# ===============================================================================
# === Settings to not change ===
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
export GIT_CONFIG=~/.config/gh/.gitconfig
#export VIMINIT="source ~/.config/vim/.vimrc"
export LESSHISTFILE=-

export HISTFILE=~/.config/zsh/.zsh_history
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file
# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
ZSH_THEME="agnoster"
DISABLE_AUTO_TITLE="true"
SHELL_SESSIONS_DISABLE=1


# LS colors direction to find the sh file 
source ~/.config/.LS_COLORS/lscolors.sh
#zsh-syntax-highlighting
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#Auto Suggestion
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# path to ohmyzsh
source $ZSH/oh-my-zsh.sh
# path to p10k
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

alias ls="exa"
alias cat="bat"
alias grep='grep --color=auto'
alias config='git --git-dir=/Users/batu/Documents/.dotfiles/ --work-tree=/Users/batu/.config'

source $HOME/.config/zsh/.p10k.zsh
# ===============================================================================



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
