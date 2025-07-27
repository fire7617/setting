return {
  "rmagatti/goto-preview",
  --  event = "BufEnter",
  config = function()
    require("goto-preview").setup({
      width = 120, -- Width of the floating window
      height = 15, -- Height of the floating window
      border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border style
      default_mappings = true, -- Use default keybindings
      debug = false, -- Enable debug logging
      opacity = nil, -- Floating window opacity (nil for default)
      resizing_mappings = false, -- Resize window with keybindings
    })
  end,
  keys = {
    {
      "<leader>pd",
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      noremap = true,
      desc = "goto preview definition",
    },
    {
      "<leader>pD",
      "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
      noremap = true,
      desc = "goto preview declaration",
    },
    {
      "<leader>pi",
      "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
      noremap = true,
      desc = "goto preview implementation",
    },
    {
      "<leader>py",
      "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
      noremap = true,
      desc = "goto preview type definition",
    },
    {
      "<leader>pr",
      "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
      noremap = true,
      desc = "goto preview references",
    },
    {
      "<leader>P",
      "<cmd>lua require('goto-preview').close_all_win()<CR>",
      noremap = true,
      desc = "close all preview windows",
    },
  },
}
