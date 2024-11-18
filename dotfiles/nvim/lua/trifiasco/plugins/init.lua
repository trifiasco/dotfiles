return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
            },
        },
    },
    {
        "echasnovski/mini.nvim",
        version = "*",
        config = function()
            require("mini.comment").setup({ options = { ignore_blank_line = true } })
            require("mini.pairs").setup()

            require("mini.indentscope").setup({
                symbol = "│",
                options = { try_as_border = true },
                draw = { animation = require("mini.indentscope").gen_animation.none() },
            })

            require("mini.statusline").setup()
        end,
    },
    {
        "numToStr/Navigator.nvim",
        config = function()
            require("Navigator").setup()
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        opt = true,
        event = { "BufRead" },
        wants = { "promise-async" },
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            require("ufo").setup({
                provider_selector = function(bufnr, filetype)
                    return { "lsp", "indent" }
                end,
            })
            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
    },
    {
        "numToStr/FTerm.nvim",
        config = function()
            require("FTerm").setup({
                border = "double",
                dimensions = {
                    height = 0.9,
                    width = 0.9,
                },
            })
        end,
    },

    -- task runner
    -- @TODO: cleanup
    {
        "stevearc/overseer.nvim",
        opts = {},
    },

    { "tpope/vim-fugitive" },
    { "tpope/vim-surround" },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
        end,
    },
    { "tpope/vim-repeat" },
    { "lervag/vimtex" },
    {"github/copilot.vim",}
}