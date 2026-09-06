local M = {}

local links = {
    Text = "Identifier",
    Method = "@lsp.type.method",
    Function = "@lsp.type.function",
    Constructor = "@lsp.type.function",
    Field = "@lsp.type.property",
    Variable = "@lsp.type.variable",
    Class = "@lsp.type.class",
    Interface = "@lsp.type.interface",
    Module = "@lsp.type.namespace",
    Property = "@lsp.type.property",
    Unit = "Constant",
    Value = "Constant",
    Enum = "@lsp.type.enum",
    Keyword = "Keyword",
    Snippet = "@lsp.type.macro",
    Color = "Constant",
    File = "Directory",
    Reference = "Identifier",
    Folder = "Directory",
    EnumMember = "@lsp.type.enumMember",
    Constant = "Constant",
    Struct = "@lsp.type.struct",
    Event = "@lsp.type.event",
    Operator = "Operator",
    TypeParameter = "@lsp.type.typeParameter",
}

function M.groups(prefix)
    local groups = {}

    for kind, link in pairs(links) do
        groups[prefix .. kind] = { link = link }
    end

    return groups
end

function M.icons(prefix)
    local groups = {}

    for kind in pairs(links) do
        groups[prefix .. kind .. "Icon"] = { link = prefix .. kind }
    end

    return groups
end

return M
