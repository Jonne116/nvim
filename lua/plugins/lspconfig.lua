local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    --
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig').clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

require('lspconfig').pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}

require('lspconfig').gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require'lspconfig'.sqlls.setup{
    capabilities = capabilities

}

require('lspconfig').html.setup{
    capabilities = capabilities
}

require('lspconfig').cssls.setup{
    capabilities = capabilities
}

require('lspconfig').dockerls.setup{
    capabilities = capabilities
}

require'lspconfig'.yamlls.setup{
    capabilities = capabilities
}

require('lspconfig').gradle_ls.setup{
  cmd = {"/home/jonnelehtonen/Misc/vscode-gradle/gradle-language-server/build/install/gradle-language-server/bin/gradle-language-server"},
    capabilities = capabilities
}

require'lspconfig'.lemminx.setup{
    cmd = {"lemminx-linux"},
    capabilities = capabilities
}

require('lspconfig').bashls.setup{
    capabilities = capabilities
}

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
    capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require('lspconfig').groovyls.setup {"java", "-jar", "~/Misc/groovy-language-server/build/libs/groovy-language-server-all.jar"}
require('lspconfig').jsonls.setup {}

require('lspconfig').marksman.setup{}

require('lspconfig').eslint.setup{}
