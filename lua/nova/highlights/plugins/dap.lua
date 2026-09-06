return function(colors)
    return {
        DapStoppedLine = { bg = colors.stripline },

        DapUIVariable = { link = "Identifier" },
        DapUIScope = { link = "Type" },
        DapUIValue = { link = "Constant" },
        DapUIDecoration = { fg = colors.comment },
        DapUIStoppedThread = { fg = colors.current_match, bold = true },
        DapUISource = { link = "Directory" },
        DapUIFloatBorder = { link = "FloatBorder" },
        DapUIWatchesEmpty = { link = "Comment" },
        DapUIWatchesValue = { link = "Constant" },
        DapUIWatchesError = { link = "DiagnosticError" },
        DapUIBreakpointsPath = { link = "Directory" },
        DapUIBreakpointsInfo = { link = "DiagnosticInfo" },
        DapUIBreakpointsDisabledLine = { fg = colors.inconspicuous },
        DapUIUnavailable = { fg = colors.inconspicuous },
        DapUIWinSelect = { fg = colors.target, bold = true },
    }
end
