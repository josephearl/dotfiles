# Terminal Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Prompt
setopt PROMPT_SUBST
export PS1=$'\033[1;32m→\033[0m \033[1;36m\$(basename \$(pwd))/\033[0m\$(git-radar --bash --fetch) '

# Include local bin
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# dotfiles
function dotfiles {
  if [[ $@ == "install" ]]; then
    command bash "$HOME/.install/install.bash"
  else
    command git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
  fi
}
dotfiles config status.showUntrackedFiles no

# thefuck
hash "thefuck" 2>/dev/null && {
  eval "$(thefuck --alias)"
}

# rbenv
export RBENV_DIR="$HOME/.rbenv"
hash "rbenv" 2>/dev/null && {
  eval "$(rbenv init -)"
}

# pyenv
export PYENV_DIR="$HOME/.pyenv"
hash "pyenv" 2>/dev/null && {
  eval "$(pyenv init -)"
}

# nvm
export NVM_DIR="$HOME/.nvm"
test -s "$(brew --prefix nvm)/nvm.sh" && {
  . "$(brew --prefix nvm)/nvm.sh"
}

# SDKMAN!
export SDKMAN_DIR="$HOME/.sdkman"
test -s "$SDKMAN_DIR/bin/sdkman-init.sh" && {
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
}

# direnv
hash "direnv" 2>/dev/null && {
  eval "$(direnv hook zsh)"
}

# Homebrew
brew_path=${PATH//$PYENV_DIR\/shims:/}
brew_path=${brew_path//$RBENV_DIR\/shims:/}
alias brew="PATH=\"${brew_path}\" brew"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh" 
test -s "$ZSH/oh-my-zsh.sh" && {
  plugins=(
    bundler
    docker
    dotnet
    git
    golang
    node
    nvm
    npm
    pyenv
    python
    rbenv
    ruby
    sdk
    vscode
    xcode
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
  )

  source "$ZSH/oh-my-zsh.sh"
}
