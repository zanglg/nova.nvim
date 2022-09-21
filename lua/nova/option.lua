local M = {}

-- default nova options
local DEFAULT_OPTIONS = {
    -- will add more them in future
    theme = "nova",
    background = "light",
}

M.options = DEFAULT_OPTIONS

M.setup = function(opts)
    opts = opts or {}

    M.options = vim.tbl_deep_extend("force", M.options, opts)
end

M.get = function()
    return M.options
end

return M
