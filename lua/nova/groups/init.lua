local groups = {}

groups.setup = function()
    local result = {}

    -- stylua: ignore
    local groups = {
        builtin    = require("nova.groups.builtin"),
        standard   = require("nova.groups.syntax"),
        hop        = require("nova.groups.hop"),
        treesitter = require("nova.groups.treesitter"),
        whichkey   = require("nova.groups.whichkey"),
        telescope  = require("nova.groups.telescope"),
    }

    for _, group in pairs(groups) do
        for hl, col in pairs(group) do
            result[hl] = col
        end
    end

    return result
end

return groups
