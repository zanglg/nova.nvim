return function(colors)
    return {
        OutlineCurrent = { fg = colors.foreground, bg = colors.stripline },
        OutlineGuides = { fg = colors.inconspicuous },
        OutlineFoldMarker = { fg = colors.comment },
        OutlineDetails = { link = "Comment" },
        OutlineLineno = { link = "LineNr" },
        OutlineJumpHighlight = { link = "Visual" },
        OutlineHelpTip = { link = "Comment" },
        OutlineStatusFt = { link = "Type" },
        OutlineStatusProvider = { link = "Special" },
        OutlineStatusError = { link = "ErrorMsg" },
        OutlineKeymapHelpKey = { link = "Special" },
        OutlineKeymapHelpDisabled = { fg = colors.inconspicuous },
    }
end
