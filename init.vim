" Basic settings ------ {{{
set nocompatible
set number relativenumber numberwidth=4
set sw=4 expandtab
set wrap
set shiftround
filetype on
set title
set foldlevelstart=0

let mapleader = "-"
let maplocalleader = "\\"
" }}}

" Plugins ----------- {{{
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
let g:NERDTreeWinSize=52
nnoremap <c-n> :NERDTreeToggle<CR>

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹ ",
    \ "Staged"    : "✚ ",
    \ "Untracked" : "✭ ",
    \ "Renamed"   : "➜ ",
    \ "Unmerged"  : "═ ",
    \ "Deleted"   : "✖ ",
    \ "Dirty"     : "✗ ",
    \ "Clean"     : "✔︎ ",
    \ 'Ignored'   : '☒ ',
    \ "Unknown"   : "? "
    \ }

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'Valloric/YouCompleteMe'

Plug 'airblade/vim-rooter'
call plug#end()
" }}}

" Leader mappings ---------- {{{
nnoremap <leader>d dd
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>vv :source $MYVIMRC<cr>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>l`>3l
" }}}

" Mappings ------- {{{
inoremap <c-d> <esc>ddi
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU
inoremap <c-l> <esc>viwui
nnoremap <c-l> viwu

inoremap jk <esc>
inoremap <c-a> <esc>:w<cr>

" Disable Arrow keys
inoremap <left> <nop>
nnoremap <left> <nop>
inoremap <right> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
nnoremap <up> <nop>
inoremap <down> <nop>
nnoremap <down> <nop>
" }}}

" Snippets (Abbreviations) ------ {{{
" iabbrev ccig <cr>someone<cr>someone@example.com
iabbrev rt return
" }}}

" Status line --------- {{{
set ls=2  " always show statusline
set statusline=%m        " Modified flag
set statusline+=%r       " ReadOnly flag
set statusline+=%h       " ReadOnly flag
set statusline+=%w       " ReadOnly flag
set statusline+=\ %n)    " ReadOnly flag
set statusline+=%t       " Filename (max-len 20)
set statusline+=%=       " Start from right
set statusline+=col:%c\  " Column number
set statusline+=%l       " Line No.
set statusline+=/        " Literal '/'
set statusline+=%L       " Total no. of lines
" }}}

" Code commenting mappings {{{
augroup comment
  autocmd!
  autocmd filetype c,cpp,javascript,java nnoremap <buffer> <localleader>c i//<esc>j
  autocmd filetype python nnoremap <buffer> <localleader>c i# <esc>
augroup END
" }}}

" Vimscript file settings ------------ {{{
augroup ft_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Java file settings ----------- {{{
augroup ft_java
  autocmd!
  autocmd filetype java :iabbrev <buffer> pr private
  autocmd FileType java :iabbrev <buffer> pb public
  autocmd FileType java :iabbrev <buffer> tc static
  autocmd FileType java :iabbrev <buffer> tr String
  autocmd FileType java :iabbrev <buffer> it Integer
  autocmd FileType java :iabbrev <buffer> lf Double
  autocmd FileType java :iabbrev <buffer> ln Long
augroup END
" }}}

" Javascript file settings ----------- {{{
augroup ft_js
  autocmd!
  "autocmd FileType javascript :iabbrev <buffer> fn function (<left>
augroup END
" }}}

" modify selected text using combining diacritics {{{
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

vnoremap - :Strikethrough<CR>
vnoremap _ :Underline<CR>
" }}}

" Java file settings ----------- {{{
" movement commands
""""""""""""""""""""""
" inside next paranthesis
onoremap in( :<c-u>normal! f(vi(<cr>

" inside last parenthesis
onoremap il( :<c-u>normal! F)vi(<cr>

" around next paranthesis
onoremap an( :<c-u>normal! f(va(<cr>

" around last parenthesis
onoremap al( :<c-u>normal! F)va(<cr>

" until the next occurance of "word"
" onoremap b /word<cr>

" inside next email address
onoremap in@ :<c-u>execute "normal! /[a-z]\\+[a-z0-9.]*[a-z0-9]\\+@\\a\\+\\.\\a\\{2,}\r:nohlsearch\rvt@lele"<cr>
" }}}

" Markdown file settings ----------- {{{
augroup ft_md
  autocmd!
  " Inside markdown heading
  onoremap <buffer> ih :<c-u>execute "normal! ?^[=-]\\{3,}$\r:nohlsearch\rkvg_"<cr>

  " Around markdown heading
  onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}
