return function(colors)
    return {
        FlashBackdrop = { fg = colors.comment, bold = false },
        FlashMatch = { fg = colors.match, bold = true },
        FlashCurrent = { fg = colors.current_match, bold = true },
        FlashLabel = { fg = colors.target, bold = true },
    }
end
