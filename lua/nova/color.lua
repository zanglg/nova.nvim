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
        colors.deeppurple    = "#6666cc"
        colors.indigo        = "#283593"
        colors.blue          = "#1565c0"
        colors.lightblue     = "#0277bd"
        colors.cyan          = "#00838f"
        colors.teal          = "#00695c"
        colors.green         = "#2e7d32"
        colors.lightgreen    = "#558b2f"
        colors.lime          = "#9e9d24"
        colors.yellow        = "#b38c19"
        colors.amber         = "#ff8f00"
        colors.orange        = "#ef6c00"
        colors.deeporange    = "#d84315"
        colors.brown         = "#4e342e"
    else
        colors.foreground    = "#a7b3be"
        colors.inconspicuous = "#6c7f93"
        colors.selection     = "#2c343f"
        colors.line          = "#212730"
        colors.background    = "#171b21"

        colors.red           = "#e57373"
        colors.pink          = "#f06292"
        colors.purple        = "#ba68c8"
        colors.deeppurple    = "#9575cd"
        colors.indigo        = "#7986cb"
        colors.blue          = "#64b5f6"
        colors.lightblue     = "#4fc3f7"
        colors.cyan          = "#4dd0e1"
        colors.teal          = "#4db6ac"
        colors.green         = "#81c784"
        colors.lightgreen    = "#aed581"
        colors.lime          = "#dce775"
        colors.yellow        = "#fff176"
        colors.amber         = "#ffd54f"
        colors.orange        = "#ffb74d"
        colors.deeporange    = "#ff8a65"
        colors.brown         = "#a1887f"
    end
    -- stylua: ignore end

    return colors
end

return M
