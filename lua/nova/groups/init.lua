local M = {}

M.setup = function()
    -- stylua: ignore
    local groups = {
        builtin    = require("nova.groups.builtin").get(),
        standard   = require("nova.groups.syntax").get(),
        hop        = require("nova.groups.hop").get(),
        treesitter = require("nova.groups.treesitter").get(),
        whichkey   = require("nova.groups.whichkey").get(),
        telescope  = require("nova.groups.telescope").get(),
    }

    M.groups = groups
end

M.load = function()
    for _, groups in pairs(M.groups) do
        for hl, col in pairs(groups) do
            vim.api.nvim_set_hl(0, hl, col)
        end
    end
end

return M
