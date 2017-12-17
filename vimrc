set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mattn/emmet-vim'



Plug 'gregsexton/gitv'
Plug 'MarcWeber/vim-addon-mw-utils' "Plugin for snipmate
Plug 'tomtom/tlib_vim' " Plugin for snipmate
Plug 'garbas/vim-snipmate'

" Show the Outlines of the page
Plug 'majutsushi/tagbar'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'kien/ctrlp.vim'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'plasticboy/vim-markdown', {'for': 'mkd'}


Plug 'xitianfz/vim-python-syntax'

call plug#end()

" =================
" "  settings
" " =================
set mouse=a
set nocompatible                      " not compatible with the old-fashion vi mode
set backspace=2                       " allow backspacing over everything in insert nc >kkmode
set history=1000                      " keep 1000 lines of command line history
set undolevels=100
set ruler                             " show the cursor position all the time
set autoread                          " auto read when file is changed from outside
set wrap
set linebreak
set nolist
set hidden
set cursorline
set showmatch
set foldenable
set number
set numberwidth=4
" set relativenumber
set title
set showcmd
set noshowmode
set nobomb                            " no BOM(Byte Order Mark)
set nostartofline
set laststatus=2
set clipboard+=unnamed
set splitright                        " always open vertical split window in the right side
set splitbelow                        " always open horizontal split window below
set scrolloff=4                       " start scrolling when n lines away from margins
set switchbuf=useopen
set showtabline=2                     " always show tab
set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash
set key=                              " disable encryption
set synmaxcol=256
set viminfo=                          " disable .viminfo file
set completeopt=menuone
set ttyfast                           " send more chars while redrawing
set lazyredraw                        " speedup vim
set timeoutlen=1000
set ttimeoutlen=0

set foldmethod=indent
set foldlevel=100

set hlsearch                          " search highlighting
set incsearch                         " incremental search
set t_Co=256
set guifont=Source\ Code\ Pro:h15     " only available for the GUI version
set linespace=3                       " only available for the GUI version
set guioptions-=l                     " remove gui scrollbar
set guioptions-=L
set guioptions-=r
set guioptions-=R

set nobackup                          " no *~ backup files
set noswapfile
set nowritebackup
set copyindent                        " copy the previous indentation on autoindenting
set ignorecase                        " ignore case when searching
set smartcase
set smarttab                          " insert tabs on the start of a line according to
set expandtab                         " replace <TAB> with spaces
set softtabstop=4
set shiftwidth=4
set tabstop=4
set shortmess=Ia                      " remove splash wording

" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

" file encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le,latin1
set fenc=utf-8 enc=utf-8 tenc=utf-8
scriptencoding utf-8

" ignores
set wildignore+=*.o,*.obj,*.pyc                " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico        " image format
set wildignore+=*.swf,*.fla                    " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv        " media format
set wildignore+=*.git*,*.hg*,*.svn*            " version control system
set wildignore+=*sass-cache*
set wildignore+=*.DS_Store
set wildignore+=log/**
set wildignore+=tmp/**

" theme
syntax on                             " syntax highlight
let base16colorspace=256


"Tab
nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>te :tabedit<SPACE>
nnoremap <leader>tm :tabmove<SPACE>
nnoremap <leader>tk :tabclose<CR>
nnoremap <C-H> :tabprev<CR>
nnoremap <C-L> :tabnext<CR>


nnoremap <silent><F6> :CurrentLineWhitespaceOn<CR>
nnoremap <silent><F7> :StripWhitespace<CR>

"====================================================================
" ctags
"====================================================================
nmap <Leader>c :!ctags --recurse --kinds-php=citf &<CR>

"====================================================================
"NERDTREE
"====================================================================
"nmap <F5> :NERDTreeToggle <CR>
nmap <C-T> :NERDTree<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeChDirMode = 2
let NERDTreeMouseMode = 2
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 0
let NERDTreeIgnore = ['\.git$', '\.DS_Store$']
let g:NERDTreeWinSize = 30
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
"====================================================================
"airline setting
"====================================================================
let g:airline_theme='luna'
"" enable tabline
let g:airline#extensions#tabline#enabled = 1
"" set left separator
let g:airline#extensions#tabline#left_sep = ' '
"" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
"" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1


"====================================================================
"vim-easy-align
"====================================================================
""Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"====================================================================
"tagBar
"====================================================================
"" 設定開啟 Tagbar 快捷鍵為 F8 "
nmap <F8> :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

"====================================================================
"Ctags
"====================================================================
"C-] : go th definition , C-o : go back the origin position


"====================================================================
"CTRLP
"====================================================================
let g:ctrlp_map = '<c-f>'
"let g:ctrlp_cmd = 'CtrlP'
"Exclude files and directories using Vim's wildignore and CtrlP's own "g:ctrlp_custom_ignore:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$','file': '\v\.(exe|so|dll)$','link': 'some_bad_symbolic_links'}


"====================================================================
"UltiSnipsEdit
"====================================================================
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
