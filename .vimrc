" Pathogen
filetype off " Pathogen needs to run before plugin indent on
call pathogen#infect('bundle/{}')
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on

" Make backspace sane
set backspace=2

" Colors
colorscheme manxome
syntax on
hi StatusLine ctermfg=white ctermbg=blue
hi StatusLineNC ctermfg=black ctermbg=white

" Leader
let mapleader=" "

" EasyMotion
map <Leader> <Plug>(easymotion-prefix)

" NERDTree
map <silent> <Leader>n :NERDTreeToggle<CR>

" Tabs
set expandtab
set tabstop=4
set shiftwidth=4

" Search
set incsearch
set ignorecase
set smartcase

" Line numbering
set nu

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<CR>

" File name completion
set wildmenu

" Spell checking
set nospell

" Status line stuff
set laststatus=2
set statusline=%m\ %f\ [%n]\ %Y%=\ (%l,\ %c)\ %P

" Mappings
filetype plugin indent on

" Windows
set fillchars+=vert:\ 

let g:C_Ctrl_j = 'off'
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup --column'
let g:unite_source_grep_recursive_opt = ''
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<CR>
nnoremap <C-p> :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<CR>
nnoremap <space>/ :Unite grep:!<CR>

let g:unite_force_overwrite_statusline = 0

" vim-powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set noshowmode

" syntastic
let g:syntastic_python_pylint_args = '--rcfile=~/Monetate/monetate-server/pylintrc'

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" gundo
nnoremap <Leader>u :GundoToggle<CR>
