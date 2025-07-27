return {
  "nvimdev/lspsaga.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
      },
    })
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
    vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
  end,
}
