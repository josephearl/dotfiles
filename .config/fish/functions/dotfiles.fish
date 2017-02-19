function dotfiles
  if [ "$argv" = "install" ]
    bash "$HOME/.install/install.bash"
  else
    /usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" $argv
  end
end
