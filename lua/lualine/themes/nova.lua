local colors = require("nova.colors")
local nova = {}

nova.normal = {
    a = { bg = colors.blue, fg = colors.selection, gui = "bold" },
    b = { bg = colors.stripline, fg = colors.blue },
    c = { bg = colors.selection, fg = colors.foreground },
}

nova.insert = {
    a = { bg = colors.green, fg = colors.selection, gui = "bold" },
    b = { bg = colors.stripline, fg = colors.green },
}

nova.command = {
    a = { bg = colors.purple, fg = colors.selection, gui = "bold" },
    b = { bg = colors.stripline, fg = colors.purple },
}

nova.visual = {
    a = { bg = colors.yellow, fg = colors.selection, gui = "bold" },
    b = { bg = colors.stripline, fg = colors.yellow },
}

nova.replace = {
    a = { bg = colors.red, fg = colors.selection, gui = "bold" },
    b = { bg = colors.stripline, fg = colors.red },
}

nova.terminal = {
    a = { bg = colors.violet, fg = colors.selection, gui = "bold" },
    b = { bg = colors.stripline, fg = colors.violet },
}

nova.inactive = {
    a = { bg = colors.selection, fg = colors.red, gui = "bold" },
    b = { bg = colors.selection, fg = colors.green },
    c = { bg = colors.selection, fg = colors.blue },
}

return nova
