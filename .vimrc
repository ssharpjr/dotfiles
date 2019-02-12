set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Git Plugins
Plugin 'tpope/vim-fugitive'
" Python Plugins
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
" Frontend Plugins
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/xml.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
" Other Syntax Plugins
Plugin 'mboughaba/i3config.vim'
" Color Theme Plugins
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Color Theme Setting
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold='1'
let g:gruvbox_underline='1'
let g:airline_theme='gruvbox'
set laststatus=2
let g:airline_powerline_fonts = 1

" Relative numbers
set number relativenumber

let python_highlight_all=1
syntax on
set pastetoggle=<F5>  " Paste without indent issues
" set mouse=a
set encoding=utf-8
set splitbelow
set splitright
set clipboard=unnamedplus

" REMAPS
let mapleader = ","  " Leader is comma

" Shortcut to Edit .vmirc
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Execute python
nnoremap <F9> <Esc>:w<CR>:!clear;python %<CR> 

" jk is escape
inoremap jk <esc>

" Markdown Preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_toggle=1

" split navigations
set splitright splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Python with Virtualenv Support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate = os.path.join(project_base_dir, 'bin/activate')
    execfile(activate, dict(__file__=activate))
EOF

" Backup Settings
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Tmux cursor change
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Autogroups
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    " autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
    "     \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

