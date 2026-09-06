# nova colorscheme for neovim

*A (very) WIP colorscheme for Neovim.*

## 🎨 Preview

The palette and highlight groups are still evolving, so screenshots may change.

- **dark mode:**

<img width="2025" alt="dark" src="https://github.com/zanglg/nova.nvim/assets/4172061/8039f577-231b-46bf-babc-5e057396d4ec">

- **light mode:**

<img width="2025" alt="light" src="https://github.com/zanglg/nova.nvim/assets/4172061/ef1428b0-1c2d-4cc2-a74c-ec0b134ce55e">

## 📦 Installation

Use your preferred plugin manager. With lazy.nvim:

```lua
{
    "zanglg/nova.nvim",
    priority = 1000,
    opts = {
        theme = "auto",
    },
    config = function(_, opts)
        require("nova").setup(opts)
        vim.cmd.colorscheme("nova")
    end,
}
```

`setup()` is optional. Without it, Nova uses its defaults and follows
`vim.o.background`.

## 🔧 Configuration

```lua
require("nova").setup({
    -- "auto" follows vim.o.background. "dark" and "light" explicitly select
    -- a variant and keep vim.o.background in sync with it.
    theme = "auto",

    -- Keep the main editor background transparent. Floating and popup surfaces
    -- retain their own backgrounds.
    transparent = false,

    -- Override colors in the resolved palette.
    colors = {},

    -- Override final highlight groups. This can be a table or a function that
    -- receives the resolved palette and returns a table.
    overrides = {},
})
```

### Color overrides

```lua
require("nova").setup({
    colors = {
        match = "#b8d75f",
        target = "#66c7d4",
    },
})
```

Diff backgrounds are derived from the active semantic colors and background.
If a derived color such as `diff_add_bg` is provided explicitly, Nova keeps the
explicit value instead.

### Highlight overrides

```lua
require("nova").setup({
    overrides = function(colors)
        return {
            Comment = { fg = colors.comment, italic = true },
            CursorLineNr = { fg = colors.target, bold = true },
        }
    end,
})
```

A plain table can be used when access to the palette is not needed:

```lua
require("nova").setup({
    overrides = {
        NormalFloat = { link = "Normal" },
    },
})
```

## Floating-window model

Nova keeps window surfaces and borders as separate primitives instead of
forcing one global float style:

- `NormalFloat` uses the popup surface.
- `FloatBorder` uses the structural separator color.
- `PmenuSel` uses the explicit selection surface.

Plugins can therefore choose their own composition: a surface-only float can
use `NormalFloat` without a border, while a border-only float can keep `Normal`
and use `FloatBorder`. Nova's plugin integrations preserve that choice unless a
plugin-specific highlight has a semantic reason to differ.

## Lualine

```lua
require("lualine").setup({
    options = {
        theme = "nova",
    },
})
```
