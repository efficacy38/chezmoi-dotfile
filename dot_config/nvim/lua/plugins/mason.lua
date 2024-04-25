-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- add more arguments for adding more language servers
      })
      opts.automatic_installation = true
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- NOTE: geenral purpose language servers
        "asm_lsp",
        "asmfmt",
        "lua_ls",
        "stylua",
        "python",
        "pyright",
        "debugpy",
        "rust_analyzer",
        "delve",
        "templ",
        "cmakelang",
        "bash-language-server",
        "shellcheck",
        -- NOTE: web language linters
        "markdownlint",
        "markuplint",
        -- NOTE: infra language linter
        "yaml-language-server",
        "yamlfmt",
        "yaml-lint",
        "tflint",
        "jsonnet-language-server",
        "terraformls",
        "jinjalint",
        "ansible-lint",
        -- NOTE: code quality tools
        "prittier",
        "sonarlint",
        "semgrep",
        "write-good",
        "typo",
        "typo-lsp",
        "prettier",
        "stylua",
        "gitleaks",
        -- add more arguments for adding more null-ls sources
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "python",
        -- add more arguments for adding more debuggers
      })
    end,
  },
}
