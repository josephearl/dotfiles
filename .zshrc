# Terminal Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Prompt
hash "git-radar" 2>/dev/null && {
  export PS1=$'%B%F{green}→%B%F %B%F{cyan}$(basename "\$(pwd)")/%B%F\$(git-radar --zsh --fetch) '
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
export ASDF_GROOVY_DISABLE_JAVA_HOME_EXPORT=true
hash "asdf" 2>/dev/null && {
  source "$(brew --prefix asdf)/libexec/asdf.sh"
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
    thefuck
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
    vscode
    xcode
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
  )

  source "$ZSH/oh-my-zsh.sh"
}
