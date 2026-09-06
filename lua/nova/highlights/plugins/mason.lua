return function(colors)
    return {
        MasonHeader = { fg = colors.blue, bold = true },
        MasonHeaderSecondary = { fg = colors.teal, bold = true },
        MasonHighlight = { fg = colors.blue },
        MasonHighlightBlock = { fg = colors.blue, bg = colors.selection },
        MasonHighlightBlockBold = { fg = colors.blue, bg = colors.selection, bold = true },
        MasonHighlightSecondary = { fg = colors.teal },
        MasonHighlightBlockSecondary = { fg = colors.teal, bg = colors.selection },
        MasonHighlightBlockBoldSecondary = { fg = colors.teal, bg = colors.selection, bold = true },
        MasonMuted = { fg = colors.comment },
        MasonMutedBlock = { fg = colors.comment, bg = colors.stripline },
        MasonMutedBlockBold = { fg = colors.comment, bg = colors.stripline, bold = true },
        MasonHeading = { fg = colors.foreground, bold = true },
    }
end
