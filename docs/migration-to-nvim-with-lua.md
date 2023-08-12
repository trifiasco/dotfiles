# Migration notes for switching from vim and vimscript to nvim and lua:

## TODO:
- Plugins with vimscript: The following plugins are written in vimscript, but no good lua alternatives are found(as of now), NEED TO REPLACE in future:
    - vim-fugitive

- Plugins to checkout:
    - Note taking plugins: nabla, neorg
    - debugging and testing plugins
		- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
		- [vim-ulttest](https://github.com/rcarriga/vim-ultest)

	- build system and code-runner: Need some R&D on build-system and code-runner
		- possible alternatives
			- dispatch with custom compiler and ftplugin, then can use one `:Make` to build and run
			- use a code-runner system:
				- [yabs](https://github.com/pianocomposer321/yabs.nvim)
				- [code-runner](https://github.com/CRAG666/code_runner.nvim)
				- [jaq-nvim](https://github.com/is0n/jaq-nvim)

- Plugins that need further exploration:
    - treesitter - textobjects, formatting, playground etc.

- Themes or colorscheme to checkout:
    - zenburn
