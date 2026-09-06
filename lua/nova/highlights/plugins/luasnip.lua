return function(colors)
    return {
        LuasnipInsertNodeActive = { bg = colors.selection },
        LuasnipChoiceNodeActive = { fg = colors.target, bold = true },
        LuasnipDynamicNodeActive = { bg = colors.stripline },
        LuasnipSnippetNodeActive = { bg = colors.stripline },
        LuasnipRestoreNodeActive = { bg = colors.stripline },
        LuasnipExitNodeActive = { fg = colors.inconspicuous },
    }
end
