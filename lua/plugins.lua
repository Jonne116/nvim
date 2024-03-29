-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
end

-- Rerun PackerCompile everytime pluggins.lua is updated
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Load Packer
cmd([[packadd packer.nvim]])

-- Initialize pluggins
return require('packer').startup(function(use)
  -- Let Packer manage itself
  use({'wbthomason/packer.nvim', opt = true})

  -- Formatting
  use 'junegunn/vim-easy-align'
  use({ "terrortylor/nvim-comment",
    config = function () require('plugins.comment') end
  })

  use'ThePrimeagen/harpoon'
use({ 'folke/todo-comments.nvim',
requires = {'nvim-lua/plenary.nvim'},
config = function ()
  require('todo-comments').setup({})
end
})
  -- Themes
  use({ 'Mofiqul/vscode.nvim',
      config = function() require('themes') end
  })

  --git commands
  use 'tpope/vim-fugitive'
  use ({
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('plugins.gitsigns') end
  })
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- LSP server
  use({
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end,
    requires = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
    }
})

  -- Debugging
  use "mfussenegger/nvim-jdtls"
  use {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    config = function() require('plugins.dapuiconfig') end
  }
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  -- statusline
  use({
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine') end,
  })

  -- NvimTree
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.nvimtree') end,  -- Must add this manually
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'
  })
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function() require('plugins.telescope') end,
  })
  use({'nvim-telescope/telescope-fzf-native.nvim', run ='make'})

  if packer_bootstrap then
    require('packer').sync()
  end
end)
