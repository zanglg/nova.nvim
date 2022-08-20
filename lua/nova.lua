local nova = {}

nova.setup = function() end

nova.load = function()
    vim.api.nvim_command("highlight clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "nova"
end

return nova
