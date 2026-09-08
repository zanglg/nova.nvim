---@alias NovaTheme "auto"|"dark"|"light"
---@alias NovaVariant "default"|"dim"|"soft"
---@alias NovaHighlights table<string, vim.api.keyset.highlight>
---@alias NovaColorOverrides table<string, string>

---@class NovaConfig
---@field theme? NovaTheme
---@field variant? NovaVariant
---@field transparent? boolean
---@field colors? NovaColorOverrides|fun(colors: table<string, string>, theme: "dark"|"light"): NovaColorOverrides?
---@field overrides? NovaHighlights|fun(colors: NovaColors): NovaHighlights

local M = {}

---@type NovaConfig
M.defaults = {
    theme = "auto",
    variant = "default",
    transparent = false,
    colors = {},
    overrides = {},
}

local VALID_THEMES = {
    auto = true,
    dark = true,
    light = true,
}

local VALID_VARIANTS = {
    default = true,
    dim = true,
    soft = true,
}

local VALID_OPTIONS = {}
for name in pairs(M.defaults) do
    VALID_OPTIONS[name] = true
end

---@param opts? NovaConfig
local function validate_user_options(opts)
    if opts == nil then
        return
    end

    if type(opts) ~= "table" then
        error("nova: setup options must be a table")
    end

    for name in pairs(opts) do
        if not VALID_OPTIONS[name] then
            error(string.format("nova: unknown option %q", tostring(name)))
        end
    end
end

---@param opts NovaConfig
local function validate(opts)
    if not VALID_THEMES[opts.theme] then
        error(string.format("nova: invalid theme %q (expected 'auto', 'dark', or 'light')", tostring(opts.theme)))
    end

    if not VALID_VARIANTS[opts.variant] then
        error(string.format("nova: invalid variant %q (expected 'default', 'dim', or 'soft')", tostring(opts.variant)))
    end

    if type(opts.transparent) ~= "boolean" then
        error("nova: transparent must be a boolean")
    end

    if type(opts.colors) ~= "table" and type(opts.colors) ~= "function" then
        error("nova: colors must be a table or function")
    end

    if type(opts.overrides) ~= "table" and type(opts.overrides) ~= "function" then
        error("nova: overrides must be a table or function")
    end
end

---@type NovaConfig
M.options = vim.deepcopy(M.defaults)

---@param opts? NovaConfig
---@return NovaConfig
function M.setup(opts)
    validate_user_options(opts)
    local options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
    validate(options)
    M.options = options
    return options
end

---@return "dark"|"light"
function M.resolve_theme()
    if M.options.theme == "auto" then
        return vim.o.background == "light" and "light" or "dark"
    end

    return M.options.theme --[[@as "dark"|"light"]]
end

return M
