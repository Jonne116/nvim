local Utils = require('utils')

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
-- local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap
-- local xmap = Utils.xmap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Run omnifunc, mostly used for autocomplete
inoremap("<C-SPACE>", "<C-x><C-o>")

-- Close buffer
nnoremap("<C-c>", ":bd<CR>")

-- Move around windows
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Movement center
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")

-- Splits
nnoremap("<leader>ws", ":split<CR>")
nnoremap("<leader>vs", ":vsplit<CR>")

-- Popualte substitution
nnoremap("<leader>s", ":s//g<Left><Left>")
nnoremap("<leader>S", ":%s//g<Left><Left>")
nnoremap("<leader><C-s>", ":%s//gc<Left><Left><Left>")

vnoremap("<leader>s", ":s//g<Left><Left>")
vnoremap("<leader><A-s>", ":%s//g<Left><Left>")
vnoremap("<leader>S", ":%s//gc<Left><Left><Left>")

-- Delete buffer
nnoremap("<A-w>", ":bd<CR>")

-- Yank to end of line
nnoremap("Y", "y$")

-- Copy to system clippboard
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

-- Paste from system clippboard
nnoremap("<leader>p", '"*p')
vnoremap("<leader>p", '"*p')

-- Local list
nnoremap("<leader>lo", ":lopen<CR>")
nnoremap("<leader>lc", ":lclose<CR>")
nnoremap("<C-n>", ":lnext<CR>")
nnoremap("<C-p>", ":lprev<CR>")

-- Quickfix list
nnoremap("<leader>co", ":copen<CR>")
nnoremap("<leader>cc", ":cclose<CR>")
nnoremap("<C-N>", ":cnext<CR>")
nnoremap("<C-P>", ":cprev<CR>")

-- Open file in default application
nnoremap("<leader>xo", "<Cmd> !xdg-open %<CR><CR>")

-- Fugitive
nnoremap("<leader>G", ":G<CR>")

-- Show line diagnostics
nnoremap("<leader>d", '<Cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>')

-- Open local diagnostics in local list
nnoremap("<leader>D", "<Cmd>lua vim.diagnostic.setloclist()<CR>")

-- Open all project diagnostics in quickfix list
nnoremap("<leader><A-d>", "<Cmd>lua vim.diagnostic.setqflist()<CR>")

-- Telescope
nnoremap("<leader>ff", "<Cmd>Telescope find_files<CR>")
nnoremap("<leader>fb", "<Cmd>Telescope buffers<CR>")
nnoremap("<leader>fg", "<Cmd>Telescope live_grep<CR>")

-- File explorer
nnoremap("<leader>z", "<Cmd>NvimTreeToggle<CR>")  -- NvimTree

-- Debugging
nnoremap("<leader>c", "<Cmd>lua require'dap'.continue()<CR>")
nnoremap("<leader>so", "<<Cmd>lua require'dap'.step_over()<CR>")
nnoremap("<leader>si", "<Cmd>lua require'dap'.step_into()<CR>")
nnoremap("<leader>se", "<Cmd>lua require'dap'.step_out()<CR>")
nnoremap("<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
nnoremap("<leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nnoremap("<leader>bn", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
nnoremap("<leader>ro", "<Cmd>lua require'dap'.repl.open()<CR>")
nnoremap("<leader>rl", "<Cmd>lua require'dap'.run_last()<CR>")

nnoremap("<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>")
nnoremap("crv", "<Cmd>lua require('jdtls').extract_variable()<CR>")
vnoremap("crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
nnoremap("crc", "<Cmd>lua require('jdtls').extract_constant()<CR>")
vnoremap("crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>")
vnoremap("crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")

nnoremap("<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>")
nnoremap("<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
nnoremap("<leader>ss", "<Cmd>lua require'jdtls'.open_jdt_link()<CR>")
