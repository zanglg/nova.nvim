nova = {}

nova.setup = function()
    nova.colors = require("nova.color").generate()

    nova.higroups = {
        builtin = require("nova.groups.builtin"),
        standard = require("nova.groups.syntax"),
    }
end

nova.load = function()
    vim.api.nvim_command("highlight clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "nova"

    for _, group in pairs(nova.higroups) do
        for hl, col in pairs(group) do
            vim.api.nvim_set_hl(0, hl, col)
        end
    end
end

return nova
