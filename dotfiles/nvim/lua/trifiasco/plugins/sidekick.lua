return {
  "folke/sidekick.nvim",
  event = "LspAttach",
  opts = {
    nes = {
      enabled = true,
      debounce = 100,
    },
  },
  keys = {
    {
      "<C-y>",
      function()
        if require("sidekick").nes_jump_or_apply() then
          return
        end
        return "<C-y>"
      end,
      mode = "n",  -- Normal mode only for NES
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<Esc>",
      function()
        if not require("sidekick").clear() then
          return "<Esc>"
        end
      end,
      mode = "n",
      expr = true,
      desc = "Clear Sidekick or normal Esc",
    },
    -- AI CLI keymaps (optional)
    {
      "<leader>ac",
      function()
        require("sidekick.cli").toggle({ focus = true })
      end,
      desc = "Sidekick Toggle CLI",
      mode = { "n", "v" },
    },
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle({ name = "claude", focus = true })
      end,
      desc = "Sidekick Claude Toggle",
      mode = { "n", "v" },
    },
  },
}
