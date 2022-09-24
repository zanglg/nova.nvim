local M = {}

M.get = function()
    local colors = require("nova.colors").get()

    -- stylua: ignore
    return {
        DiagnosticError = { fg = colors.red },
        DiagnosticWarn  = { fg = colors.yellow },
        DiagnosticInfo  = { fg = colors.green },
        DiagnosticHint  = { fg = colors.inconspicuous },
    }
end

return M
