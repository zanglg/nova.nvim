local M = {}

M.get = function()
    local colors = require("nova.colors").get()

    -- stylua: ignore
    return {
        Hlargs = { fg = colors.teal },
    }
end

return M
