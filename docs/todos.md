# TODO:
- Plugins with vimscript: The following plugins are written in vimscript, but no good lua alternatives are found(as of now), NEED TO REPLACE in future:
    - vim-fugitive
    - vim-surround

- Plugins to checkout:
    - LSP and beyond
        - [navigator.lua](https://github.com/ray-x/navigator.lua)

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
    

## New learnings
- :Lazy reload <plugin_name>
- :Lazy restore : restore from local lockfile

## Desperately needed
- markdown preview
- dbee or dadbod: datagrip is getting too clunky

## AI plugins that I am exploring
- copilot lua(curently using), need the chat part tho
- avante.nvim: cursor clone, but too unstable(as of now), but written in rust :P
- codecompanion: 

# Plugins
- Editor
    - utils
        - flash.nvim (NEW)
        - git: replace with neogit(I am still not convinced, fugitive is still my choice)
            - gitsigns
            - fugitive
        - LSP
            - replace luasnip
            - replace null-ls
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

