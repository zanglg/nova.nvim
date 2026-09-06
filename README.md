# nova colorscheme for neovim

A focused Lua colorscheme for Neovim.

## 🎨 Preview

Screenshots may evolve while the palette and highlight coverage are refined.

- **dark mode:**

<img width="2025" alt="dark" src="https://github.com/zanglg/nova.nvim/assets/4172061/8039f577-231b-46bf-babc-5e057396d4ec">

- **light mode:**

<img width="2025" alt="light" src="https://github.com/zanglg/nova.nvim/assets/4172061/ef1428b0-1c2d-4cc2-a74c-ec0b134ce55e">

## 📦 Installation

You can use your favorite plugin manager for this. Here is an example with
lazy.nvim:

```lua
{
    "zanglg/nova.nvim",
    opts = {
        theme = "auto",
    },
}
```

## 🚀 Usage

```lua
require("nova").setup({
    theme = "auto", -- "auto", "dark", or "light"
    transparent = false,
})

vim.cmd.colorscheme("nova")
```

`theme = "auto"` follows `vim.o.background`. Explicit `"dark"` or `"light"`
values also synchronize `vim.o.background` so Neovim and plugin defaults use
the same background mode as Nova.

### Lualine

```lua
require("lualine").setup({
    options = {
        theme = "nova",
    },
})
```

## 🔧 Configuration

Nova intentionally keeps its public configuration small:

```lua
require("nova").setup({
    theme = "auto",
    transparent = false,
    colors = {},
    overrides = {},
})
```

- `theme`: `"auto"`, `"dark"`, or `"light"`.
- `transparent`: removes Nova's main editor background when `true`.
- `colors`: a palette override table or a function receiving the base palette
  and resolved `"dark"`/`"light"` theme and returning an override table.
- `overrides`: a table of highlight overrides or a function receiving the
  resolved Nova palette.

Unknown top-level options are rejected so stale or misspelled configuration is
not silently ignored.

### Color overrides

Table form:

```lua
require("nova").setup({
    colors = {
        blue = "#80aaff",
        popupmenu = "#20263a",
    },
})
```

Function form is useful with `theme = "auto"`:

```lua
require("nova").setup({
    colors = function(colors, theme)
        return {
            blue = theme == "light" and "#356ac3" or "#80aaff",
            target = colors.teal,
        }
    end,
})
```

Derived diff backgrounds are recomputed from overridden source colors unless a
derived value is explicitly supplied.

### Highlight overrides

Table form:

```lua
require("nova").setup({
    overrides = {
        CursorLineNr = { fg = "#ffffff", bold = true },
    },
})
```

Function form:

```lua
require("nova").setup({
    overrides = function(colors)
        return {
            CursorLineNr = { fg = colors.target, bold = true },
        }
    end,
})
```

## Floating-window primitives

Nova provides separate primitives rather than forcing one global float style:

- `NormalFloat` provides the popup surface.
- `FloatBorder` provides structural separation.
- `PmenuSel` provides the selected-item surface.

Plugins remain responsible for choosing whether a window is surface-only,
border-only, or combines both.

## Plugin integrations

Nova prefers plugin defaults whenever they already link to standard Neovim
highlight groups. Plugin-specific overrides are kept only when Nova has a
meaningful semantic or presentation difference to express.

The maintained integration set targets mainstream Neovim plugins plus plugins
used by the author's dotconfig. Integrations do not require the corresponding
plugin to be installed in order for Nova to load.

## Requirements

Nova currently targets Neovim **0.12.5**.
