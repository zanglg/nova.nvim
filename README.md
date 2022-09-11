# nova colorscheme for neovim

*A (very) WIP colorscheme for neovim.*

## ⭐ Features

- [nvim-treesiter](https://github.com/nvim-treesitter/nvim-treesitter), *WIP*
- [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim), *WIP*
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim), *YTS*
- [hop.nvim](https://github.com/phaazon/hop.nvim)

## 📦 Instalation

You can use your favorite plugin manager for this. Here is an example with
packer.nvim:

#### packer.nvim

```lua
use({
    "zanglg/nova.nvim",
    config = function()
        -- support both dark and light style
        require("nova").setup({ background = "dark" })

        -- load colorscheme
        vim.cmd([[colorscheme nova]])
    end,
})
```

## 🔧 Configuration

- todo.
