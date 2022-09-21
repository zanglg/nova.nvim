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

    -- make color palette
    require("nova.colors").setup()

    -- generate highlight groups
    require("nova.groups").setup()

    -- finally end
    require("nova.groups").load()

    -- affects highlighting
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
end

return M
