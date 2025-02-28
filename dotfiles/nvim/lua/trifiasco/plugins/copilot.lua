
local config = function()
    require('copilot').setup({
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
        layout = {
          position = "bottom", -- | top | left | right | horizontal | vertical
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<C-y>",
          accept_word = false,
          accept_line = "<C-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-e>",
        },
      },
      filetypes = {
        yaml = false,
        markdown = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = true,
      },
      copilot_node_command = 'node', -- Node.js version must be > 18.x
      server_opts_overrides = {},
})
end
return {
    "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = config,
}
