return function(colors)
    return {
        OutlineCurrent = { fg = colors.foreground, bg = colors.stripline },
        OutlineGuides = { fg = colors.inconspicuous },
        OutlineFoldMarker = { fg = colors.comment },
        OutlineKeymapHelpDisabled = { fg = colors.inconspicuous },
    }
end
