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

    t.test("tmux loads all variants and resolves pane state colors", function()
        -- Never source themes into the user's running server.
        local socket = vim.fn.tempname()
        local root = vim.fn.getcwd()
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
        local function border()
            return tmux("display-message", "-p", "-t", "nova:0.0", "#{E:pane-active-border-style}")
        end

        local ok, err = xpcall(function()
            tmux("new-session", "-d", "-s", "nova", "-x", "80", "-y", "24", "sleep 120")
            for _, variant in ipairs({ "default", "dim", "soft" }) do
                for _, appearance in ipairs({ "dark", "light" }) do
                    local c = require("nova.colors").setup({ colors = {}, variant = variant }, appearance)
                    local suffix = variant == "default" and "" or "-" .. variant
                    local path = root .. "/extras/tmux/nova-" .. appearance .. suffix .. ".conf"
                    -- Switching/reloading a theme must replace the previous palette.
                    tmux("source-file", path)
                    tmux("source-file", path)
                    t.eq(tmux("show-options", "-gv", "status-style"), "bg=" .. c.selection .. ",fg=" .. c.foreground)
                    t.eq(tmux("show-options", "-gwv", "mode-style"), "fg=" .. c.foreground .. ",bg=" .. c.selection)
                    t.eq(
                        tmux("show-options", "-gv", "message-style"),
                        "fg=" .. c.foreground .. ",bg=" .. c.popupmenu .. ",fill=" .. c.popupmenu
                    )
                    t.eq(border(), "fg=" .. c.blue)
                    tmux("copy-mode", "-t", "nova:0.0")
                    t.eq(border(), "fg=" .. c.yellow)
                    tmux("set-window-option", "-t", "nova:0", "synchronize-panes", "on")
                    t.eq(border(), "fg=" .. c.red)
                    tmux("send-keys", "-t", "nova:0.0", "-X", "cancel")
                    t.eq(border(), "fg=" .. c.red)
                    tmux("set-window-option", "-t", "nova:0", "synchronize-panes", "off")
                    t.eq(border(), "fg=" .. c.blue)
                end
            end
        end, debug.traceback)
        run("kill-server")
        vim.fn.delete(socket)
        if not ok then
            error(err)
        end
    end)
end
