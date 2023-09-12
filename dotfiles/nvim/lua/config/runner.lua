--[[

Goal

Case 1: Single file 
    1.1: Build & Run
        1.1.1: build
        1.1.2: run
    1.2: Test
    1.3: Watch
        1.3.1: start
        1.3.2: stop

    1.4: Autocmds
        1.4.1: Autosave
        1.4.2: Autoformat on save

    1.5: Clean
    1.6: Debug


Case 2: Project/Workspace
    Use Makefile or similar to capture commands
    easier to handle different things like docker commands, custom build/run script etc.

    Parse Makefile to capture commands
    Let vim.inp to choose command
        Ideas: can use FTerm scratch terminal for this
        

--]]


local overseer = require('overseer')
overseer.setup({
    templates = {
        "builtin",
        "user.single_build_and_run",
    }
})


vim.api.nvim_create_user_command("SingleRun", function()
  overseer.run_template({ name = "single file build and run" }, function(task)
    if task then
      local main_win = vim.api.nvim_get_current_win()
      vim.cmd("OverseerToggle!")
      vim.api.nvim_set_current_win(main_win)
    else
      vim.notify("SingleRun not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
    end
  end)
end, {})

vim.api.nvim_create_user_command("WatchSingleRun", function()
  overseer.run_template({ name = "single file build and run" }, function(task)
    if task then
      task:add_component({ "restart_on_save", paths = {vim.fn.expand("%:p")} })
      local main_win = vim.api.nvim_get_current_win()
      vim.cmd("OverseerToggle!")
      -- overseer.run_action(task, "open vsplit")
      vim.api.nvim_set_current_win(main_win)
    else
      vim.notify("WatchSingleRun not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
    end
  end)
end, {})

