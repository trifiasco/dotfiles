--[[
   this file will contain plugins and plugins related settings
]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- not sure it's needed. from the doc - Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- to automatically update when plugins.lua has any changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'-- My plugins here

  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  

  use {'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup({
          disable_filetype = { "TelescopePrompt" , "vim" },
        })
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
        require'nvim-tree'.setup {
            view = {
                side = 'left',
                width = 70
            },
			update_focused_file = {
				enable = true,
				update_cwd = true
			},
                git = {
                    enable = true,
                    ignore = false,
                    timeout = 500
                }
        }
        end
  }


  use {
    'EdenEast/nightfox.nvim', tag = "v1.0.0", config = [[require('plugin-configs.theme')]]
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = [[require('plugin-configs.lualine')]]
  }

  use {
      'numToStr/Navigator.nvim',
      config = function()
          require('Navigator').setup()
      end
  }

  -- use { 'sunjon/shade.nvim',
  --   config = function()
  --       require'shade'.setup {
  --           overlay_opacity = 90,
  --           opacity_step = 1
  --       }
  --       end
  -- }
  
  use {
      'nvim-treesitter/nvim-treesitter',
      -- need to checkout external modules for highlighting, folding, refactoring etc.
      --[[
         [requires = {
         [  'nvim-treesitter/nvim-treesitter-refactor',
         [  'nvim-treesitter/nvim-treesitter-textobjects',
         [},
         ]]
      run = ':TSUpdate',
      config = [[require('plugin-configs.nvim-treesitter')]]
  }

  use {
    {'neovim/nvim-lspconfig'},
    -- {'williamboman/nvim-lsp-installer', config = [[require('plugin-configs.lsp-installer-config')]]},
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim", config = [[require('plugin-configs.mason-lspconfig')]] },
    {'hrsh7th/cmp-nvim-lsp'}
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      {
        'L3MON4D3/LuaSnip',
        config = function()
            require('plugin-configs.snippets').setup()
        end
      },
      {"rafamadriz/friendly-snippets"},
      {"honza/vim-snippets"},
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-cmdline',
      {'hrsh7th/cmp-path', after = 'nvim-cmp'},
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      {'onsails/lspkind-nvim'}
    },
    config = [[require('plugin-configs.cmp')]],
  }

  use {
      -- must install ripgrep
      -- TODO: need to checkout if I need a exention sorter
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

	use {
		{'renerocksai/telekasten.nvim', config = [[require('plugin-configs.telekasten')]]},
		{'renerocksai/calendar-vim'}
	}
    use {
      "kevinhwang91/nvim-ufo",
      opt = true,
      event = { "BufRead" },
      wants = { "promise-async" },
      requires = "kevinhwang91/promise-async",
      config = function()
        require("ufo").setup {
          provider_selector = function(bufnr, filetype)
            return { "lsp", "indent" }
          end,
        }
        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      end,
    }

    -- Super fast buffer jump
    use {
      "phaazon/hop.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function()
          require("plugin-configs.nvim_hop")
        end, 2000)
      end,
    }

    -- code runner plugin
    -- use { 
    --     'michaelb/sniprun', 
    --     run = 'bash ./install.sh',
    --     config = function()
    --         require("plugin-configs.sniprun").setup()
    --     end,
    -- }
 --  use {
	-- 	'is0n/jaq-nvim',
 --    	config = [[require('plugin-configs.code-runner')]]
	-- }

  --> non lua plugins - TODO: replace with plugins written in Lua.

  use {
      {'tpope/vim-fugitive'},
      -- {'sotte/presenting.vim'},
      -- {'edkolev/tmuxline.vim'},
      -- {'tpope/vim-dispatch'},
      {'tpope/vim-surround'},
      {'tpope/vim-repeat'},
      {'airblade/vim-gitgutter'},
      {'jbyuki/nabla.nvim'},
      {'psf/black', branch = 'stable'},
      {'lervag/vimtex'},
      {'github/copilot.vim', config = [[require('plugin-configs.copilot')]]}
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

