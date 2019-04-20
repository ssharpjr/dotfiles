set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
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
" Plugin 'nelstrom/vim-markdown-folding'
Plugin 'suan/vim-instant-markdown.git'
" Plugin 'JamshedVesuna/vim-markdown-preview'
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

" Nord Color Theme Overrides
augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight Comment ctermfg=8
augroup END

" Color Theme Settings
set background=dark
colorscheme nord
" Airline
let g:airline_theme='nord'
set laststatus=2
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Goyo/Limelight
let g:limelight_conceal_ctermfg = 'gray'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
map <localleader>g :Goyo<CR>:<Esc><Esc>

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

" Buffers and Windows
set hidden
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
" nmap <leader>bl :ls<CR>
" CtrlP
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<CR>
nmap <leader>bb :CtrlPBuffer<CR>
nmap <leader>bm :CtrlPMixed<CR>
nmap <leader>bs :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Buffergator
let g:buffergator_viewport_split_policy = 'R'
let g:buffergator_suppress_keymaps = 1
nmap <leader>jj :BuffergatorMruCyclePrev<CR>
nmap <leader>kk :BuffergatorMruCycleNext<CR>
nmap <leader>bl :BuffergatorOpen<CR>

" Folding
let g:vim_markdown_folding_disabled=1
nnoremap <Space> za

" jk is escape
inoremap jk <esc>

" Quick Insert Mode Commands
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>o
inoremap CC <Esc>C
inoremap SS <Esc>S
inoremap DD <Esc>dd
inoremap UU <Esc>u

" Shortcut to Edit .vmirc
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Execute python
nnoremap <F9> <Esc>:w<CR>:!clear;python %<CR> 

" Spellcheck
map <leader>sc :setlocal spell! spelllang=en_us<CR>

" LaTeX
" LaTeX word count
map <F3> :w !detex \| wc -w<CR>

" Paragraph navigation
noremap j gj
noremap k gk
" Replace all double spaces with single spaces
" noremap <localleader>ss :s/ \{2,}/ /g<CR>
noremap <localleader>ss :g/ \+/s// /g<CR>

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
if has("autocmd")
  filetype plugin indent on
endif
" vim-instant-markdown (:InstantMarkdownPreview)
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
map <localleader>md :InstantMarkdownPreview<CR>
" vim-markdown-preview (C-m)
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
    autocmd BufEnter *.txt setlocal wrap
    autocmd BufEnter *.txt setlocal linebreak
    autocmd BufEnter *.txt setlocal spell spelllang=en_us
    autocmd BufEnter *.md setlocal wrap
    autocmd BufEnter *.md setlocal linebreak
    autocmd BufEnter *.md setlocal spell spelllang=en_us
    autocmd BufEnter *.tex setlocal wrap
    autocmd BufEnter *.tex setlocal linebreak
    autocmd BufEnter *.tex setlocal spell spelllang=en_us
augroup END

