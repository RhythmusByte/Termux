return {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },

  ui = {
    icons = {
      ft       = "",
      lazy     = "󰂠 ",
      loaded   = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin", "tohtml", "getscript", "getscriptPlugin",
        "gzip", "logipat", "netrw", "netrwPlugin", "netrwSettings",
        "netrwFileHandlers", "matchit", "tar", "tarPlugin", "rrhelper",
        "spellfile_plugin", "vimball", "vimballPlugin", "zip", "zipPlugin",
        "tutor", "rplugin", "syntax", "synmenu", "optwin", "compiler",
        "bugreport", "ftplugin",
      },
    },
  },

  -- ensure Mason-managed LSP servers are installed
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- Java
        "jdtls",
        -- Python
        "pyright",
        -- JavaScript / TypeScript + React
        "tsserver",
        -- Linting for JS/TS
        "eslint",
      },
    },
  },
}
