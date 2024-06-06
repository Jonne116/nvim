local Utils = require("utils")

local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
-- local inoremap = Utils.inoremap
-- local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap
-- local xmap = Utils.xmap
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Close buffer
nnoremap("<C-c>", ":bd<CR>", "Close Buffer")

-- Move selected
vnoremap("J", ":m '>+1<CR>gv=gv", "Move selected down")
vnoremap("K", ":m '<-2<CR>gv=gv", "Move selected Up")

-- Move around windows
nnoremap("<C-h>", "<C-w>h", "Move to left window")
nnoremap("<C-j>", "<C-w>j", "Move to upper window")
nnoremap("<C-k>", "<C-w>k", "Move to window below")
nnoremap("<C-l>", "<C-w>l", "Move to right window")

-- Movement center
nnoremap("<C-u>", "<C-u>zz", "Move up and center")
nnoremap("<C-d>", "<C-d>zz", "Move down and center")

-- Splits
nnoremap("<leader>ws", ":split<CR>", "Split horizontaly")
nnoremap("<leader>vs", ":vsplit<CR>", "Split vertically")

-- Popualte substitution
nnoremap("<leader>s", ":s//g<Left><Left>")
nnoremap("<leader>S", ":%s//g<Left><Left>")
nnoremap("<leader><C-s>", ":%s//gc<Left><Left><Left>")

vnoremap("<leader>s", ":s//g<Left><Left>")
vnoremap("<leader><A-s>", ":%s//g<Left><Left>")
vnoremap("<leader>S", ":%s//gc<Left><Left><Left>")

-- Delete buffer
nnoremap("<A-w>", ":bd<CR>", "Delete buffer")

-- Yank to end of line
nnoremap("Y", "y$", "Yank to end of line")

-- Copy to system clippboard
nnoremap("<leader>y", '"+y', "Copy to system clipboard")
vnoremap("<leader>y", '"+y', "Copy to system clipboard")

-- Paste from system clippboard
nnoremap("<leader>p", '"*p', "Paste from system clipboard")
vnoremap("<leader>p", '"*p', "Paste from system clipboard")

-- Local list
nnoremap("<leader>lo", ":lopen<CR>", "Open local list")
nnoremap("<leader>lc", ":lclose<CR>", "Close local list")
nnoremap("<C-n>", ":lnext<CR>", "Local list next")
nnoremap("<C-p>", ":lprev<CR>", "Local list previous")

-- Quickfix list
nnoremap("<leader>co", ":copen<CR>", "Open quickfix list")
nnoremap("<leader>cc", ":cclose<CR>", "Close quickfix list")
nnoremap("<C-N>", ":cnext<CR>", "Quickfix list next")
nnoremap("<C-P>", ":cprev<CR>", "Quickfix list previous")

-- Open file in default application
nnoremap("<leader>xo", "<Cmd> !xdg-open %<CR><CR>", "Open file in default application")

-- Fugitive
nnoremap("<leader>G", ":G<CR>", "Fugutive")

-- Show line diagnostics
nnoremap("<leader>d", '<Cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>', "Show line diagnostics")

-- Open local diagnostics in local list
nnoremap("<leader>D", "<Cmd>lua vim.diagnostic.setloclist()<CR>", "Open local diagnostics in local list")

-- Open all project diagnostics in quickfix list
nnoremap("<leader><A-d>", "<Cmd>lua vim.diagnostic.setqflist()<CR>", "Open all project diagnostics in quickfix list")

-- Telescope
nnoremap("<leader>ff", "<Cmd>Telescope find_files<CR>", "Telescope find in files")
nnoremap("<leader>fr", "<Cmd>Telescope live_grep<CR>", "Telescope find in files")
nnoremap("<leader>fb", "<Cmd>Telescope buffers<CR>", "Telescope find in buffers")
nnoremap("<leader>fg", "<Cmd>Telescope git_files<CR>", "Telescope live grep")

-- Harpoon
nnoremap("<leader>hm", "<Cmd>lua require('harpoon.mark').add_file()<CR>", "Harpoon add file")
nnoremap("<leader>j", "<Cmd>lua require('harpoon.ui').nav_next()<CR>", "Harpoon next file")
nnoremap("<leader>k", "<Cmd>lua require('harpoon.ui').nav_prev()<CR>", "Harpoon previous file")

-- File explorer
nnoremap("<leader>z", "<Cmd>NvimTreeToggle<CR>", "Open file explorer tree")  -- NvimTree

-- Diagnostic
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Debugging
nnoremap("<leader>c", "<Cmd>lua require'dap'.continue()<CR>", "Dap continue")
nnoremap("<leader>so", "<<Cmd>lua require'dap'.step_over()<CR>", "Dap step over")
nnoremap("<leader>si", "<Cmd>lua require'dap'.step_into()<CR>", "Dap step into")
nnoremap("<leader>se", "<Cmd>lua require'dap'.step_out()<CR>", "Dap step out")
nnoremap("<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", "Dap toggle breakpoint")
nnoremap("<leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Dap set breakpoint with condition")
nnoremap("<leader>bn", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "Dap set breakpoint with log")
nnoremap("<leader>ro", "<Cmd>lua require'dap'.repl.open()<CR>", "Dap open REPL / Debug-console")
nnoremap("<leader>rl", "<Cmd>lua require'dap'.run_last()<CR>", "Dap run last")

-- JDTLS
nnoremap("<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Java organize imports")
nnoremap("crv", "<Cmd>lua require('jdtls').extract_variable()<CR>", "Java extract variable")
vnoremap("crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Java extract variable (visual)")
nnoremap("crc", "<Cmd>lua require('jdtls').extract_constant()<CR>", "Java extract constant")
vnoremap("crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Java extract constant (visual)")
vnoremap("crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Java extract method (visual)")
nnoremap("<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>", "Java test class")
nnoremap("<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Java test method")
