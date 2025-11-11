-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt` vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }
  use ('0xstepit/flow.nvim', {
    lazy = false,
    priority = 1000,
    opts = {},
  })
  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'nvim-treesitter/playground' 
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      -- {'williamboman/mason.nvim'},
      -- {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
    }
  }
  use {
    'preservim/nerdtree',
    requires = {
      {'Xuyuanp/nerdtree-git-plugin'}
    }
  }
  -- add lazygit
  use({
    'kdheepak/lazygit.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'}
    },
  })
end)

