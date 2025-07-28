-- 設定 .volt 為 html 語法
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.volt",
  callback = function()
    vim.bo.filetype = "html"
  end,
})

-- 可選：讓 treesitter 把 .volt 當作 html 處理（語法高亮更好）
local ok, parsers = pcall(require, "nvim-treesitter.parsers")
if ok then
  parsers.filetype_to_parsername.volt = "html"
end
