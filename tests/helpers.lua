local M = {
    passed = 0,
    failed = 0,
}

local function format(value)
    return vim.inspect(value)
end

function M.eq(actual, expected, message)
    if not vim.deep_equal(actual, expected) then
        error(message or string.format("expected %s, got %s", format(expected), format(actual)), 2)
    end
end

function M.ne(actual, expected, message)
    if vim.deep_equal(actual, expected) then
        error(message or string.format("expected values to differ, both were %s", format(actual)), 2)
    end
end

function M.truthy(value, message)
    if not value then
        error(message or string.format("expected truthy value, got %s", format(value)), 2)
    end
end

function M.raises(fn, pattern)
    local ok, err = pcall(fn)
    if ok then
        error("expected function to raise an error", 2)
    end

    if pattern and not tostring(err):find(pattern, 1, true) then
        error(string.format("expected error containing %q, got %s", pattern, tostring(err)), 2)
    end
end

function M.test(name, fn)
    local ok, err = xpcall(fn, debug.traceback)
    if ok then
        M.passed = M.passed + 1
        print("ok - " .. name)
    else
        M.failed = M.failed + 1
        io.stderr:write("not ok - " .. name .. "\n" .. err .. "\n")
    end
end

function M.finish()
    print(string.format("%d passed, %d failed", M.passed, M.failed))
    if M.failed > 0 then
        error(string.format("test suite failed with %d failure(s)", M.failed))
    end
end

return M
