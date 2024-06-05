vim.o.background = "dark"

local c = require("vscode.colors").get_colors()
require("vscode").setup({
    transparent = false,
    italic_comments = true,
    disable_nvimtree_bg = false,
    color_overrides = {
        vscLineNumber = "#FFFFFF",
    },
    group_overrides = {
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})

require("tokyonight").setup({
    style = "storm",
    light_style = "day",
    transparent = false,
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
    },
    sidebars = { "qf", "help" },
    day_brightness = 0.3,
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_bold = false,
})

require("tokyonight").load()
