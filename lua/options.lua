-- Visual
vim.o.conceallevel       = 0
vim.o.cmdheight          = 1
vim.o.pumheight          = 10
vim.o.showmode           = false
vim.o.showtabline        = 0
vim.o.title              = true
vim.o.termguicolors      = true
vim.wo.number            = true
vim.wo.relativenumber    = true
vim.wo.signcolumn        = "yes"
vim.wo.cursorline        = false

-- Behaviour
vim.o.hlsearch           = false
vim.o.ignorecase         = true
vim.o.smartcase          = true
vim.o.smarttab           = true
vim.o.smartindent        = true
vim.o.expandtab          = true
vim.o.tabstop            = 4
vim.o.softtabstop        = 4
vim.o.shiftwidth         = 4
vim.o.splitbelow         = true
vim.o.splitright         = true
vim.o.scrolloff          = 12
vim.o.sidescrolloff      = 8
vim.o.mouse             = ""

-- Vim specific
vim.o.hidden             = true
vim.o.fileencoding       = "utf-8"
vim.o.spell              = false
vim.o.spelllang          = "en_us"
vim.o.completeopt        = "menuone,noinsert,noselect"
vim.o.wildmode           = "longest,full"
vim.o.updatetime         = 300

-- Error messages
vim.diagnostic.config {
  virtual_text = true,
  underline = false,
  signs = true,
}
