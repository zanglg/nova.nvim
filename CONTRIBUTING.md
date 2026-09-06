# Contributing to Nova

Development currently targets the `dev` branch and Neovim 0.12.5.

## Plugin integration scope

Nova keeps a plugin integration when at least one of these is true:

1. The plugin is in the current Dotfyle overall Top 25 and exposes UI highlight groups that benefit from colorscheme integration.
2. The plugin is used by the author's `dotconfig` Neovim configuration.

Libraries or dependencies without meaningful user-facing highlight groups do not need dedicated integration modules. Integrations that no longer meet either criterion should be removed when they are obsolete, unmaintained, or no longer useful.

## Highlight policy

Prefer upstream plugin defaults when they already link to standard Neovim highlight groups. Add a plugin-specific override only when Nova intentionally changes semantic meaning or presentation.

General rules:

- Ordinary UI text uses Nova's neutral hierarchy rather than arbitrary syntax accents.
- Secondary metadata uses `Comment`; weak or disabled information uses `NonText`/`inconspicuous` semantics.
- Structural borders use `FloatBorder`/`splitline` unless a semantic border is intentionally part of the plugin UI.
- The plugin that creates a float owns the choice between surface-only, border-only, or combined presentation.
- Matching/navigation roles remain distinct: `match`, `current_match`, and `target`.
- Completion, search, and navigation may share a semantic color while using different presentation attributes.

## Rainbow delimiters

Nova has eight semantic accent colors available for rainbow use:

`red`, `orange`, `yellow`, `green`, `teal`, `blue`, `violet`, `purple`.

When an integration exposes eight rainbow slots, use all eight colors. When it exposes seven slots, omit `orange` and use the other seven colors.

## Changes and verification

Keep commits focused on one conceptual change. Palette changes, highlight semantics, plugin coverage, and structural refactors should remain separate when possible.

Run the headless suite before considering a change complete:

```sh
nvim --headless -u NONE --cmd "set rtp+=$PWD" -l tests/run.lua
```

Headless tests validate configuration, palette construction, highlight builders, repeated colorscheme loading, and stale references. Visual decisions still require runtime review in a real Neovim UI.
