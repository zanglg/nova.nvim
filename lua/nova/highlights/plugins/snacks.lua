return function(colors)
    return {
        SnacksDashboardDesc = { fg = colors.foreground },
        SnacksDashboardFooter = { fg = colors.comment },
        SnacksDashboardHeader = { fg = colors.blue },
        SnacksDashboardIcon = { fg = colors.comment },
        SnacksDashboardKey = { fg = colors.target, bold = true },
        SnacksDashboardSpecial = { fg = colors.purple },
        SnacksDashboardDir = { fg = colors.inconspicuous },

        SnacksIndent = { fg = colors.inconspicuous, nocombine = true },
        SnacksIndentScope = { fg = colors.splitline, nocombine = true },

        SnacksInputBorder = { link = "FloatBorder" },
        SnacksInputTitle = { link = "FloatTitle" },

        SnacksPickerInputBorder = { link = "FloatBorder" },
        SnacksPickerInputTitle = { link = "FloatTitle" },
        SnacksPickerBoxTitle = { link = "FloatTitle" },
        SnacksPickerMatch = { fg = colors.match },
        SnacksPickerSelected = { bg = colors.selection },
    }
end
