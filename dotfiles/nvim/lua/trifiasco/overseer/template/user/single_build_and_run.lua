local supported_cmds = {
    cpp = {
        cmd = "g++ %s -o a.out && ./a.out"
    },
    py = {
        cmd = "python %s"
    },
    rs = {
        cmd = "rustc %s -o a.out && ./a.out"
    }
}
return {
  -- [ref](https://github.com/stevearc/overseer.nvim/issues/146#issuecomment-1595581822)
  name = "single file build and run",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    local fileExtension = vim.fn.expand "%:e"
    local command = string.format(supported_cmds[fileExtension].cmd, file)
    vim.notify(command)
    return {
      -- cmd = string.format("g++ %s -o a.out && ./a.out", file),
      cmd = command,
      components = {
        { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        "default",
      },
    }
  end,
  condition = {
    filetype = { "cpp", "python", "rust" },
  },
}
