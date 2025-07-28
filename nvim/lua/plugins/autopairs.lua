return {
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>up",
        function()
          local Util = require("lazy.core.util")
          local map = vim.keymap.set
          local unmap = vim.keymap.del
          local which_key = require("which-key")
          local opts = { buffer = 0 }
          map("i", "(", "()<left>", opts)
          map("i", "[", "[]<left>", opts)
          map("i", "{", "{}<left>", opts)
          map("i", "'", "''<left>", opts)
          map("i", '"', '""<left>', opts)
          map("i", "`", "``<left>", opts)
          Util.info("Enabled manual pairs", { title = "Option" })
        end,
        desc = "Enable manual pairs",
      },
    },
  },
} 