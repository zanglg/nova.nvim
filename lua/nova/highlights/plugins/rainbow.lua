return function(colors)
    return {
        -- rainbow-delimiters exposes seven fixed default group names. Nova
        -- intentionally omits orange from its seven-color cycle.
        RainbowDelimiterRed = { fg = colors.red },
        RainbowDelimiterYellow = { fg = colors.yellow },
        RainbowDelimiterBlue = { fg = colors.blue },
        RainbowDelimiterOrange = { fg = colors.purple },
        RainbowDelimiterGreen = { fg = colors.green },
        RainbowDelimiterViolet = { fg = colors.violet },
        RainbowDelimiterCyan = { fg = colors.teal },
    }
end
