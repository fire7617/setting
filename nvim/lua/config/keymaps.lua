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

-- 新增：檔案標記相關快捷鍵
vim.keymap.set("n", "<leader>af", function()
  -- 快速標記當前檔案到 Avante
  local current_file = vim.fn.expand("%:p")
  if current_file ~= "" then
    vim.cmd("AvanteChat")
    -- 這裡可以添加自動插入檔案標記的邏輯
    print("已準備標記檔案: " .. current_file)
  else
    print("沒有打開的檔案")
  end
end, { desc = "Mark current file for AI analysis" })

vim.keymap.set("n", "<leader>aF", function()
  -- 使用 Telescope 選擇檔案並標記
  local builtin = require("telescope.builtin")
  builtin.find_files({
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      map("i", "<CR>", function()
        local selection = require("telescope.actions.state").get_selected_entry()
        actions.close(prompt_bufnr)
        -- 打開 Avante 並標記選中的檔案
        vim.cmd("AvanteChat")
        print("已選擇檔案: " .. selection[1])
      end)
      return true
    end,
  })
end, { desc = "Select file to mark for AI analysis" })

-- ============================================================================
-- LSP (Language Server Protocol) 快捷鍵設定
-- ============================================================================
-- 這些快捷鍵需要 LSP 伺服器支援，例如：
-- - Python: pyright, python-lsp-server
-- - JavaScript/TypeScript: tsserver
-- - Go: gopls
-- - Rust: rust-analyzer
-- - C/C++: clangd
-- - Lua: lua_ls
-- - PHP: intelephense
-- ============================================================================

-- 主要導航功能
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to Definition - 跳轉到定義" })
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Go to References - 查看所有引用" })
vim.keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<CR>", { desc = "Go to Implementation - 跳轉到實現" })
vim.keymap.set("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Type Definition - 類型定義" })
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to Declaration - 跳轉到宣告" })

-- 符號搜尋功能
vim.keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document Symbols - 文件符號" })
vim.keymap.set("n", "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "Workspace Symbols - 工作區符號" })

-- 程式碼操作功能
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename - 重命名變數/函數" })
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Action - 程式碼動作" })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover Documentation - 查看文檔" })

-- ============================================================================
-- 跳轉歷史功能 (Back/Forward)
-- ============================================================================
-- Neovim 內建的跳轉功能，不需要額外設定：
-- <C-o> - 跳回上一個位置 (Go Back)
-- <C-i> - 跳前到下一個位置 (Go Forward)
-- 
-- 使用方式：
-- 1. 使用 gd 跳轉到定義後
-- 2. 按 <C-o> 跳回原位置
-- 3. 按 <C-i> 再次跳轉到定義
-- ============================================================================

-- ============================================================================
-- 診斷功能 (Diagnostics)
-- ============================================================================
-- 用於瀏覽程式碼中的錯誤、警告和提示
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Previous Diagnostic - 上一個診斷" })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic - 下一個診斷" })
-- 診斷功能使用新的快捷鍵，避免與 NeoTree 衝突
vim.keymap.set("n", "<leader>de", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show Diagnostic - 顯示診斷" })

-- Goto Preview 快捷鍵
vim.keymap.set("n", "<leader>pc", "<cmd>lua require('goto-preview').close_all_win()<CR>", { desc = "Close All Preview Windows - 關閉所有預覽窗口" })

-- Telescope 搜尋快捷鍵
vim.keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "Search Current Word - 搜尋當前單詞" })
vim.keymap.set("v", "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "Search Selected Text - 搜尋選中文字" })

-- Treesitter 檢查快捷鍵
vim.keymap.set("n", "<leader>ts", "<cmd>TSBufInfo<CR>", { desc = "Treesitter Buffer Info - Treesitter 緩衝區信息" })
vim.keymap.set("n", "<leader>ti", "<cmd>TSInstallInfo<CR>", { desc = "Treesitter Install Info - Treesitter 安裝信息" })

-- Treesitter 側邊欄功能
vim.keymap.set("n", "<leader>so", "<cmd>SymbolsOutline<CR>", { desc = "Symbols Outline - 程式碼大綱側邊欄" })
vim.keymap.set("n", "<leader>sf", "<cmd>SymbolsOutline<CR>", { desc = "Functions Outline - 函數大綱側邊欄" })

-- 手動設定縮排快捷鍵
vim.keymap.set("n", "<leader>t4", function()
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
  vim.opt_local.expandtab = true
  print("已設定為 4 格縮排")
end, { desc = "Set 4 spaces indentation - 設定 4 格縮排" })

vim.keymap.set("n", "<leader>t2", function()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
  vim.opt_local.expandtab = true
  print("已設定為 2 格縮排")
end, { desc = "Set 2 spaces indentation - 設定 2 格縮排" })

-- PHP 專用快捷鍵
vim.keymap.set("n", "<leader>tp", function()
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
  vim.opt_local.expandtab = true
  print("PHP 縮排已設定為 4 格")
end, { desc = "Set PHP 4 spaces indentation - 設定 PHP 4 格縮排" })

-- ============================================================================
-- 使用範例：
-- ============================================================================
-- 1. 跳轉到定義：
--    - 將游標放在函數名稱上
--    - 按 gd
--    - 選擇要跳轉的定義
--
-- 2. 查看所有引用：
--    - 將游標放在變數或函數上
--    - 按 gr
--    - 查看所有使用該變數/函數的地方
--
-- 3. 重命名：
--    - 將游標放在要重命名的變數上
--    - 按 <leader>rn
--    - 輸入新名稱，會自動更新所有引用
--
-- 4. 查看文檔：
--    - 將游標放在函數上
--    - 按 K
--    - 查看函數的文檔說明
--
-- 5. 程式碼動作：
--    - 將游標放在有錯誤或警告的地方
--    - 按 <leader>ca
--    - 選擇可用的修復動作
--
-- 6. 跳轉歷史：
--    - 使用 gd 跳轉後
--    - 按 <C-o> 跳回原位置
--    - 按 <C-i> 再次跳轉
-- ============================================================================
