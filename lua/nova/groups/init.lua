local M = {}

M.setup = function()
    -- stylua: ignore
    local groups = {
        -- neovim builtin highlight groups
        builtin      = require("nova.groups.builtin").get(),
        standard     = require("nova.groups.syntax").get(),

        -- external plugins related groups
        diagnostic   = require("nova.groups.diagnostic").get(),
        gitsigns     = require("nova.groups.gitsigns").get(),
        hop          = require("nova.groups.hop").get(),
        misc         = require("nova.groups.misc").get(),
        smoothcursor = require("nova.groups.smoothcursor").get(),
        telescope    = require("nova.groups.telescope").get(),
        treesitter   = require("nova.groups.treesitter").get(),
        whichkey     = require("nova.groups.whichkey").get(),
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
