# Nova

A focused true-color colorscheme for Neovim, written in Lua.

Nova keeps its palette, configuration, and plugin integrations deliberately small: standard Neovim highlight groups provide the foundation, while plugin-specific overrides are added only when Nova has a meaningful semantic or presentation difference to express.

## Preview

The current screenshots are retained while the active `dev` palette pass is being visually verified. They will be refreshed after the current dark/light review is complete.

### Dark

<img width="2025" alt="dark" src="https://github.com/zanglg/nova.nvim/assets/4172061/8039f577-231b-46bf-babc-5e057396d4ec">

### Light

<img width="2025" alt="light" src="https://github.com/zanglg/nova.nvim/assets/4172061/ef1428b0-1c2d-4cc2-a74c-ec0b134ce55e">

## Installation

Nova currently develops on the `dev` branch. With Neovim 0.12's native package manager:

```lua
vim.pack.add({
    {
        src = "https://github.com/zanglg/nova.nvim",
        version = "dev",
    },
})
```

With lazy.nvim:

```lua
{
    "zanglg/nova.nvim",
    branch = "dev",
    lazy = false,
    priority = 1000,
}
```

## Usage

```lua
require("nova").setup({
    theme = "auto", -- "auto", "dark", or "light"
    variant = "default", -- "default", "dim", or "soft"
    transparent = false,
})

vim.cmd.colorscheme("nova")
```

`theme = "auto"` follows `vim.o.background`. Explicit `"dark"` or `"light"` values also synchronize `vim.o.background` so Neovim and plugin defaults use the same background mode as Nova.

Variants keep Nova's semantic color mapping while changing palette intensity:

- `"default"`: Nova's original higher-chroma palette.
- `"dim"`: a middle palette with restrained chroma and stronger syntax luminance separation.
- `"soft"`: the lowest-chroma, narrowest-dynamic-range palette for lower-stimulation editing.

All variants support both dark and light themes.

### Lualine

```lua
require("lualine").setup({
    options = {
        theme = "nova",
    },
})
```

## Configuration

Nova intentionally keeps its public configuration small:

```lua
require("nova").setup({
    theme = "auto",
    variant = "default",
    transparent = false,
    colors = {},
    overrides = {},
})
```

- `theme`: `"auto"`, `"dark"`, or `"light"`.
- `variant`: `"default"`, `"dim"`, or `"soft"`. Variants change palette intensity without changing Nova's highlight semantics.
- `transparent`: removes Nova's main editor background when `true`.
- `colors`: a palette override table or a function receiving the selected base palette and resolved `"dark"`/`"light"` theme and returning an override table.
- `overrides`: a table of highlight overrides or a function receiving the resolved Nova palette.

Unknown top-level options are rejected so stale or misspelled configuration is not silently ignored.

### Variants

Use `dim` for a middle-ground dark or light palette with more syntax articulation than `soft` and less visual intensity than `default`:

```lua
require("nova").setup({
    theme = "dark",
    variant = "dim",
})
```

Use `soft` for lower-stimulation editing with compressed syntax contrast:

```lua
require("nova").setup({
    theme = "dark",
    variant = "soft",
})
```

Variants only change the palette. Core, Tree-sitter, LSP, and plugin highlight mappings remain shared.

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

Derived diff backgrounds are recomputed from overridden source colors unless a derived value is explicitly supplied.

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

Plugins remain responsible for choosing whether a window is surface-only, border-only, or combines both.

## Terminal colors

Nova targets true-color Neovim UIs and enables `termguicolors`. It intentionally does **not** define `terminal_color_0` through `terminal_color_15`.

ANSI colors for terminal buffers remain the responsibility of the terminal emulator or user configuration. Nova does not maintain a second reduced terminal palette because it cannot reliably preserve the theme's color relationships within a fixed 16-color mapping.

## Plugin integrations

Nova prefers plugin defaults whenever they already link to standard Neovim highlight groups. Plugin-specific overrides are kept only when Nova has a meaningful semantic or presentation difference to express.

The maintained integration set targets mainstream Neovim plugins plus plugins used by the author's dotconfig. Integrations do not require the corresponding plugin to be installed in order for Nova to load.

## Development

Active development happens on `dev`. Future feature work branches from `dev`, is squash-merged back into `dev`, and release-ready `dev` is promoted directly to `master` after final verification.

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for the maintenance and verification policy.

## Requirements

Nova currently targets Neovim **0.12.5**.
