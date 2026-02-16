return {
    {
        "echasnovski/mini.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("mini.comment").setup({ options = { ignore_blank_line = true } })
            require("mini.pairs").setup()

            require("mini.indentscope").setup({
                symbol = "│",
                options = { try_as_border = true },
                draw = { animation = require("mini.indentscope").gen_animation.none() },
            })

            require("mini.statusline").setup()

            -- replaces vim-surround: sa (add), sd (delete), sr (replace)
            require("mini.surround").setup()
        end,
    },
    {
        "numToStr/Navigator.nvim",
        keys = {
            { "<C-h>", "<CMD>lua require('Navigator').left()<CR>", desc = "Navigate left" },
            { "<C-j>", "<CMD>lua require('Navigator').down()<CR>", desc = "Navigate down" },
            { "<C-k>", "<CMD>lua require('Navigator').up()<CR>", desc = "Navigate up" },
            { "<C-l>", "<CMD>lua require('Navigator').right()<CR>", desc = "Navigate right" },
            { "<C-\\>", "<CMD>lua require('Navigator').previous()<CR>", desc = "Navigate previous" },
        },
        config = function()
            require("Navigator").setup()
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        event = "BufReadPost",
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
    -- Python DAP
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
          "mfussenegger/nvim-dap",
        },
        config = function()
          local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
          require("dap-python").setup(debugpy_path)
        end,
    },
    -- Rust
    {
        "mrcjkb/rustaceanvim",
        ft = "rust",
        dependencies = {
          "mfussenegger/nvim-dap",
        },
    },
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gvdiffsplit", "Gread", "Gwrite" },
        keys = {
            { "<leader>gs", "<CMD>Git<CR>", desc = "Git status" },
            { "<leader>gb", "<CMD>Git blame<CR>", desc = "Git blame" },
            { "<leader>gv", "<CMD>Gvdiffsplit<CR>", desc = "Git diff split" },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require('gitsigns').setup()
        end,
    },
    {
        "lervag/vimtex",
        ft = "tex",
        init = function()
            vim.g.vimtex_compiler_latexmk = {
              executable = 'latexmk',
              options = {
                '-pdf',
                '-pdflatex=xelatex',
                '-file-line-error',
                '-synctex=1',
                '-interaction=nonstopmode',
              },
            }
            vim.g.vimtex_compiler_latexmk_engines = {
              _        = '-pdf',
              pdflatex = '-pdf',
              xelatex  = '-xelatex',
              lualatex = '-lualatex',
            }
            vim.g.vimtex_compiler_engine = 'xelatex'
        end,
    },
    -- devicons (used by snacks explorer)
    { "nvim-tree/nvim-web-devicons", lazy = true },
}
