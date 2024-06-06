local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- Formatting
    {
        "junegunn/vim-easy-align",
    },
    {
        "terrortylor/nvim-comment",
        config = function () require("plugins.comment") end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            require("todo-comments").setup({})
        end
    },

    -- Navigation
    {
        "ThePrimeagen/harpoon"
    },


    -- Themes
    {
        "Mofiqul/vscode.nvim",
        config = function() require("themes") end
    },

    -- Git commands
    {
        "tpope/vim-fugitive"
    },
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("plugins.gitsigns") end
    },
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Neovim development
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = function() require("plugins.lspconfig") end,
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        }
    },
    {
        "mfussenegger/nvim-jdtls"
    },
    {
        "onsails/lspkind.nvim"
    },

    -- Debugging
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function() require("plugins.dapuiconfig") end
    },
    {
        "theHamsta/nvim-dap-virtual-text"
    },
    {
        "nvim-telescope/telescope-dap.nvim"
    },

    -- Database
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },

    -- Statusline
    {
        "hoob3rt/lualine.nvim",
        config = function() require("plugins.lualine") end,
    },

    -- NvimTree
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = function() require("plugins.nvimtree") end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        config = function() require("plugins.treesitter") end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context"
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("plugins.telescope") end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        run ="make",
    }
})
