#for dotfiles
alias config='git --git-dir=/Users/batu/Documents/.dotfiles/ --work-tree=/Users/batu/.config'

alias :q=exit # to exit the terminal mode in nvim
alias ls="exa"
alias cat="bat"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
# make less accept color codes and re-output them
alias less="less -R"

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
