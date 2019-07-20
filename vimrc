@yatzima
" Inspired from:
" https://dougblack.io/words/a-good-vimrc.html

" UI CONFIG
set nocompatible           " Don't try to be vi compatible
set modelines=0            " Security
set ruler                  " Show file stats
set bs=2                   " Enables backspace
set encoding=utf-8         " Encoding
set showcmd                " Show (partial) command in status line
set colorcolumn=80         " Set colorcolumn
set cursorline             " highlight current line
set wildmenu               " visual autocomplete for command menu
set lazyredraw             " redraw only when we need to.
set showmatch              " highlight matching [{()}]
filetype off               " Helps force plugins to load correctly when it is turned back on below
filetype plugin indent on  " For plugins to load correctly
syntax on                  " Turn on syntax highlighting
set mouse=a                " Enables mouse scrolling

" PATHOGEN
execute pathogen#infect()

" NERDTREEE
autocmd VimEnter * silent NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" COLORSCHEME
colorscheme gruvbox
set background=dark

" LINE NUMBERS
set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" TABS AND INDENTATION
filetype indent on         " load filetype-specific indent files
set expandtab              " enter spaces when tab is pressed
set textwidth=120          " break lines when line length increases
set tabstop=4              " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4           " number of spaces to use for auto indent
set autoindent             " copy indent from current line when starting a new line

" SEARCH
set incsearch              " search as characters are entered
set hlsearch               " highlight matches
nnoremap <CR> :noh<CR><CR> " This unsets the "last search pattern" register by hitting return

" FOLDING
set foldenable             " enable folding
set foldlevelstart=10      " open most folds by default
set foldnestmax=10         " 10 nested fold max
set foldmethod=indent      " fold based on indent level

" MAPPINGS
imap jj <Esc>              " remaps jj to esc in insert mode 
nmap <Left> <<             " remaps left arrow key for indentation
nmap <Right> >>            " remaps right arrow key for indentation
vmap <Left> <gv            " remaps left arrow key for indentation
vmap <Right> >gv           " remaps right arrow key for indentation
nmap <Up> [e               " remaps up arrow key for line switching
nmap <Down> ]e             " remaps down arrow key for line switching 
vmap <Up> [egv             " remaps up arrow key for line switching 
vmap <Down> ]egv           " remaps down arrow key for line switching 
