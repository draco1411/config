"              
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
set nocompatible
set noerrorbells "Takes out the error bells"
set tabstop=4 softtabstop=4 "sets the tabs to 4 chars long, and 4 spaces long"
set shiftwidth=4 expandtab
set scrolloff=8
set autoindent smartindent
set nu rnu "sets absolute line numbers"
set noswapfile "Takes out all the swap files"   
set undodir=/.vim/undodir 
set undofile
set incsearch
set spell spelllang=en_us
set colorcolumn=140 "This is exact for my screen"
set backspace=indent,eol,start "Gives sane editing properties"
set laststatus=2
set syntax=on
set nolist
set t_Co=256
set termguicolors

set foldcolumn=1 "Shows where folds are"
set statusline+=%{foldlevel('.')} "Shows fold depth on status line"

set tw=134
set formatoptions+=t

" sane text files
set fileformat=unix encoding=utf-8 fileencoding=utf-8

filetype plugin on 
syntax enable
set path+=** wildmenu
setglobal complete-=i

let mapleader = ","
"Letters currently used: "
"a, c, f, l, m, p, s, z"

"Find and replace (add /g for global)"
noremap <leader>, :%s/

"Spelling corrector"
noremap <leader>s [s1z=`]a

"Compiles/runs LaTeX, Python, C++"
noremap <leader>l :! clear; pdflatex %
noremap <leader>p :! clear; python3 % 
noremap <leader>c :! clear; clang++ -std=c++11 % -o %:r.out 
noremap <leader>r :! clear; ./%:r.out

"Opens NERDTree's menu
noremap <leader>m :NERDTreeToggle <CR>

"Makes a session that can be loaded with vim -S session.vim"
noremap <leader>z :wa \| :mksession! session.vim \| :qa <CR>

"Auto complete"
inoremap <leader>f <C-x><C-n>

highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin("~/.vim/plugged")

"Adds nice theme"
Plug 'morhetz/gruvbox' 

"nerdTree"
Plug 'scrooloose/nerdtree'

"Adds a viewable undotree w/ :UndotreeToggle"
Plug 'mbbill/undotree'

"Snippets" 
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger=''
let g:UltiSnipsSnippetDirectories=["/Users/jackbrolin/.vim/snippets", "UltiSnips"]
let g:UltiSnipsEditSplit="vertical"


"vim-tex"
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let conceallevel=1
let g:tex_conceal='abdmg'

"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'hdima/python-syntax'
let python_highlight_all = 1

Plug 'bfrg/vim-cpp-modern'
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1


call plug#end()

colorscheme retrobox
set background=dark

"Folds business"
" augroup remember_folds
"     autocmd!
"     autocmd BufWinLeave * mkview
"     autocmd BufWinEnter * silent! loadview
" augroup END

"Clear the registers"
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
