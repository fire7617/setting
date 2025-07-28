return {
  {
    "rafamadriz/friendly-snippets",
    event = "VeryLazy",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged,InsertLeave",
    },
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jump(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<s-tab>",
        function()
          return require("luasnip").jump(-1) and "<Plug>luasnip-jump-prev" or "<s-tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
    },
  },
} 