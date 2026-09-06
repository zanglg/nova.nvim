return function(colors)
    return {
        DapStoppedLine = { bg = colors.stripline },

        DapUINormal = { link = "Normal" },
        DapUIVariable = { link = "Identifier" },
        DapUIScope = { link = "Type" },
        DapUIType = { link = "Type" },
        DapUIValue = { link = "Constant" },
        DapUIModifiedValue = { link = "Function" },
        DapUIDecoration = { fg = colors.comment },
        DapUIThread = { link = "Identifier" },
        DapUIStoppedThread = { fg = colors.current_match, bold = true },
        DapUIFrameName = { fg = colors.foreground },
        DapUISource = { link = "Directory" },
        DapUILineNumber = { link = "LineNr" },
        DapUIFloatNormal = { link = "NormalFloat" },
        DapUIFloatBorder = { link = "FloatBorder" },
        DapUIWatchesEmpty = { link = "Comment" },
        DapUIWatchesValue = { link = "Constant" },
        DapUIWatchesError = { link = "DiagnosticError" },
        DapUIBreakpointsPath = { link = "Directory" },
        DapUIBreakpointsInfo = { link = "DiagnosticInfo" },
        DapUIBreakpointsCurrentLine = { link = "CursorLineNr" },
        DapUIBreakpointsDisabledLine = { fg = colors.inconspicuous },
        DapUIUnavailable = { fg = colors.inconspicuous },
        DapUIWinSelect = { fg = colors.target, bold = true },
    }
end
