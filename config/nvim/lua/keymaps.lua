-- define local variables
local map = vim.api.nvim_set_keymap
local options = { noremap = true }

-- maps leader to space allows to make more extensive keybinds
vim.g.mapleader = " " 

-- search mappings
map("n", "<CR>", ":noh<CR>|", options) -- nsets the last search pattern by hitting return
map("n", "*", "*N|", options)          -- Search without jumping

-- general mappings
map("i", "jj", "<Esc>", options) -- remaps jj to esc in insert mode

--[[
" MAPPINGS
nmap j gj|                 " Move veritcally by visual line (don't skip wrapped lines)
nmap k gk|                 " Move horizontally by visual line (don't skip wrapped lines)
nmap <Up> [e|              " Remaps up arrow key for line switching
nmap <Down> ]e|            " Remaps down arrow key for line switching
vmap <Up> [egv|            " Remaps up arrow key for line switching
vmap <Down> ]egv|          " Remaps down arrow key for line switching
map  <C-l> :tabn<CR>|      " Remaps CTRL+l to switch to next tab
map  <C-h> :tabp<CR>|      " Remaps CTRL+h to switch to previous tab
map  <C-t> :tabnew<CR>|    " Remaps CTRL+t to open a new tab
nmap <C-j> <C-e>j|         " Remaps CTRL+j to move screen and cursor up one line
nmap <C-k> <C-y>k|         " Remaps CTRL+k to move screen and cursor down one line
--]]
