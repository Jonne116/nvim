local M = {}

function M.map(mode, lhs, rhs, desc)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {desc = desc, silent =  true})
end

function M.noremap(mode, lhs, rhs, desc)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {desc = desc, noremap = true, silent = true})
end

function M.exprnoremap(mode, lhs, rhs, desc)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {desc = desc, noremap = true, silent = true, expr = true})
end

function M.nmap(lhs, rhs, desc) M.map("n", lhs, rhs, desc) end

function M.xmap(lhs, rhs, desc) M.map("x", lhs, rhs, desc) end

function M.nnoremap(lhs, rhs, desc) M.noremap("n", lhs, rhs, desc) end

function M.vnoremap(lhs, rhs, desc) M.noremap("v", lhs, rhs, desc) end

function M.xnoremap(lhs, rhs, desc) M.noremap("x", lhs, rhs, desc) end

function M.inoremap(lhs, rhs, desc) M.noremap("i", lhs, rhs, desc) end

function M.tnoremap(lhs, rhs, desc) M.noremap("t", lhs, rhs, desc) end

function M.exprnnoremap(lhs, rhs, desc) M.exprnoremap("n", lhs, rhs, desc) end

function M.exprinoremap(lhs, rhs, desc) M.exprnoremap("i", lhs, rhs, desc) end

return M
