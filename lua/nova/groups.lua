local builders = {
    require("nova.highlights.core"),
    require("nova.highlights.syntax"),
    require("nova.highlights.treesitter"),
    require("nova.highlights.lsp"),
    require("nova.highlights.plugins"),
}

return function(colors, opts)
    local groups = {}

    for _, build in ipairs(builders) do
        groups = vim.tbl_extend("force", groups, build(colors, opts))
    end

    local overrides = opts.overrides
    if type(overrides) == "function" then
        overrides = overrides(colors) or {}
    end
    if type(overrides) == "table" then
        groups = vim.tbl_extend("force", groups, overrides)
    end

    return groups
end
