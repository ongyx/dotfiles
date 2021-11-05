set autochdir
set clipboard=unnamedplus
set colorcolumn=0
set completeopt=menu,preview
set expandtab
set fileformat=unix
set fileformats=unix,dos
set foldclose=all
set nobackup
set noshowmode
set nowritebackup
set number
set shiftwidth=2
set shortmess+=c
set smarttab
set splitbelow
set splitright
set tabstop=2
set termguicolors
set t_vb=
set visualbell

syntax enable
filetype plugin on

" https://vi.stackexchange.com/a/1958
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'

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

nnoremap <leader>b :Silent xdg-open %<cr>

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>pt :tabnew<cr>:terminal python3<cr>
nnoremap <leader>bt :tabnew<cr>:terminal bash -l -i<cr>
vnoremap <leader>md :norm A\<cr>:%s/\\\n\\/\r<cr>

map <F2> :NvimTreeToggle<CR>

autocmd BufEnter __run__,__doc__ :wincmd L
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"ale config
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \'python': ['black', 'isort'],
\}
" end ale config

" coc config
let g:coc_user_config = { 
  \'diagnostic.displayByAle': 1,
  \'coc.preferences.formatOnType': 1,
  \'coc.preferences.formatOnSaveFiletypes': ['python', 'go', 'html'],
\}

inoremap <silent><expr> <TAB>
  \pumvisible() ? "\<C-n>" :
  \<SID>check_back_space() ? "\<TAB>" :
  \coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" end coc config

call plug#begin(stdpath('data') . '/plugged')

" Python
Plug 'psf/black', { 'tag': '*' }

" Other languages
Plug 'gabrielelana/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json'
Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'

" UI
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-capslock'
Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" themes
Plug 'samflores/vim-colors-paramount', {'branch': 'lightline-colorscheme'} 
"Plug 'dylanaraps/ryuuko'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'kyazdani42/blue-moon'

call plug#end()

"let g:lightline = {'colorscheme': 'paramount'}
"colorscheme paramount

"let g:lightline = {}
"colorscheme ryuuko

let g:tokyonight_style = "night"
let g:lightline = {'colorscheme': 'tokyonight'}
colorscheme tokyonight

"colorscheme blue-moon
"let g:lightline = {'colorscheme': 'blue-moon'}

let g:lightline.separator = {'left': "\ue0b0", 'right': "\ue0b2"}
let g:lightline.subseparator = {'left': "\ue0b1", 'right': "\ue0b3"}

let g:lightline.component_expand = {
  \'linter_checking': 'lightline#ale#checking',
  \'linter_infos': 'lightline#ale#infos',
  \'linter_warnings': 'lightline#ale#warnings',
  \'linter_errors': 'lightline#ale#errors',
  \'linter_ok': 'lightline#ale#ok',
\}
let g:lightline.component_type = {
  \'linter_checking': 'right',
  \'linter_infos': 'right',
  \'linter_warnings': 'warning',
  \'linter_errors': 'error',
  \'linter_ok': 'right',
\}
let g:lightline.active = {
  \'right': [
    \['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
    \['lineinfo'],
    \['percent'],
    \['fileformat', 'fileencoding', 'filetype']
  \]
\}

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

lua << EOF
require 'nvim-tree'.setup()
EOF
