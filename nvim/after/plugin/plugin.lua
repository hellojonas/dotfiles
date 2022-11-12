require('packer').startup(function(use)
   use {'wbthomason/packer.nvim'}
   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
   use { 'nvim-lua/plenary.nvim' }
   use { 'lewis6991/gitsigns.nvim', }
   use {'folke/tokyonight.nvim'}
   use {'tpope/vim-surround'}
   use { "kyazdani42/nvim-web-devicons" }
   use { "nvim-lua/popup.nvim" }
   use { "windwp/nvim-autopairs" }
   use { "numToStr/Comment.nvim" }
   use {
     'nvim-tree/nvim-tree.lua',
     tag = 'nightly'
   }
   use { "neovim/nvim-lspconfig" }
   use {
     "williamboman/mason.nvim",
     "williamboman/mason-lspconfig.nvim"
   }
   use 'mfussenegger/nvim-dap'
   use 'jose-elias-alvarez/null-ls.nvim'
   use 'nvim-telescope/telescope.nvim'

   -- Completion
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/nvim-cmp'
   use {
     "L3MON4D3/LuaSnip",
   }
end)
