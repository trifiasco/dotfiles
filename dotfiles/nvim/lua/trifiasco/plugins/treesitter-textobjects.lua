return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
            },
            move = {
                set_jumps = true,
            },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local move = require("nvim-treesitter-textobjects.move")
        local swap = require("nvim-treesitter-textobjects.swap")

        -- Select textobjects
        local select_maps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
        }
        for key, capture in pairs(select_maps) do
            vim.keymap.set({ "x", "o" }, key, function()
                select.select_textobject(capture, "textobjects")
            end, { desc = "TS " .. capture })
        end

        -- Move: goto next/prev start/end
        local move_targets = {
            { "f", "@function.outer" },
            { "c", "@class.outer" },
            { "a", "@parameter.outer" },
            { "i", "@conditional.outer" },
            { "l", "@loop.outer" },
            { "b", "@block.outer" },
            { "s", "@statement.outer" },
        }
        for _, pair in ipairs(move_targets) do
            local key, capture = pair[1], pair[2]
            vim.keymap.set({ "n", "x", "o" }, "]" .. key, function()
                move.goto_next_start(capture, "textobjects")
            end, { desc = "TS next " .. capture })
            vim.keymap.set({ "n", "x", "o" }, "]" .. key:upper(), function()
                move.goto_next_end(capture, "textobjects")
            end, { desc = "TS next end " .. capture })
            vim.keymap.set({ "n", "x", "o" }, "[" .. key, function()
                move.goto_previous_start(capture, "textobjects")
            end, { desc = "TS prev " .. capture })
            vim.keymap.set({ "n", "x", "o" }, "[" .. key:upper(), function()
                move.goto_previous_end(capture, "textobjects")
            end, { desc = "TS prev end " .. capture })
        end

        -- Swap parameters
        vim.keymap.set("n", "<leader>a", function()
            swap.swap_next("@parameter.inner", "textobjects")
        end, { desc = "TS swap next param" })
        vim.keymap.set("n", "<leader>A", function()
            swap.swap_previous("@parameter.inner", "textobjects")
        end, { desc = "TS swap prev param" })
    end,
}
