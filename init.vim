set autochdir
set clipboard=unnamedplus
set colorcolumn=0
set completeopt=menuone,noinsert
set expandtab
set fileformat=unix
set fileformats=unix,dos
set foldmethod=manual
set nobackup
set noshowmode
set nowritebackup
"set wrap!
set number
set shiftwidth=2
set shortmess+=c
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set termguicolors
set t_vb=
set visualbell

syntax enable
filetype plugin on

autocmd FileType markdown setlocal spell complete+=kspell
autocmd FileType gitcommit setlocal spell complete+=kspell

" https://vi.stackexchange.com/a/1958
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap H :bp<cr>
nnoremap L :bn<cr>

nnoremap <leader><up> <C-w><up>
nnoremap <leader><down> <C-w><down>
nnoremap <leader><left> <C-w><left>
nnoremap <leader><right> <C-w><right>

nnoremap <leader>d "_d
xnoremap <leader>D "_D
xnoremap <leader>p "_dP
noremap Y 0vg_y

nnoremap <leader>cs :let @/ = ''<cr>
nnoremap <leader>cl :ccl<cr>

nnoremap <leader>b :Silent xdg-open %<cr>

tnoremap <Esc> <C-\><C-n>

function! Split()
  vsplit
endfunction

nnoremap <leader>bt :call Split()<cr>:term bash -l -i<cr>
nnoremap <leader>ps :call Split()<cr>:term pwsh.exe<cr>
nnoremap <leader>py :call Split()<cr>:term python3<cr>

vnoremap <leader>md :norm A\<cr>:%s/\\\n\\/\r<cr>

map <leader><tab> :NvimTreeToggle<CR>

autocmd BufEnter __run__,__doc__ :wincmd L
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ale config
nmap <silent> <PageDown> :ALENext<cr>
nmap <silent> <PageUp> :ALEPrevious<cr>

let g:ale_linters = {
  \'vim': [],
  \'javascript': ["eslint"],
  \'python': ["pylint", "mypy"],
  \'rust': ["cargo"],
  \'go': ["govet", "staticcheck"]
\}

let g:ale_fixers = {
  \'javascript': ["prettier", "eslint"],
  \'python': ["isort", "black"],
  \'rust': ["rustfmt"],
  \'go': ["gofmt"],
  \'json': ["jq"],
\}

let g:ale_javascript_eslint_executable = 'eslint_d --cache'

"let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
" end ale config

" coc.nvim config
" extensions: coc-pairs coc-rust-analyzer coc-pyright coc-go 

inoremap <silent><expr> <cr> pumvisible()
  \? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" end coc.nvim config

" supertab config
let g:SuperTabDefaultCompletionType = "context"
" end supertab config

call plug#begin(stdpath('data') . '/plugged')

" Languages
Plug 'gabrielelana/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" UI
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'alvan/vim-closetag'
Plug 'ervandew/supertab'

" Git
Plug 'tpope/vim-fugitive'

" themes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'cocopon/iceberg.vim'

call plug#end()

let g:lightline = {
  \'separator': {'left': "\ue0b0", "right": "\ue0b2"},
  \'subseparator': {'left': "\ue0b1", 'right': "\ue0b3"},
\}

let g:tokyonight_style = 'night'
let g:lightline.colorscheme = 'tokyonight'
colorscheme tokyonight

"colorscheme iceberg
"let g:lightline.colorscheme = 'iceberg'

lua << EOF
require 'nvim-tree'.setup {
  open_on_setup = true,
  view = {
    width = 30,
    auto_resize = true
  }
}
EOF
