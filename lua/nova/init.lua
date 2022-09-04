local nova = {}

nova.setup = function(opts)
    -- override default options
    nova.options = require("nova.option").setup(opts)

    -- make color palette
    nova.colors = require("nova.colors").setup()

    -- todo: support hilight groups override
    nova.groups = require("nova.groups").setup()
end

nova.load = function()
    vim.api.nvim_command("highlight clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "nova"

    for hl, col in pairs(nova.groups) do
        vim.api.nvim_set_hl(0, hl, col)
    end
end

return nova
