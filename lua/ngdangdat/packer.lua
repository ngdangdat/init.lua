-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt` vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
    -- or                            , branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }
  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
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
  use { "ellisonleao/gruvbox.nvim" }
  vim.g.colorscheme = "gruvbox"
end)

