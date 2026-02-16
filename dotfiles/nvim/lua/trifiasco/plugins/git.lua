return {
    -- Gitsigns: git diff signs in gutter + hunk operations
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "Git: " .. desc })
                end

                -- Hunk navigation
                map("n", "]h", gs.next_hunk, "Next hunk")
                map("n", "[h", gs.prev_hunk, "Prev hunk")

                -- Hunk actions
                map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
                map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
                map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk")
                map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk")
                map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
                map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
                map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
                map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
                map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
            end,
        },
    },

    -- Fugitive: git commands
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "Gvdiffsplit", "Gread", "Gwrite" },
        keys = {
            { "<leader>gs", "<CMD>Git<CR>", desc = "Git status" },
            { "<leader>gb", "<CMD>Git blame<CR>", desc = "Git blame" },
            { "<leader>gv", "<CMD>Gvdiffsplit<CR>", desc = "Git diff split" },
        },
    },

    -- Diffview: tabpage diff viewer
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview open" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history" },
            { "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "Branch history" },
        },
    },
}
