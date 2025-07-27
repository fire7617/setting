-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Avante.nvim (Gemini API) 快捷鍵
vim.keymap.set("n", "<leader>aa", "<cmd>AvanteAsk<CR>", { desc = "Ask AI for code suggestion" })
vim.keymap.set("n", "<leader>ac", "<cmd>AvanteChat<CR>", { desc = "Chat with codebase" })
vim.keymap.set("n", "<leader>an", "<cmd>AvanteChatNew<CR>", { desc = "Create new chat" })
vim.keymap.set("n", "<leader>at", "<cmd>AvanteToggle<CR>", { desc = "Toggle AI panel" })
vim.keymap.set("n", "<leader>ae", "<cmd>AvanteEdit<CR>", { desc = "Edit selected block" })
vim.keymap.set("n", "<leader>ah", "<cmd>AvanteHistory<CR>", { desc = "Show chat history" })
vim.keymap.set("n", "<leader>as", "<cmd>AvanteStop<CR>", { desc = "Stop current AI request" })
