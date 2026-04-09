return {
  {
    "williamboman/mason.nvim",
    opts = {},
 },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
          "lua_ls",
          -- "scala_metals",
          "rust_analyzer",
          "pyright",
          "clangd",
          -- "gopls",
          "ts_ls",
        },
    },
  },


  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "folke/lazydev.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.lua_ls.setup({ capabilities = capabilities,
          settings = { Lua = { diagnostics = { globals = { "vim" } } } } })

        lspconfig.pyright.setup({ capabilities = capabilities })
        lspconfig.rust_analyzer.setup({ capabilities = capabilities })
        lspconfig.clangd.setup({ capabilities = capabilities })
        lspconfig.gopls.setup({ capabilities = capabilities })
        lspconfig.ts_ls.setup({ capabilities = capabilities })
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
          end

          map("gd",        vim.lsp.buf.definition,      "Перейти к определению")
          map("gr",        vim.lsp.buf.references,       "Список ссылок")
          map("K",         vim.lsp.buf.hover,            "Документация")
          map("<leader>rn",vim.lsp.buf.rename,           "Переименовать")
          map("<leader>ca",vim.lsp.buf.code_action,      "Code actions")
          map("<leader>d", vim.diagnostic.open_float,    "Показать ошибку")
          map("[d",        vim.diagnostic.goto_prev,     "Предыдущая ошибка")
          map("]d",        vim.diagnostic.goto_next,     "Следующая ошибка")
        end,
      })

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN]  = "▲",
            [vim.diagnostic.severity.HINT]  = "⚑",
            [vim.diagnostic.severity.INFO]  = "»",
          },
        },
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          prefix = "●",
        },
      })
    end,
  },
}
