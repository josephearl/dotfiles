# Terminal Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Prompt
setopt PROMPT_SUBST
hash "git-radar" 2>/dev/null && {
  export PS1=$'\033[1;32m→\033[0m \033[1;36m\$(basename \$(pwd))/\033[0m\$(git-radar --bash --fetch) '
}

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

# asdf
export ASDF_DATA_DIR="$HOME/.asdf" 
hash "asdf" 2>/dev/null && {
  export ASDF_DIR="$(brew --prefix asdf)"
  source "$ASDF_DIR/asdf.sh"
  test -s "$ASDF_DATA_DIR/plugins/dotnet/set-dotnet-home.zsh" && {
    source "$ASDF_DATA_DIR/plugins/dotnet/set-dotnet-home.zsh"
  }
  test -s "$ASDF_DATA_DIR/plugins/java/set-java-home.zsh" && {
    source "$ASDF_DATA_DIR/plugins/java/set-java-home.zsh"
  }
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
