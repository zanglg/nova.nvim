local M = {}

M.generate = function()
    local colors = {}

    -- stylua: ignore start
    colors.foreground    = "#364349"
    colors.inconspicuous = "#6c8693"
    colors.selection     = "#e2e7e9"
    colors.line          = "#f0f3f4"
    colors.background    = "#fcfdfd"

    colors.red           = "#be3536"
    colors.pink          = "#d4507c"
    colors.blue          = "#2c6ad3"
    colors.cyan          = "#48a3d6"
    colors.teal          = "#0d7373"
    colors.green         = "#3d7c3f"
    colors.purple        = "#b045b0"
    colors.violet        = "#7b57d7"
    colors.brown         = "#936821"
    colors.yellow        = "#c18401"
    colors.orange        = "#f76707"
    colors.lime          = "#999933"
    -- stylua: ignore end

    return colors
end

return M
