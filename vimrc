call pathogen#infect()
call pathogen#helptags()

let g:pymode_python = 'python3'

colors koehler
set shiftwidth=4
set expandtab
set tabstop=4
set autoindent
set softtabstop=4 "Multiple spaces are seen as tabstops so <BS> deletes the four together"

" windows remain the same size after a split
set equalalways
" new splits below and to the right
set splitbelow
set splitright

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" show matching parens
set showmatch
set wildignore=*.swp,*.bak,*pyc
set title

if has("autocmd")
  filetype plugin indent on
endif

"Hitting zz in normal mode will remove all consecutive whitespace in a line
"and make it single whitespace
:map <leader>zz :s![^ ]\zs  \+! !g<CR>
"Replace all consecutive whitespace, with commas whitespace
:map <leader>xx :s![^ ]\zs \+!, !g<CR>
"Take a 'column' of data and replace line endings with comma-delimited
:map <leader>xc :%s/\n/, /g<CR>
"Type Cc on a bunch of commits and it reverse them and turns them into
"cherry-picks
:map <leader>cc :%s/\(^\)\(.\{7}\)\(.*\)/git cherry-pick \2/<CR> :g/^/m0<CR>
"xz truncates the line at the last space before or at 79 characters
:map <leader>zx :s/\(^.\{,78\}\)\s/\1\r <CR>j

"Go to the last whitespace before the line above the cursor and enter
"a carraige return. Needs to be at beginning of line. not sure why i can't
"move the cursor yet
:map rr ?\%<79c\s<CR>ciw<CR><ESC>j<C-0>

:set ignorecase
:set smartcase

if has('gui_running')
  set guioptions-=T  " no toolbar
  set noeb vb
endif

" from http://stackoverflow.com/questions/14779299/syntax-highlighting-randomly-disappears-during-file-saving
" fix highlighting by hitting F9 when it messes up
noremap <F9> <Esc>:syntax sync fromstart<CR>
inoremap <F9> <C-o>:syntax sync fromstart<CR>

" for latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

let mapleader = "\<Space>"

" Open URL in browser
function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!chromium-browser ".line
endfunction

map <Leader>w :call Browser()<CR>

" syntastic

let g:syntastic_check_on_open = 1

" 203 whitespace before :
let g:syntatsic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E203,E226,E121,E731"'

let g:syntastic_ruby_checkers = ['rubocop', 'mri', 'rubylint']

" vim-jedi
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0

" ii gets you out of edit and into normal mode
imap jk <Esc>

" font stuff, desktop can handle smaller font
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "skipper-desktop"
    if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ 9
    endif
    endif
endif

" better indents for HTML
au BufNewFile,BufRead *.mustache setlocal ft=html
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" hack to add Cython to python ft instead of pyrex
" enabled code folding in python_editing.vim
au BufNewFile,BufRead *.pyx setlocal ft=python
au BufNewFile,BufRead *.pxi setlocal ft=python

" cvim
let g:C_UseTool_cmake = 'yes'

" osx / linux harmony
if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        " for gx
        let g:netrw_browsex_viewer = "open"
        " system clipboard
        vmap <Leader>p :r !pbpaste<CR>
        nmap <Leader>p :r !pbpaste<CR>
        vmap <Leader>y :w !pbcopy<CR><CR>
        nmap <Leader>y :w !pbcopy<CR><CR>
        nmap <Leader>d :.!pbcopy<CR><CR>
    else
        let g:netrw_browsex_viewer = "xdg-open"
        " copy-paste to system clipboard
        vmap <Leader>y "+y
        vmap <Leader>d "+d
        nmap <Leader>p "+p
        nmap <Leader>P "+P
        vmap <Leader>p "+p
        vmap <Leader>P "+P
    endif
endif

let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline#extensions#tabline#enabled = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" navigate between window panes with Ctrl + hjkl
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

let g:sql_type_default = 'pgsql'
syntax enable
set background=dark
colorscheme solarized

" delete to null register
nnoremap <Leader>dd "_dd

" center in the middle of screen after jumping
nnoremap n nzz
nnoremap } }zz
nnoremap { {zz
nnoremap <C-F> <C-F>zz
nnoremap <C-B> <C-B>zz

" dump all the swap files somewhere dark and out of the way
set directory=~/.vim/swap

" shameful mouse crutch
set mouse=a

" all hail the all powerful leader
" fast save
nnoremap <Leader>w :w<CR>


" key mappings for vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" jump to end of text you just pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" vsplit
nnoremap <Leader>v :vsplit<CR>
"split
nnoremap <Leader>s :split<CR>

" jedi-vim
let g:jedi#popup_on_dot = 1

" vim-slime
let g:slime_target = "tmux"
let b:slime_default_config = {"socket_name": "default"}
let g:slime_python_ipython = 1
nmap <c-c><c-l> <Plug>SlimeLineSend
vmap <c-c><c-l> <Plug>SlimeRegionSend
