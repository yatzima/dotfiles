local set = vim.opt

-- LINE NUMBERS
set.number = true          -- displays number line
set.relativenumber = true  -- displays relative number line
vim.api.nvim_create_autocmd("InsertEnter", { command = [[set norelativenumber]] })
vim.api.nvim_create_autocmd("InsertLeave", { command = [[set relativenumber]] }) 

-- SEARCH
set.hlsearch = true        -- enable search highlighting
set.ignorecase = true      -- ignore case when searching
set.incsearch = true       -- incremental search that shows partial matches
set.smartcase = true       -- switch search to case-sensitive when using uppercase 

--[[
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
	
" TABS AND INDENTATION
set autoindent             " New lines inherit the indentation of previous lines 
set expandtab              " Convert tabs to spaces
set textwidth=80           " Break lines when line length increases
set tabstop=4              " Indent using four spaces 
set softtabstop=4          " Number of spaces in tab when editing
set shiftwidth=4           " Number of spaces to use for auto indent

" FOLDING
set foldenable             " Enable folding
set foldmethod=indent      " Fold based on indent level
set foldlevelstart=10      " Open most folds by default
set foldnestmax=10         " 10 nested fold max
--]]
