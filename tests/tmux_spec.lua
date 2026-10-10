return function(t)
    if vim.fn.executable("tmux") ~= 1 then
        print("skip - tmux runtime tests (tmux 3.7+ required)")
        return
    end
    local version = vim.system({ "tmux", "-V" }, { text = true }):wait()
    local major, minor = (version.stdout or ""):match("tmux (%d+)%.(%d+)")
    if not major or tonumber(major) < 3 or (tonumber(major) == 3 and tonumber(minor) < 7) then
        print("skip - tmux runtime tests (tmux 3.7+ required)")
        return
    end

    t.test("tmux loads independent palettes without overriding a custom statusline", function()
        -- Use a private socket; do not source into a user's active server.
        local socket = vim.fn.tempname()
        local root = vim.fn.getcwd() .. "/extras/tmux"
        local function run(...)
            local command = { "tmux", "-S", socket, "-f", "/dev/null" }
            vim.list_extend(command, { ... })
            return vim.system(command, { text = true, env = { TMUX = "" } }):wait(10000)
        end
        local function tmux(...)
            local result = run(...)
            t.eq(result.code, 0, result.stderr)
            return vim.trim(result.stdout or "")
        end
        local function option(name)
            return tmux("show-options", "-gv", name)
        end
        local function border()
            return tmux("display-message", "-p", "-t", "nova:0.0", "#{E:pane-active-border-style}")
        end

        local ok, err = xpcall(function()
            tmux("new-session", "-d", "-s", "nova", "-x", "80", "-y", "24", "sleep 120")
            local layout = {
                status = "off",
                ["status-position"] = "bottom",
                ["status-justify"] = "right",
                ["status-left-length"] = "48",
                ["status-right-length"] = "64",
            }
            for name, value in pairs(layout) do
                tmux("set-option", "-g", name, value)
            end
            tmux("set-option", "-g", "status-left", "custom left")
            tmux("set-option", "-g", "status-right", "custom right")
            tmux("set-window-option", "-g", "window-status-format", "custom window")

            local colors_only = root .. "/colors.conf"
            for _, variant in ipairs({ "default", "dim", "soft" }) do
                for _, appearance in ipairs({ "dark", "light" }) do
                    local c = require("nova.colors").setup({ colors = {}, variant = variant }, appearance)
                    local name = appearance .. (variant == "default" and "" or "-" .. variant)
                    tmux("set-option", "-g", "status-left", "custom left")
                    tmux("set-option", "-g", "status-right", "custom right")
                    tmux("set-window-option", "-g", "window-status-format", "custom window")
                    tmux("set-option", "-g", "@nova-theme", name)
                    tmux("source-file", colors_only)
                    tmux("source-file", colors_only)
                    t.eq(option("status-left"), "custom left", "palette-only modified status-left")
                    t.eq(option("status-right"), "custom right", "palette-only modified status-right")
                    t.eq(tmux("show-options", "-gwv", "window-status-format"), "custom window")
                    for key, value in pairs(c) do
                        t.eq(option("@nova-" .. key:gsub("_", "-")), value)
                    end

                    tmux("source-file", root .. "/ui.conf")
                    t.eq(
                        option("message-style"),
                        "fg=" .. c.foreground .. ",bg=" .. c.popupmenu .. ",fill=" .. c.popupmenu
                    )
                    t.eq(tmux("show-options", "-gwv", "mode-style"), "fg=" .. c.foreground .. ",bg=" .. c.selection)
                    t.eq(border(), "fg=" .. c.blue)
                    tmux("copy-mode", "-t", "nova:0.0")
                    t.eq(border(), "fg=" .. c.yellow)
                    tmux("set-window-option", "-t", "nova:0", "synchronize-panes", "on")
                    t.eq(border(), "fg=" .. c.red)
                    tmux("send-keys", "-t", "nova:0.0", "-X", "cancel")
                    t.eq(border(), "fg=" .. c.red)
                    tmux("set-window-option", "-t", "nova:0", "synchronize-panes", "off")
                    t.eq(border(), "fg=" .. c.blue)

                    tmux("source-file", root .. "/statusline.conf")
                    t.eq(option("status-style"), "bg=" .. c.selection .. ",fg=" .. c.foreground)
                    t.truthy(option("status-left"):find("#{@nova-blue}", 1, true))
                    t.truthy(option("status-right"):find("#{@nova-blue}", 1, true))
                    t.eq(
                        tmux("show-options", "-gwv", "window-status-current-style"),
                        "fg=" .. c.blue .. ",bg=" .. c.stripline .. ",none"
                    )

                    tmux("source-file", root .. "/nova.conf")
                    t.eq(option("status-style"), "bg=" .. c.selection .. ",fg=" .. c.foreground)
                    tmux("source-file", root .. "/nova-" .. name .. ".conf")
                    t.eq(option("@nova-theme"), name)
                    for option_name, value in pairs(layout) do
                        t.eq(option(option_name), value, "theme changed layout option: " .. option_name)
                    end
                end
            end
            -- With no selector, colors.conf should fall back to Dark.
            tmux("set-option", "-gu", "@nova-theme")
            tmux("source-file", colors_only)
            local dark = require("nova.colors").setup({ colors = {}, variant = "default" }, "dark")
            t.eq(option("@nova-blue"), dark.blue)
        end, debug.traceback)
        run("kill-server")
        vim.fn.delete(socket)
        if not ok then
            error(err)
        end
    end)
end
