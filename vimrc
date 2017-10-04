" Use 256 colours
set t_Co=256
set backup
set backupdir=~/.vim/backup
set dir=~/.vim/backup

noremap ; :
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <up> <Nop>
inoremap <down> {
inoremap <left> <Nop>
inoremap <right> <Nop>

set clipboard=unnamedplus

set encoding=utf-8

set nocompatible              " be iMproved
filetype on
filetype plugin indent on
filetype indent on

call plug#begin('~/.vim/plugged')

Plug 'valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/openssl.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/matchit.zip'
Plug 'rking/ag.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Lokaltog/vim-distinguished'
Plug 'davidhalter/jedi-vim'
Plug 'rdnetto/YCM-Generator',{'branch': 'stable'}

call plug#end()

set backspace=indent,eol,start
set number
set ruler
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set background=dark


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
set showmode
syntax enable
colorscheme distinguished

" How many tenths of a second to blink when matching brackets
set mat=2

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

let mapleader=","

" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Paste settings
"map <F2> to do paste magic.
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

set lazyredraw          " redraw only when we need to.

" kj is escape
inoremap kj <esc>
inoremap jk <esc>
inoremap jx <esc>:x<CR>
inoremap jw <esc>:w<CR>

vnoremap <BS> <esc>

" move to beginning/end of line
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

"Motion over wrapped lines like normal editor.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

set fillchars=vert:│    " Nicer split separation character.

"Disable hlsearch on enter.
nnoremap <silent> <CR> :nohlsearch<CR><CR>

"Toggle spellcheck.
nnoremap <F7> :setlocal spell! spell?<CR>

"Format JSON
command -nargs=* JSON %!python -m json.tool <args>
vnoremap <leader>json !python -m json.tool<CR>

inoremap {<CR> {<CR>}<Esc>O

"Tab navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>

nnoremap <C-t>     :tabnew<CR>
nnoremap \l :set invnumber<CR>

nnoremap <leader>r Ouse Reply;Reply->new(config => "$ENV{HOME}/.replyrc")->run;<Esc>
nnoremap <leader>b koimport pdb;pdb.set_trace()<Esc>
cnoreabbrev ag Ag

"Avoid huge cost of traversing perl libs for completion.
autocmd FileType perl set complete-=i

nnoremap <space>/ :Ag<space>

nnoremap Y y$

"Don't want annoyance with subtracions
"set iskeyword+=-

nnoremap <leader>w :StripWhitespace<CR>:w<CR>

"zsh freaks out if this is on
"set shellcmdflag=-ic

let g:ctrlp_custom_ignore = {
    \ 'dir':  '/platforms',
    \ }

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab!
"Remove annoying smartindent resetting to start of line when first character in line is #
inoremap # X#

" Move to the previous buffer with "gp"
nnoremap gl :bp<CR>

" Move to the next buffer with "gn"
nnoremap gh :bn<CR>

" List all possible buffers with "gl"
nnoremap gs :ls<CR>

" List all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gd :ls<CR>:b

"nnoremap <leader>cp i#include <iostream><CR><CR>using namespace std;<CR><CR>int main() {<CR>return 0;<CR>}<Esc>kO
nnoremap <leader>pm o<Esc>Iif __name__=='__main__':<CR>

let g:syntastic_cpp_compiler_options = '-std=c++14 -I /home/svankina/.local/include -I headers'
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
let g:syntastic_c_include_dirs = ['/home/svankina/.local/include', '/home/svankina/.local/lib']

"Python readInts
inoremap <leader>rint [int(_i) for _i in  raw_input().strip().split()]

nnoremap <leader>v ^v$:Strikethrough<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:NERDCreateDefaultMappings = 0
nmap ,c <plug>NERDCommenterToggle
vmap ,c <plug>NERDCommenterToggle

let g:ycm_semantic_triggers = {
\  'tex'  : ['\ref{','\cite{'],
\ }
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

