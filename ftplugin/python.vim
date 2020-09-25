" Toggle line numbers and fold column for easy copying:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

"taglist stuff
"http://www.vim.org/scripts/script.php?script_id=273
"http://dancingpenguinsoflight.com/2009/02/code-navigation-completion-snippets-in-vim/
" Taglist variables
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

" Execute file being edited with <F5>:
map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>

" gist stuff http://www.vim.org/scripts/script.php?script_id=2423

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Make sure columnwidth takes into account line numbers used
" let &columns = float2nr(log10(line("$"))) + 82

set colorcolumn=80
