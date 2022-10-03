local M = {}

function M.setup()
  require("sniprun").setup {
    interpreter_options = {
        GFM_original = {
                use_on_filetypes = {"markdown.pandoc", "telekasten"}
            }
    },
    display = {
      "Classic",
      -- "VirtualTextOk",
      "VirtualTextErr",
      "TempFloatingWindow",
      "LongTempFloatingWindow"
    },
  }
end
return M
