local M = {}

M.get = function()
    local colors = require("nova.colors").get()

    -- stylua: ignore
    return {
        HopNextKey   = { fg = colors.red, bold = true },
        HopNextKey1  = { fg = colors.blue, bold = true },
        HopNextKey2  = { fg = colors.purple, bold = true },
        HopUnmatched = { fg = colors.inconspicuous },
        HopCursor    = { fg = colors.yellow },
    }
end

return M
