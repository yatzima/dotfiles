-- [[ Setting options ]]
-- See `:help vim.o`
-- For more options, you can see `:help option-list`

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Set auto format
vim.g.autoformat = true

-- Line numbers
vim.o.number = true -- Make line numbers default
vim.o.relativenumber = true -- You can also add relative line numbers, to help with jumping.
vim.o.numberwidth = 4 -- Set number column width

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false -- Dont show mode since we have a statusline

-- Clipboard
-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus" -- Use system clipboard
end)

-- Save undo history
vim.o.undofile = true
vim.opt.undolevels = 10000

-- Search settings
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Show matches as you type

-- Decrease update time
vim.opt.updatetime = 200 -- Save swap file and trigger CursorHold

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Split windows
-- Configure how new splits should be opened
vim.o.splitright = true -- Put new windows right of current
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitkeep = "screen"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true -- Show some invisible characters (tabs...
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
-- vim.o.inccommand = "split"
vim.opt.inccommand = "nosplit" -- preview incremental substitute

-- Show which line your cursor is on
vim.opt.cursorline = true -- Enable highlighting of the current line

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true -- Confirm to save changes before exiting modified buffer

vim.opt.autowrite = true -- Enable auto write
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
-- Folding
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.foldenable = true -- Enable folding
vim.opt.foldtext = ""
-- vim.opt.formatexpr = "v:lua.LazyVim.format.formatexpr()"
vim.opt.formatoptions = "jcql" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.jumpoptions = "view"
vim.opt.laststatus = 3 -- global statusline
vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.ruler = false -- Disable the default ruler
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.shiftround = true -- Round indent
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.smoothscroll = true
vim.opt.spelllang = { "en" }
vim.opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]

-- Tabs & indentation
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.breakindent = true -- Enable break indent

vim.opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5 -- Minimum window width

-- Line wrapping
vim.opt.wrap = false -- Disable line wrap

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Appearance
vim.opt.termguicolors = true -- True color support
vim.opt.background = "dark" -- Dark background
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 4 -- Columns of context
vim.opt.colorcolumn = "80" -- Show column at 80 chars

-- Backspace
vim.opt.backspace = "indent,eol,start" -- Allow backspace on indent, eol, start

-- Show cmd (Doesn't work rn)
vim.opt.showcmd = true -- Shows partial commands in the bottom right
vim.opt.cmdheight = 5 -- Height of command line (0 hides it completely with noice)
