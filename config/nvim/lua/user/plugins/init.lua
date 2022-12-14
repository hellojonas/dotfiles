require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "tpope/vim-surround" }
  use { "tpope/vim-repeat" }
  use { "tpope/vim-fugitive" }
  use { "windwp/nvim-autopairs" }
  use { "numToStr/Comment.nvim" }

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
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { "neovim/nvim-lspconfig" }
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  })
  -- use { "jose-elias-alvarez/null-ls.nvim" }

  -- -- Completion
  use { "nvim-lua/popup.nvim" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/nvim-cmp" }
  use { "L3MON4D3/LuaSnip" }

  -- use {
  --   "williamboman/mason.nvim",
  --   "williamboman/mason-lspconfig.nvim"
  -- }
  use { "lewis6991/gitsigns.nvim", }
  use { "kyazdani42/nvim-web-devicons" }
  use { "folke/tokyonight.nvim" }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- use {
  --   "nvim-tree/nvim-tree.lua",
  --   tag = "nightly"
  -- }

  use { "mfussenegger/nvim-jdtls" }
  -- use { "mfussenegger/nvim-dap" }

  use { 'notjedi/nvim-rooter.lua' }

  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  }
end)
