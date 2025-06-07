
local config = function()
    require('copilot').setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<C-y>",
          accept_word = false,
          accept_line = false,
          next = "<]]>",
          prev = "<[[>",
          dismiss = "<C-e>",
        },
      },
      filetypes = {
        python = true,
        lua = true,
        rust = true,
        sql = true,
        ["*"] = false,
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
