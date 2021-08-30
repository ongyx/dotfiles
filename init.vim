set autochdir
set background=dark
set colorcolumn=0
set completeopt=longest,menuone
set expandtab
set fileformat=unix
set fileformats=unix,dos
set foldclose=all
set number
set shiftwidth=4
set smarttab
set softtabstop=0
set splitbelow
set splitright
set tabstop=8
set termguicolors
set t_vb=
set visualbell

syntax enable
filetype plugin indent on

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
xnoremap <leader>D "_D
xnoremap <leader>p "_dP
noremap Y 0vg_y

nnoremap <leader>cs :let @/ = ""<cr>
nnoremap <leader>cl :ccl<cr>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["go"] }

let g:syntastic_python_checkers = ['mypy', 'flake8']
let g:syntastic_python_mypy_args = "--ignore-missing-imports"
let g:syntastic_python_flake8_args = "--ignore=E501"

let g:go_highlight_fields = 1
let g:go_auto_type_info = 1

" Autocomplete if the cursor is not in a commented line.
function Complete()
    let hg = join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'))
    if hg =~ 'comment'
        return '.<C-x><C-o>'
    endif

    return '.'
endfunction

au filetype go inoremap <buffer><expr> . Complete()
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>pt :tabnew<cr>:terminal python3<cr>
nnoremap <leader>bt :tabnew<cr>:terminal bash -l -i<cr>
vnoremap <leader>md :norm A\<cr>:%s/\\\n\\/\r<cr>

autocmd BufEnter __run__,__doc__ :wincmd L
autocmd BufWritePost *.py :Black
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd VimEnter * NERDTree | wincmd p
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

call plug#begin(stdpath('data') . '/plugged')

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
Plug 'ervandew/supertab'
Plug 'preservim/nerdtree'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" themes
"Plug 'joshdick/onedark.vim'
"Plug 'tyrannicaltoucan/vim-deep-space'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'jmoggee/mirage.vim'
Plug 'cocopon/iceberg.vim'
Plug 'sainnhe/sonokai'

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

" sonokai
"let g:sonokai_style = 'andromeda'
"colorscheme sonokai
