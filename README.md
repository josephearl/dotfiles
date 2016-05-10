# dotfiles

[@josephearl](https://twitter.com/josephearl)’s dotfiles.

## Getting started

To replicate this configuration on a new machine:

    git clone --separate-git-dir=$HOME/.dotfiles https://github.com/JosephEarl/dotfiles ~

## Modifying dotfiles

To add a new dotfile:

    git add <filename>

To commit and push changes:

    git commit -m <message>
    git push origin master

## Creating your own dotfiles

To create your own dotfiles repo like this from scratch:

    git init --separate-git-dir=<git-repo-path> ~
