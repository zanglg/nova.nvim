local M = {}

-- default nova option
local DEFAULT_OPTIONS = {
    theme = "dark",
}

M.option = DEFAULT_OPTIONS

M.setup = function(opts)
    opts = opts or {}

    M.option = vim.tbl_deep_extend("force", M.option, opts)
end

return M
