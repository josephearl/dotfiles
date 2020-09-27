#!/usr/bin/env bash
set -e
err_report() {
  echo -e "\e[31mError on line $1 in file $0\e[39m"
}
trap 'err_report $LINENO' ERR

# Install Oh My Zsh
test -s "$ZSH/oh-my-zsh.sh" || {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # Fix directory permissions for completions
  compaudit | xargs chmod g-w,o-w
}

# Install https://github.com/zsh-users/zsh-syntax-highlighting
test -d "$ZSH/custom/plugins/zsh-syntax-highlighting" || {
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
}