local source = debug.getinfo(1, "S").source:sub(2)
local script = vim.fs.normalize(vim.fn.fnamemodify(source, ":p"))
local root = vim.fs.dirname(vim.fs.dirname(script))
vim.opt.runtimepath:prepend(root)
package.path = table.concat({ root .. "/scripts/?.lua", package.path }, ";")

local output = root .. "/extras"
for index, argument in ipairs(vim.v.argv) do
    local absolute = vim.fs.normalize(vim.fn.fnamemodify(argument, ":p"))
    if absolute == script and vim.v.argv[index + 1] then
        output = vim.v.argv[index + 1]
        break
    end
end

local files = require("theme_generator").generate(output)
print(string.format("Generated %d theme files in %s", #files, output))
