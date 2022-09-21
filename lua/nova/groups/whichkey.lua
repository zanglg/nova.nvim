local M = {}

M.get = function()
    local colors = require("nova.colors").get()

    -- stylua: ignore
    return {
        WhichKey          = { fg = colors.blue },
        WhichKeySeparator = { fg = colors.green },
        WhichKeyDesc      = { fg = colors.red },
        WhichKeyGroup     = { fg = colors.violet },
        WhichKeyValue     = { fg = colors.violet },
    }
end

return M
