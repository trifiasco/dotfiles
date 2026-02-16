-- [[
-- 	This is the entrypoint of the whole configuration
--
-- ]]
--

-- absolute basics
-- map leader is required by lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = ","


-- Disable unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Fallback colorscheme (gruvbox.nvim loads via plugin spec)
vim.cmd.colorscheme("habamax")

-- Disable built-in plugins for faster startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

-- Reload all user config lua modules
local reload = function()
  for name,_ in pairs(package.loaded) do
    if name:match('^trifiasco') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end
vim.keymap.set('n', '<leader>r', reload)

-- ================= START: PLUGIN MANAGER SETUP =====================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- ================= END: PLUGIN MANAGER SETUP =======================================

-- ================= START: PLUGINS ==================================================
require("lazy").setup({ import = "trifiasco.plugins" }, {
  change_detection = {
    notify = false,
  },
})
-- ================= END: PLUGINS ==================================================

require("trifiasco.core")
