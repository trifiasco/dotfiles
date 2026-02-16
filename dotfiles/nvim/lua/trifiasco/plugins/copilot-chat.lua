return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = { "CopilotChat", "CopilotChatOpen", "CopilotChatToggle" },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    config = function()
        require("CopilotChat").setup()
    end,
    build = "make tiktoken",
  },
}
