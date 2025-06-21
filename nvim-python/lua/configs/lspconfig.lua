-- Load NVChad defaults for LSP (once)
local defaults = require("nvchad.configs.lspconfig").defaults()

-- Enable NVChad’s built-in simple servers
vim.lsp.enable({ "html", "cssls" })

-- LSPConfig & completion capabilities
local lspconfig    = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Python LSP (pyright)
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach    = function(client, bufnr)
    local opts = { buffer = bufnr, silent = true, noremap = true }
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    keymap("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    keymap("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})

-- JavaScript/TypeScript LSP (ts_ls, not tsserver)
lspconfig.ts_ls.setup({
  capabilities = capabilities,
  on_attach    = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false

    local opts = { buffer = bufnr, silent = true, noremap = true }
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    keymap("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    keymap("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})

-- ESLint for linting JS/TS
lspconfig.eslint.setup({
  capabilities = capabilities,
  settings     = { format = { enable = true } },
  on_attach    = function(client, bufnr)
    local opts = { buffer = bufnr, silent = true, noremap = true }
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    keymap("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    keymap("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap("n", "]d", vim.diagnostic.goto_next, opts)

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer  = bufnr,
      command = "EslintFixAll",
    })
  end,
})

-- Java LSP (jdtls)
lspconfig.jdtls.setup({
  capabilities = capabilities,
  cmd = { vim.fn.expand("$HOME/.java-lsp/bin/jdtls") },
  root_dir     = require("jdtls.setup").find_root({ ".git", "pom.xml", "build.gradle" }),
  settings     = {
    java = {
      signatureHelp   = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion      = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "java.util.Objects.requireNonNull",
        },
      },
      sources = {
        organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 },
      },
      codeGeneration = {
        generateComments = true,
        toString         = { template = "${object.className}{${member.name()}=${member.name()}}" },
      },
    },
  },
  on_attach = function(client, bufnr)
    local jdtls = require("jdtls")
    local opts = { buffer = bufnr, silent = true, noremap = true }
    local keymap = vim.keymap.set

    -- JDTLS custom keybindings
    keymap("n", "<Leader>gc", jdtls.generate_constructor, opts)
    keymap("n", "<Leader>gm", jdtls.generate_getters_setters, opts)
    keymap("n", "<Leader>go", jdtls.organize_imports, opts)
    keymap("n", "<Leader>ov", function()
      vim.lsp.buf.code_action({ context = { only = { "source.generate" } } })
    end, opts)

    -- Standard LSP keybindings
    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    keymap("n", "<Leader>rn", vim.lsp.buf.rename, opts)
    keymap("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap("n", "]d", vim.diagnostic.goto_next, opts)

    local ok, jdtls_dap = pcall(require, "jdtls.dap")
    if ok and jdtls_dap then
      jdtls_dap.setup_dap_main_class_configs()
    end
  end,
})
