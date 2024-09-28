if vim.fn.empty(vim.fn.glob('~/.config/nvim/autoload/plug.vim')) == 1 then
  vim.cmd('silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  vim.o.runtimepath = vim.o.runtimepath
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

-- An example of vim-plug section --------------------------------------------
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('dracula/vim')
Plug('ctrlpvim/ctrlp.vim')
Plug('itchyny/lightline.vim')
Plug('neoclide/coc.nvim')
Plug('tpope/vim-surround')
Plug('tpope/vim-vinegar')
Plug('tpope/vim-unimpaired')
Plug('christoomey/vim-tmux-navigator')
vim.call('plug#end')

-- COLORSCHEME - DRACULA
vim.cmd('silent! colorscheme dracula') -- https://draculatheme.com/vim 
--vim.cmd('let g:dracula_italic = 0')
--vim.cmd('let g:lightline = {"colorscheme": "darcula"'})

--[[
" COLORSCHEME - DRACULA
colorscheme dracula        " https://draculatheme.com/vim 
let g:dracula_italic = 0
let g:lightline = {'colorscheme': 'darcula'}

" Conquer of Completion (COC)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
--]]
