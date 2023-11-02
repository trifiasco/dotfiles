# dotfiles
Repository containing dotfiles

# Dependencies
Make sure the following are installed -
- [git](https://git-scm.com/) - well..
- [alacritty](https://github.com/alacritty/alacritty) - terminal emulator
- [zsh](https://www.zsh.org/) - shell of my choice
- [antigen](https://github.com/zsh-users/antigen) - zsh plugin manager
- [tmux](https://github.com/tmux) - terminal multiplexer
- [tmuxinator](https://github.com/tmuxinator/tmuxinator) - tmux session manager
- [neovim](https://neovim.io/) - vim improved (> 0.7)

# Setting up environment in a new computer
- Clone the repository - 
```
git@github.com:trifiasco/dotfiles.git
```
- cd into the repository.
- run - `./install`
- tmux and neovim plugins will not be installed outright. but you will be prompted to install the plugins, first time you open tmux/nvim. so chill.


# TODOs:
- Add antigen as a submodule to be automatically installed
- Add setup scripts for the other dependencies
- Cleanup - remove dead and obsolete dotfiles
    - .vimrc - not maintained anymore
