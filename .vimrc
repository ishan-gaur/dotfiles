let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" TODO add the comment thing
call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'

" Not working
" Plug 'airblade/vim-gitgutter' " Not working for some reason

" Wishlist
" Plug 'ycm-core/YouCompleteMe'
" Plug 'ervandew/supertab'
" Plug 'junegunn/fzf.vim'
" Plug 'raimondi/delimitmate'
" Plug 'junegunn/vim-easy-align'
" 'janko-m/vim-test'
call plug#end()

" Turn on syntax highlighting
syntax on

" Show line numbers
:set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Show file stats
set ruler

" Blink cursor on error instead of beeping
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set expandtab

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Remap jj to exit insert mode
inoremap jj <Esc>:w<CR>

" Disable arrow keys in insert mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Color Scheme
set termguicolors
if strftime("%H") > 6 && strftime("%H") < 18
  autocmd vimenter * ++nested colorscheme gruvbox
  let g:gruvbox_contrast_light = 'medium'
  set background=light
else
  let g:material_theme_style = 'ocean'
  let g:airline_theme = 'material'
  colorscheme material
  set background=dark
endif

" Tagbar
nmap <F8> :TagbarToggle<CR>
