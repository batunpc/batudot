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
#export MallocStackLogging=1 # for leaks debugging
export HOMEBREW_NO_ANALYTICS=1
# Path to your oh-my-zsh installation.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
export GIT_CONFIG=~/.config/gh/.gitconfig
#export VIMINIT="source ~/.config/vim/.vimrc"
export LESSHISTFILE=-
MYSQL_HISTFILE=-
ZDOTDIR=~/.config/zsh/zcompdump
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

source $HOME/.config/zsh/.p10k.zsh

alias :q=exit # to exit the terminal mode in nvim
alias ls="exa"
alias cat="bat"
alias grep='grep --color=auto'
#for dotfiles
alias config='git --git-dir=/Users/batu/Documents/.dotfiles/ --work-tree=/Users/batu/.config'
# Useful aliases
# ================
#alias myip='curl http://ipecho.net/plain;'
# return the number of lines from ls
alias countls='LS -A | wc -l'
#This reverts the effects of running git reset HEAD~.
alias undo-git-reset-head="git reset 'HEAD@{1}'". 
# https://github.com/xorg62/tty-clock
alias clock='tty-clock -S -s -b -c -D' 
# Recursively delete `.DS_Store` files and python cache folders
alias cleanup="find -E . -regex '.*(\.DS_Store|__pycache__|\.mypy_cache|\.pytest_cache).*' -ls -delete"
alias bu='brew update && brew upgrade'
alias bcu='brew cu --all --yes --cleanup'
# DOCKER ALIAS
alias docker-clean-containers='docker container rm -f $(docker container ls -aq)'
alias docker-clean-images='docker image rm -f $(docker image ls -aq)'
# ===============================================================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
eval "$(pyenv init --path)"

#>>> conda initialize >>>
#!! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
#<<< conda initialize <<<

# get local and external ip address
function myip() {
  local ip=`ifconfig en0 | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'`
  local locip extip

  [ "$ip" != "" ] && locip=$ip || locip="inactive"

  ip=`dig +short myip.opendns.com @resolver1.opendns.com`
  [ "$ip" != "" ] && extip=$ip || extip="inactive"

  printf '%11s: %s\n%11s: %s\n' "Local IP" $locip "External IP" $extip
}

# greet 
function greet() {
  local hour=$(date +"%H")
  if [ $hour -lt 12 ] && [ $hour -ge 0 ]; then
    echo "Good morning, $USER!"
  elif [ $hour -lt 18 ] && [ $hour -ge 12 ]; then
    echo "Good afternoon, $USER!"
  else
    echo "Good evening, $USER!"
  fi
}
