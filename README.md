# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## What's included

| Target | Notes |
|---|---|
| `~/.config/fish/config.fish` | fish config. `cat` / `ls` aliases are set only when `batcat` / `lsd` are installed. Volta and opencode are added to `PATH` only where installed. |
| `~/.config/fish/conf.d/host-bg.fish` | Changes the terminal background color per host (OSC 11), re-sent at every prompt. Add a host and its color in this file. |
| `~/.config/fish/fish_plugins` | fish plugin list for [fisher](https://github.com/jorgebucaran/fisher). Plugin files themselves are not tracked here. |
| `~/.config/nvim/init.vim` | Neovim config |
| `~/.tmux.conf` | tmux config |

## Setup on a new machine

1. Install fish and chezmoi.
2. Apply the dotfiles:

   ```fish
   chezmoi init --apply keyfox
   ```

   The fisher update script is skipped at this point because fisher is not installed yet.
3. Install fisher and the plugins listed in `fish_plugins`:

   ```fish
   curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
   ```

4. Open a new shell. tide starts with the lean style; run `tide configure` to change it.

## Updating

```fish
chezmoi update
```

When `fish_plugins` has changed, `fisher update` runs automatically after apply (`run_onchange_after_fisher-update.fish.tmpl`). It is skipped if fisher is not installed, and apply fails if `fisher update` fails (for example, when offline).

## fish plugins

- Add or remove plugins with `fisher install` / `fisher remove`, then copy the updated `~/.config/fish/fish_plugins` into the source with `chezmoi add ~/.config/fish/fish_plugins`.
- Do not `chezmoi add` files installed by fisher (`functions/`, `completions/`, `conf.d/_tide_init.fish`, etc.).
- tide settings are stored in `fish_variables`, which is not applied by chezmoi (see `.chezmoiignore`). Configure tide on each machine.
