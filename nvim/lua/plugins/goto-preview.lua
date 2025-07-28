return {
  "rmagatti/goto-preview",
  --  event = "BufEnter",
  config = function()
    require("goto-preview").setup({
      width = 80, -- Width of the floating window (百分比)
      height = 60, -- Height of the floating window (百分比)
      border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border style
      default_mappings = true, -- Use default keybindings
      debug = false, -- Enable debug logging
      opacity = nil, -- Floating window opacity (nil for default)
      resizing_mappings = false, -- Resize window with keybindings
      -- 置中設定
      relative = "editor", -- 相對於編輯器置中
      row = 0.5, -- 垂直置中 (0.5 = 50%)
      col = 0.5, -- 水平置中 (0.5 = 50%)
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
    {
      "<leader>pc",
      "<cmd>lua require('goto-preview').close_all_win()<CR>",
      noremap = true,
      desc = "close all preview windows",
    },
  },
}
