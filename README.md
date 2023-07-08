# nova colorscheme for neovim

*A (very) WIP colorscheme for neovim.*

## 🎨 Preview

**The color and group was not fixed finally, so screenshot may have a big change.**

- **dark mode:**

<img width="2025" alt="dark" src="https://github.com/zanglg/nova.nvim/assets/4172061/8039f577-231b-46bf-babc-5e057396d4ec">

- **light mode:**

<img width="2025" alt="light" src="https://github.com/zanglg/nova.nvim/assets/4172061/ef1428b0-1c2d-4cc2-a74c-ec0b134ce55e">

## 📦 Instalation

You can use your favorite plugin manager for this. Here is an example with
lazy.nvim:

#### lazy.nvim

```lua
{
    "zanglg/nova.nvim",
    opts = {
        theme = "dark",
    },
}
```

## 🚀 Usage

#### Lua

```lua
vim.cmd([[colorscheme nova]])
```
#### [Lualine](https://github.com/nvim-lualine/lualine.nvim)

```lua
require("lualine").setup({
    options = {
        theme = "nova",
    },
})
```

## 🔧 Configurations

- todo.

## 🪓 Overriding Colors & Highlight Groups

- todo.
