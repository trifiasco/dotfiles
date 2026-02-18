return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        -- Install parsers (async, runs in background)
        require("nvim-treesitter").install({
            "bash",
            "c",
            "html",
            "javascript",
            "json",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "rust",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
            "dockerfile",
            "terraform",
            "sql",
            "csv",
            "tsv",
        })

        -- Enable treesitter highlighting and indentation for all filetypes
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                if pcall(vim.treesitter.start, ev.buf) then
                    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
