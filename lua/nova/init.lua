local M = {}

function M.setup(opts)
    require("nova.option").setup(opts)
end

function M.load()
    local opts = require("nova.option").option

    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") == 1 then
        vim.cmd("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "nova"

    package.loaded["nova.colors"] = nil
    local colors = require("nova.colors")
    local groups = require("nova.groups")(colors, opts)

    for name, highlight in pairs(groups) do
        vim.api.nvim_set_hl(0, name, highlight)
    end
end

return M
