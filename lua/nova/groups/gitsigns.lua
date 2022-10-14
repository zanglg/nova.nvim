local M = {}

M.get = function()
    local colors = require("nova.colors").get()

    return {
        GitSignsAdd = { fg = colors.green },
        GitSignsChange = { fg = colors.blue },
        GitSignsDelete = { fg = colors.red },
    }
end

return M
