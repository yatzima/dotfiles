" @yatzima

" CHANGE DIRECTORY
cd ~/Documents/Projects

" VIM-PLUG
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
call plug#end()

" BASIC CONFIG
set nocompatible           " Don't try to be vi compatible
set nomodeline             " Disable modelines
set ruler                  " Show file stats
set bs=indent,eol,start    " Enables backspace
set encoding=utf-8         " The encoding displayed
set fileencoding=utf-8     " The encoding written to file
set showcmd                " Show (partial) command in status line
set colorcolumn=80         " Set colorcolumn
set cursorline             " Highlight current line
set wildmenu               " Visual autocomplete for command menu
set wrap                   " Enable line wrapping
set showmatch              " Highlight matching [{()}]
set noeb vb t_vb=          " Disables all bell sounds
set mouse=a                " Enables mouse scrolling
set clipboard=unnamed      " Enables copy to clipboard
set title                  " Set the title to the file currently being edited
set titleold=              " Restore old title after leaving Vim
set laststatus=2           " Always display the status bar
set lazyredraw             " Redraw only when we need to
set noshowmode             " Removes show mode
set history=1000           " Increase the undo limit
set background=dark        " Sets background to dark
set spell spelllang=en_us  " Enables spell checking
filetype plugin indent on  " Enables filetype detection 
syntax enable              " Turn on syntax highlighting

" NETRW
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" COLORSCHEME - DRACULA
colorscheme dracula        " https://draculatheme.com/vim 
let g:dracula_italic = 0
let g:lightline = {'colorscheme': 'darcula'}

" Conquer of Completion (COC)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" LINE NUMBERS
set number                 " Displays number line
set relativenumber         " Displays relative number line
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" TABS AND INDENTATION
set autoindent             " New lines inherit the indentation of previous lines 
set expandtab              " Convert tabs to spaces
set textwidth=80           " Break lines when line length increases
set tabstop=4              " Indent using four spaces 
set softtabstop=4          " Number of spaces in tab when editing
set shiftwidth=4           " Number of spaces to use for auto indent

" SEARCH
set hlsearch               " Enable search highlighting
set ignorecase             " Ignore case when searching
set incsearch              " Incremental search that shows partial matches
set smartcase              " Switch search to case-sensitive when using uppercase 
nnoremap <CR> :noh<CR>|    " Unsets the last search pattern by hitting return
nnoremap * *N|             " Search without jumping

" FOLDING
set foldenable             " Enable folding
set foldmethod=indent      " Fold based on indent level
set foldlevelstart=10      " Open most folds by default
set foldnestmax=10         " 10 nested fold max

" MAPPINGS
imap jj <Esc>|             " Remaps jj to esc in insert mode
nmap j gj|                 " Move veritcally by visual line (don't skip wrapped lines)
nmap k gk|                 " Move horizontally by visual line (don't skip wrapped lines)
nmap Y y$|                 " Make Y yank till end of line
nmap <Left> <<|            " Remaps left arrow key for indentation
nmap <Right> >>|           " Remaps right arrow key for indentation
vmap <Left> <gv|           " Remaps left arrow key for indentation
vmap <Right> >gv|          " Remaps right arrow key for indentation
nmap <Up> [e|              " Remaps up arrow key for line switching
nmap <Down> ]e|            " Remaps down arrow key for line switching
vmap <Up> [egv|            " Remaps up arrow key for line switching
vmap <Down> ]egv|          " Remaps down arrow key for line switching
map  <C-l> :tabn<CR>|      " Remaps CTRL+l to switch to next tab
map  <C-h> :tabp<CR>|      " Remaps CTRL+h to switch to previous tab
map  <C-t> :tabnew<CR>|    " Remaps CTRL+t to open a new tab
nmap <C-j> <C-e>j|         " Remaps CTRL+j to move screen and cursor up one line
nmap <C-k> <C-y>k|         " Remaps CTRL+k to move screen and cursor down one line

" SOURCE init.vim
autocmd BufWritePost init.vim source %
