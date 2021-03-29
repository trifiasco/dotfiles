# Getting started
- create a `.dotfiles` folder
```
  git init --bare $HOME/.dotfiles
```
- create an alias
```
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```
- set git status to hide untracked files
```
dotfiles config --local status.showUntrackedFiles no
```

# Usage
```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add .vimrc"
dotfiles push -u origin main
```

# Setting up environment in a new computer
- Make sure you have following things installed -
  - git

- Clone the repository - 
```
git clone --bare <url> $HOME/.dotfiles
```
- Add the alias in the current shell scope
- checkout the repository

NOTE - Error may be thrown in case of files that are already there ( example .bashrc ), in that case just delete that file or back them up somewhere.
