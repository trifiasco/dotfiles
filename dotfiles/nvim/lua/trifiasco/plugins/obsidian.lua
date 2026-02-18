return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    cmd = { "Obsidian" },
    keys = {
        { "<leader>zt", "<cmd>Obsidian today<CR>", desc = "Today's daily note" },
        { "<leader>zd", "<cmd>Obsidian dailies<CR>", desc = "Daily notes list" },
        { "<leader>zn", "<cmd>Obsidian new<CR>", desc = "New note" },
        { "<leader>zf", "<cmd>Obsidian quick_switch<CR>", desc = "Find notes" },
        { "<leader>zg", "<cmd>Obsidian search<CR>", desc = "Search notes" },
        { "<leader>zb", "<cmd>Obsidian backlinks<CR>", desc = "Backlinks" },
        { "<leader>za", "<cmd>Obsidian tags<CR>", desc = "Tags" },
        { "<leader>zT", "<cmd>Obsidian toggle_checkbox<CR>", desc = "Toggle checkbox" },
        { "<leader>zr", "<cmd>Obsidian rename<CR>", desc = "Rename note" },
        { "<leader>zz", "<cmd>Obsidian follow_link<CR>", desc = "Follow link" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "notes",
                path = "~/tbox/immigrants/notes",
            },
        },

        daily_notes = {
            folder = "daily",
            date_format = "%Y-%m-%d",
            template = "daily.md",
        },

        templates = {
            folder = "templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
        },

        -- Use [[wiki-links]] (compatible with existing notes and Obsidian app)
        preferred_link_style = "wiki",

        -- Following a link to a non-existing note will create it
        follow_url_func = nil,

        -- Note ID generation: use title as filename
        note_id_func = function(title)
            if title ~= nil then
                -- Clean title for filename
                return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                -- Fall back to timestamp if no title
                return tostring(os.time())
            end
        end,

        -- Picker: use snacks.nvim (via vim.ui.select)
        picker = {
            name = "snacks.pick",
        },

        -- Disable UI extras (we don't care about fancy rendering)
        ui = {
            enable = false,
        },

        -- Attachments
        attachments = {
            folder = "img",
        },

        legacy_commands = false,
    },
}
