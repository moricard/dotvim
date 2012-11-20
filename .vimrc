" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Plugin management
call pathogen#infect()

" Better paste
set pastetoggle=<F2>
set clipboard=unname

" Code folding
set foldmethod=indent
set foldlevel=99

let mapleader = ","

" Quick save command
noremap <Leader>s :update<CR>

" Quick exit command
noremap <Leader>q :quit<CR>

" Tagbar toggle command
nmap <Leader>c :TagbarToggle<CR>

" Move around windows with ctrl-{h,j,k,l}
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" The Smash Escape
inoremap jk <Esc>
inoremap kj <Esc>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" new tab
map <C-t> <Esc>:tabnew<CR>
map <Leader>f <Esc>:tabf 

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" Nerd tree toggle
map <Leader>t <esc>:NERDTreeToggle<CR>

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Slime setup for tmux
let g:slime_target = "tmux"
let g:slime_python_ipython = "true"

" Solarized colors
set background=dark
colorscheme  solarized

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing 
set colorcolumn=80
highlight ColorColumn ctermbg=000

" Real programmers don't use TABs but spaces
set tabstop=8
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
