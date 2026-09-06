return function(t)
    local root = vim.fn.getcwd()
    local palette = require("nova.colors").setup({ colors = {} }, "dark")

    local function read(path)
        return table.concat(vim.fn.readfile(path), "\n")
    end

    t.test("all palette references resolve", function()
        local files = vim.fn.glob(root .. "/lua/**/*.lua", false, true)
        local missing = {}

        for _, path in ipairs(files) do
            local source = read(path)
            for name in source:gmatch("colors%.([%w_]+)") do
                if palette[name] == nil then
                    missing[#missing + 1] = string.format("%s: colors.%s", path, name)
                end
            end
        end

        t.eq(missing, {})
    end)

    t.test("stale integration references stay removed", function()
        local files = vim.fn.glob(root .. "/lua/**/*.lua", false, true)
        table.insert(files, root .. "/README.md")

        local forbidden = {
            "nova.option",
            "popup_style",
            "codex/soft-palette",
            "nvim-bqf",
            "treehopper",
        }

        local found = {}
        for _, path in ipairs(files) do
            local source = read(path)
            for _, needle in ipairs(forbidden) do
                if source:find(needle, 1, true) then
                    found[#found + 1] = string.format("%s: %s", path, needle)
                end
            end
        end

        t.eq(found, {})
    end)
end
