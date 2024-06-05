local lspconfig = require("lspconfig")
local cmp = require"cmp"

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
    {
        { name = "buffer" },
    })
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(_, bufnr)

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "git" },
    },
    {
        { name = "buffer" },
    })
})

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" }
    }, {
        { name = "cmdline" }
    })
})

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.angularls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {},
    },
}

lspconfig.ansiblels.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.gopls.setup{
    on_attach = on_attach,
    settings = {
        gopls = {
            semanticTokens = true,
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            gofumpt = true,
        },
    },
    capabilities = capabilities
}

lspconfig.sqlls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.html.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.cssls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.dockerls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.yamlls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.gradle_ls.setup{
    cmd = {"/home/jonne/lsp/vscode-gradle/gradle-language-server/build/install/gradle-language-server/bin/gradle-language-server"},
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.lemminx.setup{
    cmd = {"lemminx-linux"},
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.bashls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.lua_ls.setup{
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path.."/.luarc.json") and not vim.loop.fs_stat(path.."/.luarc.jsonc") then
            client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
                Lua = {
                    runtime = {
                        version = "LuaJIT"
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    }
                }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
    end
}

lspconfig.groovyls.setup{
    "java", "-jar", "~/lsp/groovy-language-server/build/libs/groovy-language-server-all.jar"
}

lspconfig.jsonls.setup{}

lspconfig.marksman.setup{}

lspconfig.eslint.setup{
    cmd = { "vscode-eslint-language-server", "--stdio",  "--cache"},
    on_attach = function (_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end
}
