return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    cmd = "Telescope",
    keys = {
        { "<leader>t", function() require("telescope.builtin").find_files() end, desc = "Find files" },
        { "<leader>f", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
        { "<leader>b", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
        { "<leader>h", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
