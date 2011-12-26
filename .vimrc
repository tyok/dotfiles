call pathogen#infect()

source $HOME/.vim/vimrc/functions.vim

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
nnoremap <CR> :nohlsearch<CR>\|<CR>
map <Leader>c :noh<CR>

" Wrap
set wrap
set linebreak
set nofoldenable
nnoremap j gj
nnoremap k gk

" Syntax highlight/completion
syntax on
syntax sync fromstart
set omnifunc=syntaxcomplete#Complete

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

" Quickly close that bottom split
nmap <Tab>q :lclose<CR> :cclose<CR>

" Statusline
set statusline=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ %-.50(%<%f\ %y%)%m
set statusline+=%=
set statusline+=%{StatuslineCurrentHighlight()}\ \ 
set statusline+=%-10.(line\ %l\ col\ %c%)\ "(%P)\ 

" NERDTree
let NERDTreeWinPos="right"
let NERDTreeMinimalUI=1
let g:NERDTreeWinSize = 40
map <F9> :NERDTreeToggle<CR>
map <S-Tab> :NERDTreeToggle<CR>

" Command-T
let g:CommandTMatchWindowReverse=1
let g:CommandTMaxFiles=9000
let g:CommandTMaxDepth=6
map <Tab>t :CommandTFlush<CR>\|:CommandT<CR>
map <Tab>b :CommandTBuffer<CR>

" Command-T Rails
map <Tab>m :CommandTFlush<CR>\|:CommandT app/models<CR>
map <Tab>c :CommandTFlush<CR>\|:CommandT app/controllers<CR>
map <Tab>v :CommandTFlush<CR>\|:CommandT app/views<CR>
map <Tab>s :CommandTFlush<CR>\|:CommandT spec<CR>

" Gundo
nmap <Tab>u :GundoToggle<CR>

" Tabular
nmap <Leader><Tab> :exec ':Tab /'.getline('.')[col('.')-1].'.*$'<CR>
vmap <Leader><Tab> y:Tab /<C-R>".*$<CR>

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_stl_format='[%E{err:%fe #%e}%B{, }%W{warn:%fw #%w}]'

