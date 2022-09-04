-- default options
local options = {
    background = "light",
}

local M = {}

M.setup = function(opts)
    opts = opts or {}

    return vim.tbl_deep_extend("force", options, opts)
end

return M
