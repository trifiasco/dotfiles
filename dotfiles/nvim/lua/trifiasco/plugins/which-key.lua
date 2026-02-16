return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add({
            { "<leader>g", group = "git" },
            { "<leader>h", group = "hunk" },
            { "<leader>z", group = "notes" },
            { "<leader>d", group = "dap/debug" },
            { "<leader>s", group = "search" },
            { "<leader>l", group = "lsp" },
            { "<leader>w", group = "write" },
            { "<leader>a", group = "ai/swap" },
            { "<leader>r", group = "rename" },
            { "<leader>c", group = "code/quickfix" },
            { "<localleader>e", group = "run" },
            { "<localleader>b", group = "breakpoint" },
        })
    end,
}
