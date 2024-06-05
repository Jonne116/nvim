local highlight = {
    "Grey",
}

local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "Grey", { fg = "#3A3A3A" })
end)

require("ibl").setup { indent = { highlight = highlight } }
