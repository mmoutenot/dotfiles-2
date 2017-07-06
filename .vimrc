"""""""""""""""""""""""""""""
"        Behaviour          "
"""""""""""""""""""""""""""""
set nocompatible    " Don't behave like Vi

set wildmenu        " Enhanced command line completion
set wildmode=longest,list   " Complete the longest match, then list others
set backspace=indent,eol,start  " Allow backspacing over more stuff
set confirm         " Ask to confirm instead of failing
set ignorecase      " Case insensitive search
set smartcase       " Case sensitive if search term contains capitals
set linebreak       " Allow linebreaks between words
set scrolloff=2     " Start scrolling a few lines from the border
set visualbell      " Use colour blink instead of sound
set display+=lastline   " Always display the last line of the screen
set encoding=utf8   " Use utf8 as internal encoding
set whichwrap+=<,>,h,l  " Allow cursor to wrap lines
set hidden          " Allow opening new buffers without saving changes
set mouse=a         " Allow mouse control in all modes
set undofile        " Persistent undo history
set undodir=~/.vim/undo " Undo data location
set directory=~/.vim/swap " Swap file location
set backupdir=~/.vim/backup " Backup file location

autocmd CompleteDone * pclose " Automatically close preview after completion

"""""""""""""""""""""""""""""
"        Formatting         "
"""""""""""""""""""""""""""""
set tabstop=4       " Width of the tab character
set softtabstop=4   " How many columns the tab key inserts
set shiftwidth=4    " Width of 1 indentation level
set expandtab       " Expand tabs into spaces
set smartindent     " Smart C-like autoindenting

" Determine indentation rules by filetype
filetype plugin indent on

"""""""""""""""""""""""""""""
"        Interface          "
"""""""""""""""""""""""""""""
set number          " Show line numbers
set showmatch       " When inserting brackets, highlight the matching one
set hlsearch        " Highlight search results
set incsearch       " Highlight search results as the search is typed
set showcmd         " Show command on the bottom
set ruler           " Show line and cursor position
set colorcolumn=80  " Highlight the 80th column
set listchars=tab:>-,trail:· " Show tabs and trailing space
set list            " Enable the above settings
set laststatus=2    " Wider status line, needed for powerline

syntax on           " Enable syntax highlighting

"""""""""""""""""""""""""""""
"        Plugins            "
"""""""""""""""""""""""""""""
" Pathogen takes care of loading the plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Enable nice tabline and font
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Disable fancy arrows in NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" Show hidden files
let g:NERDTreeShowHidden = 1

" Nice enter inside parentheses
let delimitMate_expand_cr = 1

" Use tags files for completion
let g:ycm_collect_identifiers_from_tags_files = 1
" Compatibility with SnipMate
let g:ycm_key_list_select_completion   = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Nicer Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""
"        Key mapping        "
"""""""""""""""""""""""""""""
" j and k go up/down a row in wrapped lines
nnoremap j gj
nnoremap k gk

" Use space to clear search highlights and any message displayed
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Nice buffer navigation
nnoremap tg  :buffer<Space>
nnoremap th  :bfirst<CR>
nnoremap tj  :bnext<CR>
nnoremap tk  :bprev<CR>
nnoremap tl  :blast<CR>
nnoremap tt  :edit<Space>
nnoremap tn  :enew<CR>
nnoremap td  :bdelete<CR>
nnoremap ts  :files<CR>

" F2 toggles NERDTree view
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" F3 toggles paste mode
set pastetoggle=<F3>

" F4 toggles undo tree
nnoremap <F4> :UndotreeToggle<CR>

" leader r to save as root
nnoremap <leader>r :w !sudo tee % > /dev/null<CR>

"""""""""""""""""""""""""""""
"        Colours and GUI    "
"""""""""""""""""""""""""""""
if &term=='xterm'   " xterm supports 256 colours but doesn't set this
    set t_Co=256
endif
if &t_Co==256
    set background=dark     " Use dark background
    colorscheme gruvbox  " Use nicer colourscheme
endif
if has("gui_running")
    colorscheme gruvbox  " Gui sometimes doesn't set t_Co

    set guioptions+=TlrbRLe " Bug workaround
    set guioptions-=TlrbRLe " Hide the toolbar and scrollbars, use text tabs

    set guioptions+=c       " Don't open dialogue windows

    set background=dark     " Use dark background

    if has("linux")
        set guifont=Monospace\ 10   " Use different font
    elseif has("Win32")
        set guifont=Consolas:h10
    endif
endif
