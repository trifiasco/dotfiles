return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    cmd = {
        "ObsidianToday",
        "ObsidianDailies",
        "ObsidianNew",
        "ObsidianQuickSwitch",
        "ObsidianSearch",
        "ObsidianBacklinks",
        "ObsidianTags",
        "ObsidianToggleCheckbox",
        "ObsidianRename",
        "ObsidianFollowLink",
    },
    keys = {
        { "<leader>zt", "<cmd>ObsidianToday<CR>", desc = "Today's daily note" },
        { "<leader>zd", "<cmd>ObsidianDailies<CR>", desc = "Daily notes list" },
        { "<leader>zn", "<cmd>ObsidianNew<CR>", desc = "New note" },
        { "<leader>zf", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find notes" },
        { "<leader>zg", "<cmd>ObsidianSearch<CR>", desc = "Search notes" },
        { "<leader>zb", "<cmd>ObsidianBacklinks<CR>", desc = "Backlinks" },
        { "<leader>za", "<cmd>ObsidianTags<CR>", desc = "Tags" },
        { "<leader>zT", "<cmd>ObsidianToggleCheckbox<CR>", desc = "Toggle checkbox" },
        { "<leader>zr", "<cmd>ObsidianRename<CR>", desc = "Rename note" },
        { "<leader>zz", "<cmd>ObsidianFollowLink<CR>", desc = "Follow link" },
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
            img_folder = "img",
        },
    },
}
