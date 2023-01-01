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

# LS colors direction to find the sh file
source ~/.config/.LS_COLORS/lscolors.sh
#zsh-syntax-highlighting
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#Auto Suggestion
#source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOME/.config/zsh/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ALIASES
source ~/.config/zsh/.zshrc.aliases.sh

# EXPORTS
source ~/.config/zsh/.zshrc.exports.sh

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
