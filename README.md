# dotfiles

[@josephearl](https://twitter.com/josephearl)’s dotfiles.

## Getting started

**Requirements: Git and Homebrew already installed.**

To replicate this configuration on a new machine initialise and fetch the repository:

    git init --bare .dotfiles
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    dotfiles remote add origin https://github.com/JosephEarl/dotfiles
    dotfiles fetch

Remove any existing conflicting files:

    rm .bashrc
    ...

Checkout the master branch:

    dotfiles checkout master

Load the latest settings:

    source .bashrc

Install the software and OS X settings:

    dotfiles install

## Modifying dotfiles

To add a new dotfile:

    dotfiles add <filename>

To commit and push changes:

    dotfiles commit -m <message>
    dotfiles push origin master

### Backing up Homebrew packages and casks

    brew leaves
    brew cask list

## Creating your own dotfiles

To create your own dotfiles repo like this:

    git init --bare .dotfiles
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
    dotfiles config status.showUntrackedFiles no

You can use any other path instead of `$HOME/.dotfiles` to store the Git configuration for your dotfiles.
