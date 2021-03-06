
set colorcolumn=0 tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab number splitbelow splitright foldclose=all visualbell t_vb= termguicolors autochdir
set background=dark

set fileformat=unix
set fileformats=unix,dos

autocmd BufEnter __run__,__doc__ :wincmd L

autocmd InsertLeave * if pumvisible() == 0|pclose|endif

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap H gT
nnoremap L gt
nnoremap <leader>h :tabm -1<cr>
nnoremap <leader>l :tabm +1<cr>

nnoremap <leader><up> <C-w><up>
nnoremap <leader><down> <C-w><down>
nnoremap <leader><left> <C-w><left>
nnoremap <leader><right> <C-w><right>

nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

nnoremap <leader>cs :let @/ = ""<cr>
nnoremap <leader>cl :ccl<cr>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['mypy', 'flake8']
let g:syntastic_python_mypy_args = "--ignore-missing-imports"
let g:syntastic_python_flake8_args = "--ignore=E501"

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>pt :tabnew<cr>:terminal python3<cr>
nnoremap <leader>bt :tabnew<cr>:terminal bash -l -i<cr>
vnoremap <leader>md :norm A\<cr>:%s/\\\n\\/\r<cr>

autocmd BufWritePre *.py :Black

call plug#begin('~/.vim/plugged')

" Python
Plug 'psf/black', { 'tag': '*' }

" Other languages
Plug 'gabrielelana/vim-markdown'
Plug 'sheerun/vim-polyglot'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'elzr/vim-json'
Plug 'vim-syntastic/syntastic'

" UI
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-capslock'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" themes
"Plug 'joshdick/onedark.vim'
"Plug 'tyrannicaltoucan/vim-deep-space'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'jmoggee/mirage.vim'
Plug 'cocopon/iceberg.vim'

call plug#end()

" onedark
"let g:lightline = {'colorscheme': 'onedark'}
"colorscheme onedark

" deepspace
"let g:lightline = {'colorscheme': 'deepspace'}
"colorscheme deep-space

" papercolor
"set background=light
"let g:lightline = {'colorscheme': 'PaperColor'}
"colorscheme PaperColor

" mirage
"colorscheme mirage

" iceberg
let g:lightline = {'colorscheme': 'iceberg'}
colorscheme iceberg
