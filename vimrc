" @yatzima
" Inspired by https://dougblack.io/words/a-good-vimrc.html

" BASIC CONFIG
set nocompatible           " Don't try to be vi compatible
set nomodeline             " Disable modelines
set ruler                  " Show file stats
set bs=2                   " Enables backspace
set encoding=utf-8         " The encoding displayed.
set fileencoding=utf-8     " The encoding written to file.
set showcmd                " Show (partial) command in status line
set colorcolumn=80         " Set colorcolumn
set cursorline             " Highlight current line
set wildmenu               " Visual autocomplete for command menu
set lazyredraw             " Redraw only when we need to.
set showmatch              " Highlight matching [{()}]
set noeb vb t_vb=          " Disables all bell sounds
set mouse=a                " Enables mouse scrolling
filetype plugin indent on  " Enables filetype detection 
syntax enable              " Turn on syntax highlighting

" PATHOGEN
execute pathogen#infect()

" NERDTREEE
let g:NERDTreeWinSize=25   " Sets the width to 25 columns
autocmd VimEnter * silent NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") 
    \ && b:NERDTree.isTabTree()) | q | endif
autocmd BufWinEnter * NERDTreeMirror

" COLORSCHEME
colorscheme gruvbox        " https://github.com/morhetz/gruvbox
set background=dark        " Sets background to dark

" LINE NUMBERS
set number                 " Displays number line
set relativenumber         " Displays relative number line
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" TABS AND INDENTATION
set expandtab              " Enter spaces when tab is pressed
set textwidth=80           " Break lines when line length increases
set tabstop=4              " Use 4 spaces to represent tab
set softtabstop=4          " Number of spaces in tab when editing
set shiftwidth=4           " Number of spaces to use for auto indent
set autoindent             " Copy indent from current line when starting a new line

" SEARCH
set incsearch              " Search as characters are entered
set hlsearch               " Highlight matches
nnoremap <CR> :noh<CR>|    " This unsets the last search pattern register by hitting return

" FOLDING
set foldenable             " Enable folding
set foldlevelstart=10      " Open most folds by default
set foldnestmax=10         " 10 nested fold max
set foldmethod=indent      " Fold based on indent level

" MAPPINGS
imap jj <Esc>|             " Remaps jj to esc in insert mode
nmap j gj|                 " Move veritcally by visual line
nmap k gk|                 " Move horizontally by visual line
nmap <Left> <<|            " Remaps left arrow key for indentation
nmap <Right> >>|           " Remaps right arrow key for indentation
vmap <Left> <gv|           " Remaps left arrow key for indentation
vmap <Right> >gv|          " Remaps right arrow key for indentation
nmap <Up> [e|              " Remaps up arrow key for line switching
nmap <Down> ]e|            " Remaps down arrow key for line switching
vmap <Up> [egv|            " Remaps up arrow key for line switching
vmap <Down> ]egv|          " Remaps down arrow key for line switching
map  <C-l> :tabn<CR>|      " Remaps CTRL + l to switch to next tab
map  <C-h> :tabp<CR>|      " Remaps CTRL + h to switch to previous tab
map  <C-t> :tabnew<CR>|    " Remaps CTRL + t to open a new tab
