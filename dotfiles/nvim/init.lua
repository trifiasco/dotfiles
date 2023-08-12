-- [[
-- 	This is the entrypoint of the whole configuration
--
-- ]]
--

-- absolute basics
-- map leader is required by lazy.nvim
vim.g.mapleader = ','
vim.g.maplocalleader = " "


-- @TODO:CHECK
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- colorscheme
vim.cmd.colorscheme('habamax')

-- Turns off netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

-- ================= START: PLUGIN MANAGER SETUP =====================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
require("lazy").setup("plugins")
-- ================= END: PLUGINS ==================================================

require("config.sets")
require("config.keymaps")
