local highlight = {
    "Grey",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "Grey", { fg = "#3A3A3A" })
end)

require("ibl").setup { indent = { highlight = highlight } }
