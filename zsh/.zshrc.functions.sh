gclone() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

gcom() {
  git add .
  git commit -m "$1"
}

lazyg() {
  git add .
  git commit -m "$1"
  git push
}

update_all() {
  echo "==> Updating Homebrew..."
  brew update && brew upgrade
  echo "\n==> Cleaning up Homebrew..."
  brew cleanup
  echo "\n==> Updating Oh My Zsh..."
  omz update
  echo "\n==> Updating npm global packages..."
  npm update -g
  echo "\n==> All updates complete!"
}

show_colors() {
  for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
  done
}

weather() {
  local location="${1:-}"
  curl "wttr.in/${location}"
}

cheat() {
  curl "cheat.sh/$1"
}

note() {
  local note_file="$HOME/.notes.txt"
  if [ $# -eq 0 ]; then
    cat "$note_file"
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" >> "$note_file"
  fi
}

server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/" && python3 -m http.server "$port"
}

gitignore() {
  curl -sL "https://www.gitignore.io/api/$@"
}

cpwd() {
  pwd | tr -d '\n' | pbcopy
  echo "Current directory copied to clipboard"
}

backup() {
  if [ -f "$1" ]; then
    cp "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
    echo "Backup created: $1.backup-$(date +%Y%m%d-%H%M%S)"
  else
    echo "File not found: $1"
  fi
}

calc() {
  echo "scale=3; $*" | bc -l
}

