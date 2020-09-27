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

# Install plugin zsh-autosuggestions
test -d "$ZSH/custom/plugins/zsh-autosuggestions" || {
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH/custom/plugins/zsh-autosuggestions"
}

# Install plugin zsh-history-substring-search
test -d "$ZSH/custom/plugins/zsh-history-substring-search" || {
  git clone https://github.com/zsh-users/zsh-history-substring-search.git "$ZSH/custom/plugins/zsh-history-substring-search"
}

# Install plugin zsh-syntax-highlighting
test -d "$ZSH/custom/plugins/zsh-syntax-highlighting" || {
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH/custom/plugins/zsh-syntax-highlighting"
}
