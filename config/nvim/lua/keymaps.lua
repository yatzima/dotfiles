-- define local variables
local map = vim.api.nvim_set_keymap
local options = { noremap = true }

-- maps leader to space allows to make more extensive keybinds
vim.g.mapleader = " " 

-- search mappings
map("n", "<CR>", ":noh<CR>|", options)    -- sets the last search pattern by hitting return
map("n", "*", "*N|", options)             -- search without jumping

-- general mappings
map("i", "jj", "<Esc>", options)          -- remaps jj to esc in insert mode
map("", "<C-t>", ":tabnew<CR>|", options) -- remaps CTRL+t to open a new tab

-- Conquer of Completion (COC)
local function check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

vim.keymap.set("i", "<Tab>",
    function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#next'](1)
        end
        if check_back_space() then
            return vim.fn['coc#refresh']()
        end
        return "<Tab>"
    end
    , opts)
vim.keymap.set("i", "<S-Tab>", function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#prev'](1)
        end
        return "<S-Tab>"
end, opts)
vim.keymap.set("i", "<CR>", function()
        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#pum#confirm']();
        end
       return "\r"
end, opts)
-- Conquer of Completion (COC)
-- map("i", "<expr> <Tab> pumvisible() ? \<C-n>", "\<Tab>", options)
-- map("i", "<expr> <S-Tab> pumvisible() ? \<C-p>", "\<S-Tab>", options)
-- map("i", "<expr> <CR> pumvisible() ? \<C-y>", "\<C-g>u\<CR>", options)

-- inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
-- inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>\ :TmuxNavigatePrevious<cr>
--]]

