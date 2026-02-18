# dotfiles
Repository containing dotfiles, managed with [dotbot](https://github.com/anishathalye/dotbot).

# Dependencies
Make sure the following are installed:
- [git](https://git-scm.com/)
- [alacritty](https://github.com/alacritty/alacritty) - terminal emulator
- [zsh](https://www.zsh.org/) - shell
- [tmux](https://github.com/tmux) - terminal multiplexer
- [neovim](https://neovim.io/) - editor (>= 0.7)
- [mise](https://mise.jdx.dev/) - runtime version manager (replaces nvm, pyenv, conda)
- [sheldon](https://sheldon.cli.rs/) - zsh plugin manager
- [starship](https://starship.rs/) - prompt
- [fzf](https://github.com/junegunn/fzf) - fuzzy finder
- [fd](https://github.com/sharkdp/fd) - find alternative
- [bat](https://github.com/sharkdp/bat) - cat alternative
- [ripgrep](https://github.com/BurntSushi/ripgrep) - grep alternative

```bash
brew install mise sheldon starship fzf fd bat ripgrep
```

# Setting up environment on a new machine

1. Clone the repository:
```bash
git clone git@github.com:trifiasco/dotfiles.git
```

2. Run the installer:
```bash
cd dotfiles && ./install
```

3. Set up runtime versions with mise:
```bash
mise use --global python@3.12
mise use --global node@22
```

4. Install sheldon plugins:
```bash
sheldon lock
```

5. Cache uv/uvx completions:
```bash
mkdir -p ~/.local/share/zsh/completions
uv generate-shell-completion zsh > ~/.local/share/zsh/completions/_uv
uvx --generate-shell-completion zsh > ~/.local/share/zsh/completions/_uvx
```

6. Open a new terminal. Tmux and neovim plugins will be installed on first launch.

# What's included

| Config | Tool | File |
|--------|------|------|
| Shell | zsh | `dotfiles/zshrc` |
| Aliases | zsh | `dotfiles/zsh_aliases` |
| Functions | zsh | `dotfiles/zsh_funcs` |
| Plugins | sheldon | `dotfiles/sheldon/plugins.toml` |
| Prompt | starship | `dotfiles/starship.toml` |
| Multiplexer | tmux | `dotfiles/tmux.conf` |
| Editor | neovim | `dotfiles/nvim/` |
| Terminal | alacritty | `dotfiles/alacritty.toml` |
| Window mgmt | aerospace | `dotfiles/aerospace.toml` |
