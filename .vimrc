call pathogen#infect()

colo aeonight
set guifont=Ubuntu\ Mono\ Bold\ 12

" Behaviors
set nocompatible
set modeline
set hidden
set history=10000
set encoding=utf8
set fileencoding=utf8
set whichwrap=b,s,h,l,~,[,],<,>
set backspace=indent,eol,start

" activate persistent undo
set undofile
set undodir=~/.vim/undo

" Store temporary files in a central spot
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//

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
set wildignore+=*/solr/data/*,*/public/system/*,*/public/uploads/*,*/tmp/*,*/log/* " ignore some dir on rails project
set wildignore+=*/.git/* " ignore hidden dir

" Search
set incsearch
set hlsearch
set ignorecase smartcase
map <Leader>c :noh<CR>
noremap <Esc><Esc><Esc> <Esc>:noh<CR>

" Wrap
set wrap
set linebreak
set nofoldenable
let &showbreak=repeat('>>', 6)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Syntax highlight/completion
syntax on
syntax sync fromstart
set omnifunc=syntaxcomplete#Complete

autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" tab/indent
filetype plugin indent on
set list listchars=tab:𐤟\ ,trail:𐤟
set tabstop=4
set softtabstop=4
set smarttab
set shiftwidth=4
set expandtab

" In-Out insert mode
inoremap <C-l> <Esc>l

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
nmap <Tab>q :lclose<CR>\|:cclose<CR>
nmap <Tab>e :Errors<CR>

" Ruby madness
" inoremap aa @
" inoremap - _
" inoremap _ -
" inoremap ' "
" inoremap " '
" inoremap : ;
" inoremap ; :
let ruby_no_expensive = 1
let ruby_operators = 1
if !empty($MY_RUBY_HOME)
    let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*'),"\n"),',')
endif

" Statusline
set statusline=%#warningmsg#

" set statusline+=%{SyntasticStatuslineFlag()} " syntastic

set statusline+=%*
set statusline+=\ %-.50(%<%f\ %y%)%m
set statusline+=%=
set statusline+=%{StatuslineCurrentHighlight()}\ \
set statusline+=%-10.(line\ %l\ col\ %c%)\ "(%P)\

autocmd BufEnter * lcd %:p:h  " for each buffer, auto-chdir to containing folder
autocmd User BufEnterRails silent! Rlcd " but if it's rails, chdir to rails_root

" NERDTree
let g:NERDTreeWinPos="right"
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=40
map <F9> :NERDTreeToggle<CR>
map <S-Tab> :NERDTreeToggle<CR>

" ctrlp.vim
let g:ctrlp_working_path_mode = 0
map <Tab>f :CtrlP<CR>
map <Tab>b :CtrlPBuffer<CR>
map <Tab>l :CtrlPLine<CR>

" ctrlp.vim Rails
map <Tab>m :CtrlP app/models<CR>
map <Tab>c :CtrlP app/controllers<CR>
map <Tab>v :CtrlP app/views<CR>
map <Tab>a :CtrlP app/assets<CR>
map <Tab>s :CtrlP spec<CR>

" Gundo
nmap <Tab>u :GundoToggle<CR>

" Tabular
nmap <Leader><Tab> :exec ':Tab /'.getline('.')[col('.')-1].'.*$'<CR>
vmap <Leader><Tab> y:Tab /<C-R>".*$<CR>

" syntastic
" let g:syntastic_enable_signs=1
" let g:syntastic_quiet_warnings=0
" let g:syntastic_stl_format='[%E{err:%fe #%e}%B{, }%W{warn:%fw #%w}]'

" vim-powerline
let g:Powerline_symbols = 'compatible'
let g:Powerline_theme = 'aeonight'
let g:Powerline_colorscheme = 'aeonight'
let g:Powerline_cache_enabled = 0

" supertab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 0
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_max_list = 15
let g:neocomplcache_force_overwrite_completefunc = 1
imap <silent><expr><tab> neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
smap <tab> <right><plug>(neocomplcache_snippets_jump) 
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup()."\<CR>" : "\<CR>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns._ = '\h\w*'

if !exists('g:neocomplcache_omni_patterns')
let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

source $HOME/.vim/vimrc/functions.vim
source $HOME/.vim/vimrc/large_file.vim

