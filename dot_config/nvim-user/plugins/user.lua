return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- themes
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "folke/tokyonight.nvim"},
  { "morhetz/gruvbox"},


  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>T",
        "<CMD>TodoTelescope<CR>",
        desc = "Open TODOs in Telescope.",
      },
    },
    event = "User AstroFile",
  },
  {
    "mbbill/undotree",
    -- opts = {},
    init = function()
      vim.g.undotree_HelpLine = 0
      vim.g.undotree_ShortIndicators = 1
    end,
    event = "User AstroFile",
    keys = {
      { "<leader>U", ":UndotreeToggle<CR>" },
    },
  },
  {
    "github/copilot.vim",
    event = "User LazyDone",
    init = function()
      vim.g.copilot_filetypes = { yaml = true, json = true, toml = true }
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "dense-analysis/ale",
    event = "User LazyDone",
  },
  {
    "leoluz/nvim-dap-go",
    event = "User LazyDone",
    ft = "go",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
  {
    "olexsmir/gopher.nvim",
    event = "User LazyDone",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoUpdateBinaries]]
    end,
  },
}
