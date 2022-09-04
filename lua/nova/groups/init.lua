local groups = {}

groups.setup = function()
    local result = {}

    local groups = {
        builtin = require("nova.groups.builtin"),
        standard = require("nova.groups.syntax"),
    }

    for _, group in pairs(groups) do
        for hl, col in pairs(group) do
            result[hl] = col
        end
    end

    return result
end

return groups
