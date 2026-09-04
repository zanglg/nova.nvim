local M = {}

local DEFAULT_OPTIONS = {
    theme = "dark",
    transparent = false,
    overrides = {},
}

M.option = vim.deepcopy(DEFAULT_OPTIONS)

function M.setup(opts)
    M.option = vim.tbl_deep_extend("force", vim.deepcopy(DEFAULT_OPTIONS), opts or {})
    return M.option
end

return M
