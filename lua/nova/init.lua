local M = {}

M.setup = function(opts)
    -- override default options
    require("nova.option").setup(opts)
end

M.load = function()
    -- remove highlighting for groups added
    vim.cmd("highlight clear")

    vim.o.termguicolors = true
    vim.g.colors_name = "nova"

    local groups = require("nova.groups")

    for _, group in ipairs(groups) do
        for hl, col in pairs(group) do
            vim.api.nvim_set_hl(0, hl, col)
        end
    end
end

return M
