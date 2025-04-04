" @yatzima

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

" MAPPINGS
imap jj <Esc>|             " Remaps jj to esc in insert mode
nmap j gj|                 " Move veritcally by visual line (don't skip wrapped lines)
nmap k gk|                 " Move horizontally by visual line (don't skip wrapped lines)
nmap Y y$|                 " Make Y yank till end of line
nmap <Up> [e|              " Remaps up arrow key for line switching
nmap <Down> ]e|            " Remaps down arrow key for line switching
vmap <Up> [egv|            " Remaps up arrow key for line switching
vmap <Down> ]egv|          " Remaps down arrow key for line switching
map  <C-l> :tabn<CR>|      " Remaps CTRL+l to switch to next tab
map  <C-h> :tabp<CR>|      " Remaps CTRL+h to switch to previous tab
map  <C-t> :tabnew<CR>|    " Remaps CTRL+t to open a new tab
nmap <C-j> <C-e>j|         " Remaps CTRL+j to move screen and cursor up one line
nmap <C-k> <C-y>k|         " Remaps CTRL+k to move screen and cursor down one line
