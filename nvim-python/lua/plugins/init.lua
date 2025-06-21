return {
  -- Format on save with Conform
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts  = require("configs.conform"),
  },

  -- Core LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },

  -- Java LSP helpers (code generation)
  {
    "mfussenegger/nvim-jdtls",
    ft     = "java",
    config = function()
      -- uses the jdtls.setup in lspconfig.lua
    end,
  },

  -- Java IDE integration: constructors, getters/setters, override tags
  {
    "nvim-java/nvim-java",
    ft     = "java",
    config = function()
      require("java").setup()
    end,
  }, -- note: require("java"), not require("nvim-java") :contentReference[oaicite:6]{index=6}

  -- Autocompletion engine (nvim-cmp) with LSP & snippet sources
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp  = require("cmp")
      local conf = require("nvchad.configs.cmp")
      conf.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      })
      conf.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = true })
        else
          fallback()
        end
      end, { "i", "s" })
      return conf
    end,
  },

  -- Snippet engine and community snippet collections
  { "rafamadriz/friendly-snippets", event = "InsertEnter" },
  { "L3MON4D3/LuaSnip",            event = "InsertEnter" },

  -- Treesitter for syntax & incremental selection
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript", "typescript", "tsx",
        "python", "java",
      },
    },
  },

  -- TypeScript/JavaScript tooling (with React/JSX)
  {
    "jose-elias-alvarez/typescript.nvim",
    ft     = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("typescript").setup({
        server = { capabilities = require("cmp_nvim_lsp").default_capabilities() },
      })
    end,
  },

  -- Formatting & linting via null-ls (Prettier, Black)
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.black,
        },
      }
    end,
  },
}
