local dap = require('dap')
local dapui = require('dapui')

-- Initialize DAP UI
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
})

-- Enable virtual text
require('nvim-dap-virtual-text').setup()

-- Add Telescope integration
require('telescope').load_extension('dap')

-- dap-python specific configuration
local dap_python = require('dap-python')
dap_python.test_runner = 'pytest'

-- Add keymappings
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<F5>', dap.continue, opts)
vim.keymap.set('n', '<F10>', dap.step_over, opts)
vim.keymap.set('n', '<F11>', dap.step_into, opts)
vim.keymap.set('n', '<F12>', dap.step_out, opts)
vim.keymap.set('n', '<localleader>b', dap.toggle_breakpoint, opts)
vim.keymap.set('n', '<leader>B', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, opts)
vim.keymap.set('n', '<leader>dr', dap.repl.open, opts)
vim.keymap.set('n', '<leader>dl', dap.run_last, opts)

-- Automatically open/close DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

return {}
