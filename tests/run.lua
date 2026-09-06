local root = vim.fn.getcwd()
package.path = table.concat({
    root .. "/tests/?.lua",
    package.path,
}, ";")

local t = require("helpers")

for _, spec in ipairs({
    "config_spec",
    "colors_spec",
    "groups_spec",
    "load_spec",
}) do
    require(spec)(t)
end

t.finish()
