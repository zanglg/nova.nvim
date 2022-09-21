local M = {}

M.get = function()
    -- stylua: ignore
    return {
        TelescopeBorder = { link = "FloatBorder" },
        TelescopePromptBorder = { link = "TelescopeBorder" },
        TelescopeResultsBorder = { link = "TelescopeBorder" },
        TelescopePreviewBorder = { link = "TelescopeBorder" },
    }
end

return M
