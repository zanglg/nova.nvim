local M = {}

M.generate = function()
    local colors = {}

    -- stylua: ignore start
    if vim.g.background == "light" then
        colors.foreground    = "#364349"
        colors.inconspicuous = "#6c8693"
        colors.selection     = "#e2e7e9"
        colors.line          = "#f0f3f4"
        colors.background    = "#fcfdfd"

        colors.red           = "#be3536"
        colors.pink          = "#d45092"
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
    else
        colors.foreground    = "#a7b3be"
        colors.inconspicuous = "#6c7f93"
        colors.selection     = "#2c343f"
        colors.line          = "#212730"
        colors.background    = "#171b21"
    end

    -- stylua: ignore end

    return colors
end

return M
