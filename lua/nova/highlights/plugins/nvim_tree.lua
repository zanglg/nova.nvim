return function(colors)
    return {
        NvimTreeFolderIcon = { link = "Directory" },
        NvimTreeIndentMarker = { fg = colors.inconspicuous },
        NvimTreeRootFolder = { link = "Directory" },
        NvimTreeOpenedHL = { bg = colors.stripline },
        NvimTreeGitDeletedIcon = { link = "Removed" },
        NvimTreeGitDirtyIcon = { link = "Changed" },
        NvimTreeGitIgnoredIcon = { link = "Comment" },
        NvimTreeGitMergeIcon = { link = "Changed" },
        NvimTreeGitNewIcon = { link = "Added" },
        NvimTreeGitRenamedIcon = { link = "Changed" },
        NvimTreeGitStagedIcon = { link = "Added" },
        NvimTreeWindowPicker = { fg = colors.target, bold = true },
    }
end
