local fn = vim.fn
local cmd = vim.cmd

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({"git", "clone","https://github.com/wbthomason/packer.nvim", install_path})
end

cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use({ "wbthomason/packer.nvim",
        opt = true,
    })

    -- Formatting
    use "junegunn/vim-easy-align"
    use({ "terrortylor/nvim-comment",
        config = function () require("plugins.comment") end
    })
    use({ "folke/todo-comments.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function ()
        require("todo-comments").setup({})
    end
    })

    -- Navigation
    use "ThePrimeagen/harpoon"


    -- Themes
    use({ "Mofiqul/vscode.nvim",
        config = function() require("themes") end
    })
    use({ "folke/tokyonight.nvim",
        config = function () require("themes") end
    })

    -- Git commands
    use "tpope/vim-fugitive"
    use({ "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require("plugins.gitsigns") end
    })
    use({ "sindrets/diffview.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- LSP server
    use({ "neovim/nvim-lspconfig",
        config = function() require("plugins.lspconfig") end,
        requires = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip"
        }
    })
    use "mfussenegger/nvim-jdtls"

    -- Debugging
    use({ "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        config = function() require("plugins.dapuiconfig") end
    })
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"

    -- Statusline
    use({ "hoob3rt/lualine.nvim",
        config = function() require("plugins.lualine") end,
    })

    -- NvimTree
    use({ "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function() require("plugins.nvimtree") end,
    })

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter",
        config = function() require("plugins.treesitter") end,
        run = ":TSUpdate"
    })
    use "nvim-treesitter/nvim-treesitter-context"

    -- Telescope
    use({ "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require("plugins.telescope") end,
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim",
        run ="make",
    })

    if packer_bootstrap then
    require("packer").sync()
    end
end)
