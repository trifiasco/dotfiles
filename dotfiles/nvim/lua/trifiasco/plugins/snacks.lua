return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        explorer = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true, timeout = 3000 },
        picker = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
    },
    keys = {
        -- Pickers (preserve existing keymaps)
        { "<leader>t", function() Snacks.picker.files() end, desc = "Find files" },
        { "<leader>f", function() Snacks.picker.grep() end, desc = "Live grep" },
        { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>h", function() Snacks.picker.help() end, desc = "Help pages" },
        -- Explorer
        { "<C-n>", function() Snacks.explorer() end, desc = "File Explorer" },
        -- Extra pickers
        { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume last picker" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Grep word", mode = { "n", "x" } },
        -- LSP pickers
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "<leader>D", function() Snacks.picker.lsp_type_definitions() end, desc = "Type Definition" },
        { "<leader>ds", function() Snacks.picker.lsp_symbols() end, desc = "Document Symbols" },
        { "<leader>ws", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace Symbols" },
    },
}
