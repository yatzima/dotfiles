-- Define local variable
local opt = vim.opt

-- Line numbers
opt.number = true                    -- Show line numbers
opt.relativenumber = true            -- Show relative line numbers
opt.numberwidth = 4                  -- Set number column width

-- Tabs & indentation
opt.tabstop = 2                      -- 2 spaces for tabs
opt.shiftwidth = 2                   -- 2 spaces for indent width
opt.expandtab = true                 -- Expand tab to spaces
opt.autoindent = true                -- Copy indent from current line
opt.smartindent = true               -- Smart autoindenting on new line
opt.breakindent = true               -- Enable break indent

-- Line wrapping
opt.wrap = false                     -- Disable line wrapping

-- Search settings
opt.ignorecase = true                -- Ignore case when searching
opt.smartcase = true                 -- Mixed case = case-sensitive
opt.hlsearch = false                 -- Don't highlight search results
opt.incsearch = true                 -- Show matches as you type

-- Cursor line
opt.cursorline = true                -- Highlight current line

-- Appearance
opt.termguicolors = true             -- True color support
opt.background = "dark"              -- Dark background
opt.signcolumn = "yes"               -- Always show sign column
opt.scrolloff = 8                    -- Min lines to keep above/below cursor
opt.sidescrolloff = 8                -- Min columns to keep left/right of cursor
opt.colorcolumn = "80"               -- Show column at 80 chars

-- Backspace
opt.backspace = "indent,eol,start"   -- Allow backspace on indent, eol, start

-- Clipboard
opt.clipboard:append("unnamedplus")  -- Use system clipboard

-- Split windows
opt.splitright = true                -- Split vertical window to the right
opt.splitbelow = true                -- Split horizontal window to the bottom

-- Swap & backup
opt.swapfile = false                 -- Don't use swapfile
opt.backup = false                   -- Don't create backup file
opt.undofile = true                  -- Enable persistent undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Performance
opt.updatetime = 250                 -- Faster completion (default 4000ms)
opt.timeoutlen = 300                 -- Time to wait for mapped sequence

-- Behaviors
opt.iskeyword:append("-")            -- Consider dash as part of word
opt.mouse = "a"                      -- Enable mouse support
opt.completeopt = "menu,menuone,noselect" -- Completion options
opt.pumheight = 10                   -- Pop up menu height

-- Status line
opt.laststatus = 3                   -- Global statusline

-- Command line
opt.cmdheight = 1                    -- Height of command line
opt.showmode = false                 -- Don't show mode (shown in statusline)

-- Folding (if using nvim-ufo or similar)
opt.foldcolumn = "1"                 -- Show fold column
opt.foldlevel = 99                   -- Open all folds by default
opt.foldlevelstart = 99              -- Open all folds by default
opt.foldenable = true                -- Enable folding

-- Whitespace characters
opt.list = true                      -- Show whitespace characters
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Shorter messages
opt.shortmess:append("c")            -- Don't show completion messages

-- Fill chars (for splits, folds, etc)
opt.fillchars = {
  foldopen = "v",
  foldclose = ">",
  fold = " ",
  foldsep = " ",
  diff = "/",
  eob = " ",
}

-- Format options
opt.formatoptions = "jcroqlnt"       -- tcqj by default
