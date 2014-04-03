if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 1

" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
let g:ctrlp_switch_buffer = 0

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = '<Tab>f'
nnoremap <silent> <Tab>f :CtrlP<CR>

" Additional mapping for buffer search
nnoremap <silent> <Tab>b :CtrlPBuffer<cr>
" nnoremap <silent> <C-b> :CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>
nnoremap <silent> <Tab><Tab> :ClearCtrlPCache<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
nmap <Tab>a :CtrlP app/assets<CR>
nmap <Tab>m :CtrlP app/models<CR>
nmap <Tab>c :CtrlP app/controllers<CR>
nmap <Tab>v :CtrlP app/views<CR>
nmap <Tab>h :CtrlP app/helpers<CR>
nmap <Tab>l :CtrlP lib<CR>
nmap <Tab>p :CtrlP public<CR>
nmap <Tab>s :CtrlP spec<CR>
nmap <Tab>f :CtrlP fast_spec<CR>
nmap <Tab>d :CtrlP db<CR>
nmap <Tab>C :CtrlP config<CR>
nmap <Tab>V :CtrlP vendor<CR>
nmap <Tab>F :CtrlP factories<CR>
nmap <Tab>T :CtrlP test<CR>

"Cmd-Shift-(M)ethod - jump to a method (tag in current file)
"Ctrl-m is not good - it overrides behavior of Enter
nnoremap <silent> <D-M> :CtrlPBufTag<CR>
