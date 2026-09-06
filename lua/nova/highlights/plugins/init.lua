local builders = {
    require("nova.highlights.plugins.gitsigns"),
    require("nova.highlights.plugins.flash"),
    require("nova.highlights.plugins.telescope"),
    require("nova.highlights.plugins.noice"),
    require("nova.highlights.plugins.nvim_tree"),
    require("nova.highlights.plugins.outline"),
    require("nova.highlights.plugins.lazy"),
    require("nova.highlights.plugins.mason"),
    require("nova.highlights.plugins.luasnip"),
    require("nova.highlights.plugins.trouble"),
    require("nova.highlights.plugins.todo_comments"),
    require("nova.highlights.plugins.ibl"),
    require("nova.highlights.plugins.dap"),
    require("nova.highlights.plugins.snacks"),
    require("nova.highlights.plugins.blink"),
    require("nova.highlights.plugins.cmp"),
    require("nova.highlights.plugins.which_key"),
    require("nova.highlights.plugins.rainbow"),
}

return function(colors)
    local groups = {}

    for _, build in ipairs(builders) do
        groups = vim.tbl_extend("force", groups, build(colors))
    end

    return groups
end
