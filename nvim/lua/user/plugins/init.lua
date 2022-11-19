require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }
  -- use { "tpope/vim-surround" }
  -- use { "tpope/vim-repeat" }
  -- use { "windwp/nvim-autopairs" }
  -- use { "numToStr/Comment.nvim" }

  use { "nvim-lua/plenary.nvim" }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { 'nvim-lua/plenary.nvim' }
    }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  -- use { "neovim/nvim-lspconfig" }
  -- use { "jose-elias-alvarez/null-ls.nvim" }

  -- -- Completion
  use { "nvim-lua/popup.nvim" }
  -- use { "hrsh7th/cmp-nvim-lsp" }
  -- use { "hrsh7th/cmp-buffer" }
  -- use { "hrsh7th/cmp-path" }
  -- use { "hrsh7th/cmp-cmdline" }
  -- use { "hrsh7th/nvim-cmp" }
  -- use { "L3MON4D3/LuaSnip" }

  -- use {
  --   "williamboman/mason.nvim",
  --   "williamboman/mason-lspconfig.nvim"
  -- }
  -- use { "lewis6991/gitsigns.nvim", }
  -- use { "kyazdani42/nvim-web-devicons" }
  -- use { "folke/tokyonight.nvim" }
  -- use {
  --   "nvim-tree/nvim-tree.lua",
  --   tag = "nightly"
  -- }

  -- use { "mfussenegger/nvim-dap" }
  -- use { "mfussenegger/nvim-jdtls" }
end)
