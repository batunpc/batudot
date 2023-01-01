#export MallocStackLogging=1 # for leaks debugging
#export PATH="/Users/batu/opt/anaconda3/bin:$PATH"

export HOMEBREW_NO_ANALYTICS=1
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
# path to ohmyzsh
source $ZSH/oh-my-zsh.sh
# path to p10k
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

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
