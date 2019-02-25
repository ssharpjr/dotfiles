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
" Other Syntax Plugins
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'lervag/vimtex'
" Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'mboughaba/i3config.vim'
" Color Theme Plugins
Plugin 'arcticicestudio/nord-vim'
Plugin 'morhetz/gruvbox'
" Prose Plugins
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Color Theme Settings
set background=dark
colorscheme nord
let g:airline_theme='nord'
set laststatus=2
let g:airline_powerline_fonts = 1

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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
let localleader = '\\'  " LocalLeader is \

" Folding
nnoremap <Space> za

" jk is escape
inoremap jk <esc>

" Shortcut to Edit .vmirc
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Execute python
nnoremap <F9> <Esc>:w<CR>:!clear;python %<CR> 

" Spellcheck
map <leader>sc :setlocal spell! spelllang=en_us<CR>

" LaTeX
" let g:livepreview_previewer = 'zathura'
" let g:livepreview_cursorhold_recompile = 0
" map <leader>ll :LLPStartPreview<CR>
" LaTeX word count
map <F3> :w !detex \| wc -w<CR>
" Paragraph navigation
noremap j gj
noremap k gk

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
if has("autocmd")
  filetype plugin indent on
endif
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1
let vim_markdown_preview_use_xdg_open=1

" split navigations
set splitright splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c41
vnoremap <leader><leader> <Esc>/<++><Enter>"_c41
map <leader><leader> <Esc>/<++><Enter>"_c41

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

