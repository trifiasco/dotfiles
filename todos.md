# folder structure
init.lua
after/
lua/
    trifiasco/
        core/
        plugins/
            init.lua
        utils/
lazy-lock.json
    

## Changelogs
- upgrade neovim to 0.10
    - luasnip broke
- remove whichkey plugin

## New learnings
- :Lazy reload <plugin_name>
- :Lazy restore : restore from local lockfile

# Plugins
- Existing
    - FS
        - neotree
        - telescope: Include more keymaps
    - Editor
        - utils
            - mini.comment
            - mini.pairs
            - mini.indentscope
            - mini.statusline
            - surround
            - repeat
            - flash.nvim (NEW)
        - git: replace with neogit
            - gitsigns
            - fugitive
        - treesitter
            - add textobjects
        - LSP
            - replace luasnip
            - replace null-ls
        - debugger: (NEW)
        - completion
        - latex: (FIX)
        - colorscheme
            - gruvbox
    - taskrunner
        - replace/cleanup overseer
    - Tumux integration
        - navigator
    - terminal
        - FTerm
            - usercommand to run jobs
            - scratch terminal to run build cmds


## Extractable util function
table for language
- language name, ftname, treesitter, lsp, [dap etc.]
- func P -> vim.inspect
- autocommand, command, usercommand
- table containing local build cmds -> construct FTerm runner
