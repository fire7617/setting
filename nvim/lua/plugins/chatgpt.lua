return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "bach -c 'echo -n $ChatGPT_API_KEY'",
      actions_paths = { "~/.config/nvim/chatgpt-actions.json" },
      chat = {
        keymaps = {
          close = "<C-c>",
          yank_last = "<C-y>",
          scroll_up = "<C-k>",
          scroll_down = "<C-j>",
        },
      },
    })
    -- 設定快捷鍵
    vim.api.nvim_set_keymap("n", "<leader>gpt", ":ChatGPT<CR>", { noremap = true, silent = true })
  end,
}
