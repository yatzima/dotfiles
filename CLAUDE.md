# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Each tool has its own top-level directory that mirrors the `$HOME` directory structure. Running `stow <tool> -t ~` creates symlinks in `~` pointing into this repo.

## Applying Configs

```bash
# Apply all configs at once
./run_stow.sh

# Apply a single tool
stow nvim -t ~
stow tmux -t ~
stow zsh -t ~
```

## Installing Dependencies

```bash
brew bundle  # installs everything in Brewfile
```

## Repository Layout

Each directory is a stow package — its contents map directly onto `$HOME`:

| Directory | Target path | Tool |
|-----------|-------------|------|
| `nvim/` | `~/.config/nvim/` | Neovim |
| `tmux/` | `~/.config/tmux/` | Tmux |
| `zsh/` | `~/.config/zsh/` | Zsh (rc, profile, prompt) |
| `zshenv/` | `~/.zshenv` | Zsh env (sets `ZDOTDIR`) |
| `ghostty/` | `~/.config/ghostty/` | Ghostty terminal |
| `lazygit/` | `~/.config/lazygit/` | Lazygit |
| `aerospace/` | `~/.config/aerospace/` | AeroSpace window manager |
| `yazi/` | `~/.config/yazi/` | Yazi file manager |

## Neovim Config Architecture

Entry point: `nvim/.config/nvim/init.lua` — sets leader keys (`<Space>` / `;`) and loads two modules:

- `lua/config/` — core settings loaded at startup
  - `options.lua` — vim options (tabs=2, relative numbers, system clipboard, etc.)
  - `keymaps.lua` — non-plugin keymaps
  - `autocmds.lua` — autocommands
- `lua/plugins/` — one file per plugin, all loaded by `lazy.nvim` via `lua/plugins/init.lua`

Plugin manager is **lazy.nvim**. Use `:Lazy` to manage plugins, `:Lazy update` to update, `:Mason` to manage LSP servers and formatters.

Key plugins and their roles:
- **snacks.nvim** (`plugins/snacks.lua`) — dashboard, file picker, grep, git integration, notifications, terminal, zen mode. Most `<leader>f*`, `<leader>g*`, `<leader>s*` keymaps live here.
- **nvim-lspconfig + mason** (`plugins/lsp.lua`) — LSP setup for Python (`pyright`), Ruby (`ruby_lsp`), Lua (`lua_ls`). LSP keymaps use `<leader>l*`.
- **conform.nvim** (`plugins/formatter.lua`) — format on save; formatters: `stylua` (Lua), `black`+`isort` (Python), `rubocop` (Ruby), `prettier` (JS/TS).
- **blink.cmp** (`plugins/autocompletion.lua`) — completion engine.
- **treesitter** (`plugins/treesitter.lua`) — syntax highlighting and text objects.
- **which-key** (`plugins/which-key.lua`) — keymap discovery on `<leader>`.
- **codecompanion** (`plugins/codecompanion.lua`) — AI code assistant.
- **nvim-dap + nvim-dap-ui** — debugger.

## Tmux Config

Prefix is `C-a`. Key bindings:
- `C-a v` / `C-a s` — vertical/horizontal split (preserves cwd)
- `C-a h/j/k/l` — pane navigation
- `C-a C-y` — enter copy mode; `v` to select, `y` to yank
- `C-a C-p` — popup window at current path

Status bar auto-hides when only one window is open.

## Zsh Config

- `.zshenv` (in `zshenv/`) sets `ZDOTDIR=~/.config/zsh` so all other zsh files live in `~/.config/zsh/`
- Shell starts tmux automatically if not already inside one
- Vi mode enabled; `jj` exits insert mode in the shell too (via `bindkey -v`)
- `Ctrl-L` accepts zsh-autosuggestions
- `y` is aliased to yazi with cwd-tracking (changes shell directory on exit)
- `?` is a web search alias: `? my query` opens DuckDuckGo in w3m
- Runtime managed by **mise** (Ruby, Node versions)
