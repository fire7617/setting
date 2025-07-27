# GPTscript.nvim 使用指南

## 📋 概述

GPTscript.nvim 是一個 Neovim 插件，它集成了 GPTscript - 一個用於創建和運行 AI 腳本的工具。

## 🚀 功能特點

- **腳本創建**: 創建可重複使用的 AI 腳本
- **語法高亮**: 支持 .gpt 文件的語法高亮
- **自動完成**: 智能代碼補全
- **快捷鍵**: 快速運行和管理腳本
- **集成**: 與 OpenAI API 無縫集成

## ⚙️ 配置

### 基本配置
```lua
require("gptscript").setup({
  api_key = os.getenv("OPENAI_API_KEY"),
  default_model = "gpt-4o-mini",
  scripts_dir = "~/.gptscript",
})
```

### 快捷鍵
- `<leader>gr` - 運行當前腳本
- `<leader>gs` - 運行選中的腳本
- `<leader>gn` - 創建新腳本
- `<leader>gl` - 列出所有腳本
- `<leader>ge` - 編輯腳本

## 📝 腳本語法

### 基本結構
```yaml
name: script-name
description: 腳本描述

args:
  param1: 參數描述
  param2: 參數描述

output: |
  輸出模板
  $param1
  $param2
```

### 示例腳本

#### 1. 代碼註釋生成器
```yaml
name: code-commenter
description: 為代碼生成註釋

args:
  code: 需要註釋的代碼
  language: 編程語言

output: |
  請為以下 $language 代碼生成清晰的註釋：
  
  ```$language
  $code
  ```
```

#### 2. 錯誤調試助手
```yaml
name: debug-helper
description: 幫助調試代碼問題

args:
  error: 錯誤信息
  code: 相關代碼

output: |
  錯誤信息：$error
  
  代碼：
  ```$code
  ```
  
  請分析問題並提供解決方案。
```

## 🔧 使用方法

### 1. 創建新腳本
```vim
:leader>gn
```

### 2. 運行腳本
```vim
:leader>gr
```

### 3. 運行選中的腳本
```vim
:leader>gs
```

### 4. 列出所有腳本
```vim
:leader>gl
```

## 📁 腳本目錄

默認腳本目錄：`~/.gptscript/`

您可以將常用的腳本放在這裡，方便管理和重用。

## 🎯 最佳實踐

1. **命名規範**: 使用描述性的腳本名稱
2. **參數設計**: 設計清晰的輸入參數
3. **輸出格式**: 使用結構化的輸出模板
4. **錯誤處理**: 在腳本中包含錯誤處理邏輯
5. **文檔化**: 為腳本添加詳細的描述

## 🔗 相關資源

- [GPTscript 官方文檔](https://github.com/gptscript-ai/gptscript)
- [GPTscript.nvim 插件](https://github.com/gptscript-ai/gptscript.nvim)
- [OpenAI API 文檔](https://platform.openai.com/docs)

## 🐛 故障排除

### 常見問題

1. **API 密鑰錯誤**
   - 確保 `OPENAI_API_KEY` 環境變數已設置
   - 檢查 API 密鑰是否有效

2. **腳本語法錯誤**
   - 檢查 YAML 語法
   - 確保參數定義正確

3. **插件未載入**
   - 檢查插件是否正確安裝
   - 重新啟動 Neovim

### 調試模式

啟用調試模式以獲取更多信息：
```lua
require("gptscript").setup({
  debug = true,
})
``` 