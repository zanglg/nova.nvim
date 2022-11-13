local colors = require("nova.colors").get()
local nova = {}

nova.normal = {
    a = { bg = colors.blue, fg = colors.stripline, gui = "bold" },
    b = { bg = colors.selection, fg = colors.blue },
    c = { bg = colors.stripline, fg = colors.foreground },
}

nova.insert = {
    a = { bg = colors.green, fg = colors.stripline, gui = "bold" },
    b = { bg = colors.selection, fg = colors.green },
}

nova.command = {
    a = { bg = colors.purple, fg = colors.stripline, gui = "bold" },
    b = { bg = colors.selection, fg = colors.purple },
}

nova.visual = {
    a = { bg = colors.yellow, fg = colors.stripline, gui = "bold" },
    b = { bg = colors.selection, fg = colors.yellow },
}

nova.replace = {
    a = { bg = colors.red, fg = colors.stripline, gui = "bold" },
    b = { bg = colors.selection, fg = colors.red },
}

nova.inactive = {
    a = { bg = colors.stripline, fg = colors.red },
    b = { bg = colors.stripline, fg = colors.green, gui = "bold" },
    c = { bg = colors.stripline, fg = colors.blue },
}

return nova
