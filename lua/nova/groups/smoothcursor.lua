local M = {}

M.get = function()
	local colors = require("nova.colors").get()

    -- stylua: ignore
    return {
        SmoothCursorYellow = { fg = colors.yellow },
        SmoothCursorPurple = { fg = colors.purple },
        SmoothCursorOrange = { fg = colors.lime },
        SmoothCursorGreen  = { fg = colors.green },
        SmoothCursorBlue   = { fg = colors.blue },
        SmoothCursorAqua   = { fg = colors.cyan },
        SmoothCursorRed    = { fg = colors.red },
        SmoothCursor       = { fg = colors.yellow },
    }
end

return M
