" Absolute Basics
set nocompatible
set number relativenumber
syntax on
set ruler
set visualbell
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Habit Reinforcement
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"" Remember cursor position
augroup vimrc-remember-cursor-position
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
