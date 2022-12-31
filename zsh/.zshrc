# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
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
# call hr function

fortune | lolcat
echo ""
plugins=(zsh-syntax-highlighting git)

# ===============================================================================
#export MallocStackLogging=1 # for leaks debugging
#export PATH="/Users/batu/opt/anaconda3/bin:$PATH"

export HOMEBREW_NO_ANALYTICS=1
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
export GIT_CONFIG=~/.config/gh/.gitconfig
#export VIMINIT="source ~/.config/vim/.vimrc"
export LESSHISTFILE=-
MYSQL_HISTFILE=-
ZDOTDIR=~/.config/zsh/zcompdump
export HISTFILE=~/.config/zsh/.zsh_history
export HISTSIZE=1000000 # the number of items for the internal history list
export SAVEHIST=1000000 # maximum number of items for the history file
# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS    # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS       # do not save duplicated command
setopt HIST_REDUCE_BLANKS      # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME # append command to history file immediately after execution
setopt EXTENDED_HISTORY        # record command start time
ZSH_THEME="agnoster"
DISABLE_AUTO_TITLE="true"
SHELL_SESSIONS_DISABLE=1

# NINJA EXPORTS FOR CMAKE - https://ninja-build.org/manual.html
export NINJA_STATUS="[%f/%t %o/s %p] "

# force C colored diagnostic output
export CFLAGS="${CFLAGS} -fdiagnostics-color=always"
# force C++ colored diagnostic output
export CXXFLAGS="${CXXFLAGS} -fdiagnostics-color=always"
export CCFLAGS="${CCFLAGS} -fdiagnostics-color=always"
# force C, C++, Cpp (pre-processor) colored diagnostic output
export CPPFLAGS="${CPPFLAGS} -fdiagnostics-color=always"

# LS colors direction to find the sh file
source ~/.config/.LS_COLORS/lscolors.sh
#zsh-syntax-highlighting
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#Auto Suggestion
#source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# path to ohmyzsh
source $ZSH/oh-my-zsh.sh
# path to p10k
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

source $HOME/.config/zsh/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias :q=exit # to exit the terminal mode in nvim
alias ls="exa"
alias cat="bat"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
# make less accept color codes and re-output them
alias less="less -R"
#for dotfiles
alias config='git --git-dir=/Users/batu/Documents/.dotfiles/ --work-tree=/Users/batu/.config'
# Useful aliases
# ================
# return the number of lines from ls
alias countls='LS -A | wc -l'
#This reverts the effects of running git reset HEAD~.
alias undo-git-reset-head="git reset 'HEAD@{1}'".
alias undo-git-add="git restore --staged"
# https://github.com/xorg62/tty-clock
alias clock='tty-clock -S -s -b -c -D -n'
# Recursively delete `.DS_Store` files and python cache folders
alias cleanup="find -E . -regex '.*(\.DS_Store|__pycache__|\.mypy_cache|\.pytest_cache).*' -ls -delete"
alias bu='brew update && brew upgrade'
alias bcu='brew cu --all --yes --cleanup'
# DOCKER ALIAS
alias docker-clean-containers='docker container rm -f $(docker container ls -aq)'
alias docker-clean-images='docker image rm -f $(docker image ls -aq)'
# Caffeine
alias caffeinate='caffeinate -d -i -m -s -u'
alias jq='jq --sort-keys'

# ===============================================================================

# print a separator banner, as wide as the terminal
hr() {
  local width=$(tput cols)
  local fill=$(printf "%${width}s")
  echo "${fill// /=}" | lolcat
}

# take an argument and print it in a banner with figlet
banner() {
  local fonts=(slant small smshadow smslant smkeyboard smisome1 smshadow smkeyboard smisome1)
  local font=${fonts[$RANDOM % ${#fonts[@]}]}
  figlet -f $font "$1" | lolcat
}

# animate
poem() {
  # get random poem from api
  local poem=$(curl -s https://poetrydb.org/random | jq -r '.[0].lines[]')
  # print poem
  echo
  autoload -U colors
  colors
  echo $bold_color "$poem" | pv -qL 7
}

# get local and external ip address
function myip() {
  local ip=$(ifconfig en0 | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}')
  local locip extip

  [ "$ip" != "" ] && locip=$ip || locip="inactive"

  ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
  [ "$ip" != "" ] && extip=$ip || extip="inactive"

  printf '%11s: %s\n%11s: %s\n' "Local IP" $locip "External IP" $extip
}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
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
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/batu/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/batu/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/batu/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/batu/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<

# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
