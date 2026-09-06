local M = {}

function M.setup(opts)
    return require("nova.option").setup(opts)
end

function M.load()
    local config = require("nova.option")
    local opts = config.option
    local theme = config.resolve_theme()

    if opts.theme ~= "auto" and vim.o.background ~= theme then
        vim.o.background = theme
    end

    if vim.g.colors_name then
        vim.cmd("highlight clear")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "nova"

    local colors = require("nova.colors").setup(opts, theme)
    local groups = require("nova.groups")(colors, opts)

    for name, highlight in pairs(groups) do
        vim.api.nvim_set_hl(0, name, highlight)
    end

    return colors, groups, opts
end

return M
