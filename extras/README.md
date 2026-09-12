# Nova themes for other tools

The files in this directory are generated from Nova's six palettes in
`lua/nova/colors.lua`. Do not edit generated files directly. Regenerate them with:

```sh
NVIM_LOG_FILE=/tmp/nova.nvim.log nvim --headless -u NONE -l scripts/generate_themes.lua
```

Pass a directory after the script path to generate into a dotfiles staging
directory instead of `extras/`.

The default names are `nova-dark` and `nova-light`. The quieter variants append
`-dim` or `-soft`. Helix uses underscores because its theme names are derived from
TOML filenames. Windows Terminal uses display names such as `Nova Dark Soft`.

## Terminal emulators

### Windows Terminal

Merge the `schemes` array from `windows-terminal/nova.json` into
`settings.json`, then select a scheme for all profiles. Current Windows Terminal
versions can follow the application appearance:

```json
{
  "profiles": {
    "defaults": {
      "colorScheme": {
        "dark": "Nova Dark",
        "light": "Nova Light"
      }
    }
  }
}
```

### WezTerm

Copy the TOML files to `~/.config/wezterm/colors/`, then choose one in
`wezterm.lua`. This example follows the system appearance:

```lua
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local appearance = wezterm.gui.get_appearance()

config.color_scheme = appearance:find("Dark") and "Nova Dark" or "Nova Light"
return config
```

### Alacritty

Copy the files to your Alacritty configuration directory and import one from
`alacritty.toml`:

```toml
[general]
import = ["~/.config/alacritty/themes/nova-dark.toml"]
```

Alacritty does not select separate light and dark imports itself. Point the
import at a stable symlink if an external appearance-switching script should
change the active variant.

### kitty

Copy the files into the kitty configuration directory and include one from
`kitty.conf`:

```conf
include themes/nova-dark.conf
```

### Ghostty

The application is named Ghostty (rather than Ghosty). Copy the generated files
to `$XDG_CONFIG_HOME/ghostty/themes/`, then select one or configure an automatic
light/dark pair:

```conf
theme = dark:nova-dark,light:nova-light
```

## Editors, agents, and interactive tools

### fzf

Source one generated shell fragment from the shell startup file:

```sh
. /path/to/nova.nvim/extras/fzf/nova-dark.sh
```

The fragment preserves existing `FZF_DEFAULT_OPTS` and only appends Nova's
24-bit color mapping.

### Helix

Copy the TOML files to `~/.config/helix/themes/`. Helix can follow a terminal
that reports its light/dark appearance:

```toml
[theme]
dark = "nova_dark"
light = "nova_light"
fallback = "nova_dark"
```

### Pi coding agent

Copy the JSON files to `~/.pi/agent/themes/`, then select a theme in `/settings`
or configure a light/dark pair:

```json
{
  "theme": "nova-light/nova-dark"
}
```

The generated files define every required Pi color token, including tool states,
diffs, Markdown, syntax highlighting, thinking levels, search, and HTML export.

### eza

eza requires the active file to be named `theme.yml`. Copy or symlink the chosen
variant into its configuration directory:

```sh
mkdir -p ~/.config/eza
ln -sf /path/to/nova.nvim/extras/eza/nova-dark.yml ~/.config/eza/theme.yml
export EZA_CONFIG_DIR="$HOME/.config/eza"
```

On macOS, setting `EZA_CONFIG_DIR` explicitly also avoids the platform-specific
Application Support location. `EZA_COLORS` and `LS_COLORS` override values in
`theme.yml`; unset them when testing the generated theme.

## Additional integrations

### bat and delta

Copy the `.tmTheme` files to `$(bat --config-dir)/themes/`, then rebuild bat's
cache:

```sh
bat cache --build
```

bat can switch with the detected system appearance:

```conf
--theme="auto:system"
--theme-dark="nova-dark"
--theme-light="nova-light"
```

Each delta file is a named feature and references the matching bat syntax theme.
Include one from `~/.gitconfig`, then activate it:

```gitconfig
[include]
    path = /path/to/nova.nvim/extras/delta/nova-dark.gitconfig

[delta]
    features = nova-dark
```

### Starship

Merge one generated TOML file into `~/.config/starship.toml`. It selects a Nova
palette and overrides Starship's standard named colors while also exposing
semantic names such as `accent`, `comment`, `surface`, and `selection` for custom
prompt modules.

### Zellij

Copy the KDL files to `~/.config/zellij/themes/`, then configure a pair:

```kdl
theme_dark "nova-dark"
theme_light "nova-light"
```

### Lazygit

The generated YAML files are mergeable theme fragments. Add one after the main
configuration with `--use-config-file` or `LG_CONFIG_FILE`:

```sh
LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml,/path/to/nova.nvim/extras/lazygit/nova-dark.yml" lazygit
```

## Programs that inherit terminal colors

Many common replacements do not expose a complete theme format. `ripgrep`,
`fd`, `dust`, and `zoxide` primarily use ANSI colors or a small set of command
options. They already follow the Nova terminal palette; adding tool-specific
generated files would duplicate configuration without providing a consistent
semantic theme.

`palettes/nova.json` is a machine-readable export of the semantic and ANSI
palettes for adding future renderers without parsing Lua.
