call plug#begin()

filetype plugin on
set omnifunc=syntaxcomplete#Complete
" Navigation
set runtimepath^=~/.vim/bundle/ctrlp.vim 
let g:ctrlp_root_markers = ['.ctrlp', 'package.json', '.gitignore']
set wildignore+=*/node_modules/*,*/dist/*
" Basic setup
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamed
set completeopt-=preview
set hlsearch
set wildmenu
set relativenumber

set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ " Wrap-broken line prefix

" Folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Disabling arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Easier navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16'

set t_Co=256
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Syntax highlight
Plug 'janko-m/vim-test'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'raimondi/delimitmate' " Closing brackets
let g:delimitMate_expand_cr = 4
let g:delimitMate_expand_space = 4

Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'haya14busa/incsearch.vim' " Better search highlighting
Plug 'kshenoy/vim-signature' " For highlighting marks
Plug 'vim-scripts/matchit.zip' 

"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }

" Language Support
" JavaScript 
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'rhysd/npm-debug-log.vim'
Plug 'neovim/node-host',                  { 'do': 'npm install' }
Plug 'cdata/vim-tagged-template'

" TypeScript
Plug 'Shougo/denite.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

" Rust
Plug 'rust-lang/rust.vim'

" SCSS
au BufRead,BufNewFile *.css set filetype=scss

" Search
Plug 'brooth/far.vim'
let g:far#sources = {
    \   'ag': {
    \       'args': {
    \           'cmd': ['ag', '--nogroup', '--column', '--nocolor', '--silent',
    \                   '--max-count={limit}', '{pattern}',
    \                   '--file-search-regex={file_mask}',
    \                   '--ignore=node_modules']
    \       }}}
" Navigation
Plug 'easymotion/vim-easymotion'

" Project tree
Plug 'scrooloose/nerdtree'
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeHijackNetrw = 0

" GIT
Plug 'tpope/vim-fugitive'

" Eslint checking
Plug 'w0rp/ale'

" Async jobs
Plug 'skywind3000/asyncrun.vim'

" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Show screen on start
Plug 'mhinz/vim-startify'
let g:startify_session_persistence = 0

" Autosave
Plug 'sjl/vitality.vim'
au FocusLost * :wa

call plug#end()

syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_ut=                " fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html
if has("termguicolors")  " set true colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
set background=dark
colorscheme onehalfdark

" Section: Local-Machine Config

if filereadable($DOTFILES . "/nvim/init.local.vim")
  source $DOTFILES/nvim/init.local.vim
endif
