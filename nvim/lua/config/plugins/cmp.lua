return {
  {
    "saghen/blink.cmp",
    version = "v0.*",
    dependencies = {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },

    opts = {
      keymap = {
        preset = "default",
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      completion = {
        trigger = {
          show_on_insert_on_trigger_character = true,
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "rounded" },
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind",           gap = 1 },
              { "source_name" },
            },
          },
        },
      },

      -- ↓ убраны use_typo_resistance, use_frecency, use_proximity
      fuzzy = {},

      signature = {
        enabled = true,
        window = { border = "rounded" },
      },
    },
  },
}
