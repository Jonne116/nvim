require("nvim-treesitter.configs").setup({
	highlight = { enable = true, additional_vim_regex_highlighting = false},
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "cuda",
        "java",
        "javascript",
        "julia",
        "json",
        "lua",
        "python",
        "rust",
        "yaml",
    },
})
