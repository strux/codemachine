"=========================
" Vundle Plugins
"=========================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'bling/vim-airline'
  Plugin 'tpope/vim-fugitive'
  Plugin 'kien/ctrlp.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-surround'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'rking/ag.vim'
call vundle#end()            " required
filetype plugin indent on    " required

set number
set ts=2 sts=2 sw=2 expandtab
set visualbell
set splitright
set hlsearch
set incsearch
set ignorecase " ignore case in search
set diffopt=vertical
set modelines=1
set laststatus=2 " required for airline
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set list
set listchars=tab:▸\ ,trail:.
set spell spelllang=en_us

syntax enable
set background=dark
" might need
" let g:solarized_termcolors=16
silent! colorscheme solarized

"=========================
" Mappings & Configs
"=========================
let mapleader = ","

"-------------------------
" vim
"-------------------------
nmap <leader>v :tabedit ~/.vimrc<CR>
nmap <leader>n :set invnumber<CR>
map <Leader>j :join<CR>
map <leader>p <ESC>:set paste!<CR>

"-------------------------
" Bash
"-------------------------
map <Leader>b <ESC>:w<CR>:!bash "%"<CR>

"-------------------------
" Ruby
"-------------------------
map <Leader>r <ESC>:w<CR>:!ruby "%"<CR>

"-------------------------
" NERDTree
"-------------------------
let NERDTreeIgnore = ['\.DS_Store', '\.idea', '\.git']
map <Leader>d :NERDTreeToggle<CR>

"-------------------------
" Fugitive
"-------------------------
map <leader>gs <ESC>:Gstatus<CR>
map <leader>gd <ESC>:Gdiff<CR>
map <leader>gc <ESC>:Gcommit<CR>
map <leader>gb <ESC>:Gblame<CR>
map <leader>gl <ESC>:Glog<CR>
map <leader>gp <ESC>:Git push<CR>
map <leader>gw <ESC>:Gwrite<CR>

"-------------------------
" Auto-complete
"-------------------------
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1


"-------------------------
" Ag
"-------------------------
map <Leader>f <ESC>:tabnew<CR>:Ag 
map <Leader>F <ESC>:Ag 

"-------------------------
" Tabs and Windows
"-------------------------
" Tabs
map <C-l> gt
map <C-h> gT
map <C-n> <Esc>:tabnew<CR>

" Windows
map <S-k> <C-w><Up>
map <S-j> <C-w><Down>
map <S-h> <C-w><Left>
map <S-l> <C-w><Right>

" Window sizing with ALT+hjkl
map ¬ :vertical resize +5<CR>
map ˙ :vertical resize -5<CR>
map ˚ :resize +5<CR>
map ∆ :resize -5<CR>

"=========================
" Auto reload .vimrc
"=========================
if has('autocmd')
  " Source .vimrc when I write it.  The nested keyword allows
  " autocommand ColorScheme to fire when sourcing ~/.vimrc.
  au! BufWritePost .vimrc nested source %
endif

