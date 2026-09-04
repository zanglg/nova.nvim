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

Nova provides separate highlight primitives for floating-window surfaces and
borders. The plugin that creates the window should decide which style to use:

- `NormalFloat` uses Nova's popup surface background.
- `FloatBorder` uses Nova's window separator color.
- `PmenuSel` uses Nova's selection surface.

For a surface-only floating window, use the popup surface without a border.
For example, with `nvim-cmp`:

```lua
local cmp = require("cmp")

cmp.setup({
    window = {
        completion = {
            border = "none",
            winhighlight = "Normal:NormalFloat,CursorLine:PmenuSel,Search:None",
        },
    },
})
```

For a border-only floating window, keep the normal editor background and use
`FloatBorder` for separation:

```lua
local cmp = require("cmp")

cmp.setup({
    window = {
        completion = {
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        },
    },
})
```

Nova does not force one floating-window style globally. This allows different
plugins to use surface-only or border-only windows independently.

## 🪓 Overriding Colors & Highlight Groups

- todo.
