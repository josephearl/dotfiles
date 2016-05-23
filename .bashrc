# Path
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.git-radar

# Terminal Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no

# Prompt
PS1="\[\033[1;32m\]→\[\033[0m\] \[\033[1;36m\]$(basename $(pwd))/\[\033[0m\]$(git-radar --bash --fetch) "
