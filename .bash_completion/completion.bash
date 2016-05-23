# Load all completion files
for file in $HOME/.bash_completion/*; do
  if [ $(basename "$file") != "completion.bash" ]; then
    source "$file" 
  fi
done
