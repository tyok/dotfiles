" Behaviors
set nocompatible
set modeline
set hidden
set history=10000
set encoding=utf8
set fileencoding=utf8
set whichwrap=b,s,h,l,~,[,],<,>
set backspace=indent,eol,start

autocmd BufEnter * lcd %:p:h  " for each buffer, auto-chdir to containing folder
autocmd User BufEnterRails silent! Rlcd " but if it's rails, chdir to rails_root
autocmd BufReadPost *                                          " When editing a file, always jump to the last known cursor position.
            \ if line("'\"") > 0 && line("'\"") <= line("$") | " Don't do it when the position is invalid or when inside an event handler
            \   exe "normal g`\"" |                            " (happens when dropping a file on gvim).
            \ endif


" activate persistent undo
set undofile
set undodir=~/.vim/undo

" Store temporary files in a central spot
set backupdir=~/.vim/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,/var/tmp,/tmp

" Scrolls
set scrolloff=2
set sidescrolloff=5
set sidescroll=1

" Syntax highlight/completion
syntax on
syntax sync fromstart
set omnifunc=syntaxcomplete#Complete

" Widgets
set winminheight=0
set number ruler
set wildmenu
set wildmode=list:longest
set laststatus=2
set showcmd
set cmdheight=2

" Files to ignore
set wildignore+=*.pdf,*.ppt,*.zip,*.doc,*.xls " ignore office files
set wildignore+=*.swp,*.png,*.jpg,*.gif,*.tar* " ignore non-text files
set wildignore+=*.mp3,*.wmv,*.ogg,*.wav " ignore non-text files
set wildignore+=solr/data/**,public/system/**,public/uploads/**,tmp/** " ignore some dir on rails project
set wildignore+=.*/** " ignore hidden dir

" Search
set incsearch
set hlsearch
set ignorecase smartcase
nnoremap <CR> :nohlsearch<cr>
map <Leader>c :noh<CR>

" Wrap
set wrap
set linebreak
set nofoldenable
nnoremap j gj
nnoremap k gk

" tab/indent
filetype plugin indent on
set list listchars=tab:𐤟\ ,trail:𐤟
set tabstop=4
set softtabstop=4
set smarttab
set shiftwidth=4
set expandtab

" Demote ; to under leader key (I seldom use it)
nnoremap <Leader>; ;
nnoremap ; :

" Tabs
map <Tab>n :tabnew<CR>
map <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprev<CR>

" windows
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Right> <C-W>l
map <C-Left> <C-W>h

" Statusline
set statusline=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ %-.50(%<%f\ %y%)%m
set statusline+=%=
set statusline+=%{StatuslineCurrentHighlight()}\ \ 
set statusline+=%-10.(line\ %l\ col\ %c%)\ "(%P)\ 

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction
