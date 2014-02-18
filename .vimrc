" Use 256 colours
set t_Co=256

noremap ; :
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
imap <up> <Nop>
imap <down> <Nop>
imap <left> <Nop>
imap <right> <Nop>

set clipboard=unnamedplus

set encoding=utf-8

set nocompatible              " be iMproved
filetype on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'rking/ag.vim'


filetype plugin indent on

set backspace=indent,eol,start

set number
set ruler
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4


" Statusline
" https://github.com/pengwynn/dotfiles/blob/master/vim/vimrc.symlink#L160
set statusline=                                     " Override default
set statusline+=%1*%{fugitive#statusline()[4:-2]}%* " Show fugitive git info
set statusline+=%2*\ %f\ %m\ %r%*                   " Show filename/path
set statusline+=%3*%=%*                             " Set right-side status info after this line
set statusline+=%4*%l/%L:%v%*                       " Set <line number>/<total lines>:<column>
set statusline+=%5*\ %*                             " Set ending space


set hlsearch
set incsearch
set showcmd
set modeline


" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

syntax enable
set background=dark
colorscheme distinguished 

let mapleader=","

" Powerline
set rtp+=/home/svankina/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2

" Visual indentantion selection remains after indent
vnoremap > >gv
vnoremap < <gv

" Paste settings
"nnoremap <F2> to do paste magic. 
nmap <F2> :set paste<CR>i
imap <F2> <ESC>:set paste<CR>i<Right>
au InsertLeave * set nopaste


" More natural splitting
set splitbelow
set splitright

" Map space to insert single character
nmap <Space> i_<Esc>r

"Better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Overline underline and strikethrough
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  "execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]\%V/&'.char.'/ge'
endfunction

vnoremap ol :Overline<CR>
vnoremap ul :Underline<CR>
vnoremap dul :DoubleUnderline<CR>
vnoremap st :Strikethrough<CR>

nnoremap <silent> <C-X> :NERDTreeToggle<CR>
nnoremap <Tab> <C-W><C-W>

nmap <F8> :TagbarToggle<CR>

"Easy motion mapped to leader.
map <Leader> <Plug>(easymotion-prefix)

set lazyredraw          " redraw only when we need to.

" jk is escape
inoremap jk <esc>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" edit and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"Motion over wrapped lines like normal editor.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

set fillchars=vert:│    " that's a vertical box-drawing character"

