local M = {}

M.get = function()
    local colors = require("nova.colors").get()

    -- stylua: ignore
    return {
        -- Parameters of a function.
        TSParameter          = { fg = colors.teal },
        -- References to parameters of a function.
        TSParameterReference = { fg = colors.teal },

        -- Object and struct fields.
        TSField              = { fg = colors.violet },
        TSProperty           = { fg = colors.violet },
        -- Identifiers referring to modules and namespaces.
        TSNamespace          = { fg = colors.violet },

        -- rainbow
        rainbowcol1          = { fg = colors.red },
        rainbowcol2          = { fg = colors.green },
        rainbowcol3          = { fg = colors.blue },
        rainbowcol4          = { fg = colors.yellow },
        rainbowcol5          = { fg = colors.purple },
        rainbowcol6          = { fg = colors.cyan },
        rainbowcol7          = { fg = colors.violet },
    }
end

return M
