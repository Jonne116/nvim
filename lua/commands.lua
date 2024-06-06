-- Remove trailing whitespaces
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e ]]

-- Swap folder
vim.cmd("command! ListSwap split | enew | r !ls -l ~/.local/share/nvim/swap")
vim.cmd("command! CleanSwap !rm -rf ~/.local/share/nvim/swap/")

-- Open help tags
vim.cmd("command! HelpTags Telescope help_tags")

-- Create ctags
vim.cmd("command! MakeCTags !ctags -R --exclude=@.ctagsignore .")

-- Go format
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = {only = {"source.organizeImports"}}
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({async = false})
    end
})
