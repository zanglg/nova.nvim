local M = {}

M.get = function()
    local colors = require("nova.colors").get()

    -- stylua: ignore
    return {
        -- Functions
        ["@parameter"]       = { fg = colors.teal },

        -- Types
        ["@field"]           = { fg = colors.violet },
        ["@property"]        = { fg = colors.violet },

        -- Identifiers
        ["@namespace"]       = { fg = colors.violet },

        -- Text, mainly for markup languages.
        ["@text.title"]      = { fg = colors.red },
        ["@text.literal"]    = { fg = colors.violet },

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
