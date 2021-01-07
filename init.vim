
set colorcolumn=0 tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab number splitbelow splitright foldclose=all autochdir

autocmd BufEnter __run__,__doc__ :wincmd L

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap H gT
nnoremap L gt

nnoremap <leader>pt :tabnew<cr>:terminal python<cr>
nnoremap <leader>bt :tabnew<cr>:terminal \%USERPROFILE\%/scoop/apps/git/current/usr/bin/bash.exe -l -i<cr>
autocmd BufWritePre *.py :Black

let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_options_max_line_length = 88
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_on_write = 1

call plug#begin(stdpath('data') . '/plugged')

" Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'ambv/black'
Plug 'integralist/vim-mypy'

" Other languages
Plug 'gabrielelana/vim-markdown'
Plug 'sheerun/vim-polyglot'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'elzr/vim-json'

" Git/UI
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" themes
"Plug 'ghifarit53/tokyonight-vim'
Plug 'arcticicestudio/nord-vim'
"Plug 'lifepillar/vim-solarized8'

call plug#end()

set termguicolors

" tokyo night (ocean)
"let g:tokyonight_style = 'storm'
"let g:tokyonight_enable_italic = 1
"let g:lightline = {'colorscheme' : 'tokyonight'}
"colorscheme tokyonight

" nord
let g:lightline = {'colorscheme' : 'nord'}
colorscheme nord

" solarized
"set background=dark
"let g:lightline = {'colorscheme': 'solarized'}
"colorscheme solarized8

" go to projects
cd ~\Desktop\projects
