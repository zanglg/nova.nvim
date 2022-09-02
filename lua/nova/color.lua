local M = {}

M.generate = function()
    local colors = {}

    -- stylua: ignore start
    if vim.g.background == "light" then
        colors.foreground    = "#4c5e67"
        colors.inconspicuous = "#7b929d"
        colors.selection     = "#e2e7e9"
        colors.line          = "#f0f3f4"
        colors.background    = "#fcfdfd"

        colors.red           = "#c62828"
        colors.pink          = "#ad1457"
        colors.purple        = "#a626a4"
        colors.violet        = "#6666cc"
        colors.indigo        = "#283593"
        colors.blue          = "#1565c0"
        colors.cyan          = "#00838f"
        colors.teal          = "#00695c"
        colors.green         = "#2e7d32"
        colors.lime          = "#9e9d24"
        colors.yellow        = "#b38c19"
        colors.brown         = "#4e342e"
    else
        colors.foreground    = "#abb2bf"
        colors.inconspicuous = "#6e7a91"
        colors.selection     = "#3e4451"
        colors.line          = "#333842"
        colors.background    = "#282c34"

        colors.red           = "#e06c75"
        colors.pink          = "#e06c92"
        colors.purple        = "#c678dd"
        colors.violet        = "#896ce0"
        colors.indigo        = "#6c7de0"
        colors.blue          = "#61afef"
        colors.cyan          = "#56b6c2"
        colors.teal          = "#6ce0d4"
        colors.green         = "#98c379"
        colors.lime          = "#d4e06c"
        colors.yellow        = "#e5c07b"
        colors.brown         = "#e08b6c"
    end
    -- stylua: ignore end

    return colors
end

return M
