return {
  { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim", "saghen/blink.cmp" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local on_attach = function(_, bufnr)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end
        map("gd",          function() vim.lsp.buf.definition() end,     "Перейти к определению")
        map("gD",          vim.lsp.buf.declaration,    "Перейти к объявлению")
        map("gr",          vim.lsp.buf.references,     "Найти ссылки")
        map("gi",          vim.lsp.buf.implementation, "Реализации")
        map("K",           vim.lsp.buf.hover,          "Документация")
        map("<leader>rn",  vim.lsp.buf.rename,         "Переименовать")
        map("<leader>ca",  vim.lsp.buf.code_action,    "Code actions")
        map("<leader>lf",  vim.lsp.buf.format,         "Форматировать")
      end

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "ts_ls", "rust_analyzer" },
        automatic_installation = true,
      })

      -- Вместо setup_handlers — явный список серверов
      local servers = { "pyright", "ts_ls", "rust_analyzer" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end

      -- lua_ls отдельно — нужен специфичный конфиг
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        float = { border = "rounded" },
      })
    end,
  },
}
