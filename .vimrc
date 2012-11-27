" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Plugin management
call pathogen#infect()

" Better paste
set pastetoggle=<F2>

" Code folding
set foldmethod=indent
set foldlevel=99

let mapleader = ","

" Quick save command
noremap <Leader>s :update<CR>

" Quick exit command
noremap <Leader>q :quit<CR>

" Move around windows with ctrl-{h,j,k,l}
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" The Smash Escape
inoremap jk <Esc>
inoremap kj <Esc>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Toggle search highlight
noremap <Leader>v :set hlsearch! hlsearch?<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>

" Nerd tree toggle
"map <Leader>t <esc>:NERDTreeToggle<CR>
let NERDTreeWinSize = 35 
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swp$', '\~$']

" Tagbar toggle command
nmap <Leader>c :TagbarToggle<CR>
let g:tagbar_left=1


map <Leader>f :NERDTreeToggle<CR> 

" Idea style sidebar
function! NerdTags()
    TagbarOpen
    NERDTree
    wincmd J
    resize 30
    wincmd k
    wincmd l
    wincmd L
    wincmd h
    exe 'vertical resize ' . g:NERDTreeWinSize
    wincmd l
endfunction

map <Leader>t :tabnew .<CR>

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Slime setup for tmux
let g:slime_target = "tmux"
let g:slime_python_ipython = "true"

" Solarized colors
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
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

" ============================================================================
" Python IDE Setup
" ============================================================================

" IPython setup
map <Leader>i :IPython<CR>
nmap <Leader>e :python dedent_run_this_line()<CR>
vmap <Leader>e :python dedent_run_these_lines()<CR>
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc']
imap <Leader><tab> <C-x><C-u>
" Settings for vim-powerline
set nocompatible
set laststatus=2
" let g:Powerline_symbols = 'ascii'

" Settings for python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
     if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
     endif
     return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
set nofoldenable
