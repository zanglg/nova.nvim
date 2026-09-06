local M = {}

local DEFAULT_OPTIONS = {
    theme = "auto",
    transparent = false,
    colors = {},
    overrides = {},
}

local VALID_THEMES = {
    auto = true,
    dark = true,
    light = true,
}

local function validate(opts)
    if not VALID_THEMES[opts.theme] then
        error(string.format("nova: invalid theme %q (expected 'auto', 'dark', or 'light')", tostring(opts.theme)))
    end

    if type(opts.transparent) ~= "boolean" then
        error("nova: transparent must be a boolean")
    end

    if type(opts.colors) ~= "table" then
        error("nova: colors must be a table")
    end

    if type(opts.overrides) ~= "table" and type(opts.overrides) ~= "function" then
        error("nova: overrides must be a table or function")
    end
end

M.option = vim.deepcopy(DEFAULT_OPTIONS)

function M.setup(opts)
    local option = vim.tbl_deep_extend("force", vim.deepcopy(DEFAULT_OPTIONS), opts or {})
    validate(option)
    M.option = option
    return option
end

function M.resolve_theme()
    if M.option.theme == "auto" then
        return vim.o.background == "light" and "light" or "dark"
    end

    return M.option.theme
end

return M
