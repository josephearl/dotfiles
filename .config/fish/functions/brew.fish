function brew
  set brew_path $PATH
  set i 1
  for p in $brew_path
    if [ "$p" = "$PYENV_DIR/shims" ]
      set -e brew_path[$i]  
      set i (math "$i-1")
    end
    if [ "$p" = "$RBENV_DIR/shims" ]
      set -e brew_path[$i]
      set i (math "$i-1")
    end
    set i (math "$i+1")
  end
  begin
    set -lx PATH $brew_path
    command brew $argv
  end
end
