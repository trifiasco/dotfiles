return {
    "folke/which-key.nvim",

    -- Editor configs
    -- neotree.nvim - file browser drawer
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
    -- mini.nvim
    {
        "echasnovski/mini.nvim",
        version = "*",
        config = function()
            require("mini.comment").setup({ options = { ignore_blank_line = true } })
            require("mini.pairs").setup()
            -- TODO: change keymaps for surround
            require("mini.surround").setup()

            require("mini.indentscope").setup({
                symbol = "│",
                options = { try_as_border = true },
                draw = { animation = require("mini.indentscope").gen_animation.none() },
            })

            require("mini.statusline").setup()
        end,
    },
    -- easy navigation between vim/tmux pane, splits etc
    {
        "numToStr/Navigator.nvim",
        config = function()
            require("Navigator").setup()
        end,
    },

    -- ufo.nvim - better folding experience
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
    -- telescope and stuff
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "renerocksai/telekasten.nvim",
        },
    },

    --[[
         Code related
    --]]
    -- 01. Treesitter: better syntax highlighting
    -- check after/plugin/treesitter.lua
    -- Treesitter is a new parser generator tool that we can
    -- use in Neovim to power faster and more accurate
    -- syntax highlighting.
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
    },
    -- {
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    --     dependencies = {
    --         'nvim-treesitter/nvim-treesitter'
    --     }
    -- },
    -- 02. LSP and beyond
    -- [[
    -- 2.1: LSP
    -- a. nvim-lspconfig: enable LSP capabilities in neovim
    -- b. mason.nvim: package managers for LSP, DAP, linter, formatters
    -- c. mason-lspconfig: bridge between a and b
    {
        -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
        },
    },

    -- 2.2 DAP
    -- a. nvim-dap
    -- b. nvim-dap-ui
    -- 2.3 Linters
    -- a. null-ls.nvim or nvim-lint
    -- 2.4 Formatters
    -- a. null-ls.nvim or formatter.nvim
    {
        "jose-elias-alvarez/null-ls.nvim",
    },
    -- 2.5 Completion
    {
        -- Autocompletion
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            -- Snippet Engine & its associated nvim-cmp source
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",

            -- Adds LSP completion capabilities
            "hrsh7th/cmp-nvim-lsp",

            -- Adds a number of user-friendly snippets
            "rafamadriz/friendly-snippets",
        },
    },
    -- ]]

    -- Terminal enhancement
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
    {
        "stevearc/overseer.nvim",
        opts = {},
    },

    -- Git Related
    -- gitsign + lazygit in tmux maybe??
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },
    { "tpope/vim-repeat" },

    -- Latex
    -- vimtex
    --
    -- colors and themes
    { "morhetz/gruvbox" },
}
