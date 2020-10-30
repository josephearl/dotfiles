# dotfiles

[@josephearl](https://twitter.com/josephearl)’s dotfiles.

## Using dotfiles

**Pre-requisites:** [Homebrew](https://brew.sh)

To replicate this configuration on a new machine initialise and fetch the repository:

    brew install git
    git init --bare "$HOME/.dotfiles"
    alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
    dotfiles remote add origin https://github.com/josephearl/dotfiles
    dotfiles fetch

Backup and remove any existing conflicting files:

    rm .bashrc
    ...

Checkout the master branch:

    dotfiles checkout master

Load the latest settings:

    source .bashrc

Install the software and macOS settings:

    dotfiles install

## Updating dotfiles

To add a new dotfile:

    dotfiles add <filename>

To commit and push changes:

    dotfiles commit -m <message>
    dotfiles push origin master

Backing up Homebrew packages and casks:

    brew leaves
    brew cask list

## Creating your own dotfiles

Create your own basic dotfiles setup as follows:

    git init --bare "$HOME/.dotfiles"
    alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
    dotfiles config status.showUntrackedFiles no

You can use any other path instead of `$HOME/.dotfiles` to store the Git configuration for your dotfiles.
