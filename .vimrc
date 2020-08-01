set nocompatible              " required
filetype plugin indent on  " required
filetype plugin on


" *** PLUGINS ***

" Plugin Manager
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/Ultisnips'
Plug 'vimwiki/vimwiki'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git Plugins
Plug 'tpope/vim-fugitive'

" Python Plugins
" Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'

" Frontend Plugins
Plug 'pangloss/vim-javascript'
" Plug 'othree/html5.vim'
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'othree/xml.vim'

" Other Syntax Plugins
Plug 'glench/vim-jinja2-syntax'
" Plug 'nelstrom/vim-markdown-folding'
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'lervag/vimtex'
Plug 'mboughaba/i3config.vim'

" Color Theme Plugins
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'

" Prose Plugins
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required


" *** CONFIGURATION ***

" REMAPS
let mapleader = ","  " Leader is comma
let localleader = '\\'  " LocalLeader is \

" jk is escape
inoremap jk <esc>

" Quick Insert Mode Commands
"inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>o
"inoremap CC <Esc>C
"inoremap SS <Esc>S
"inoremap DD <Esc>dd
"inoremap UU <Esc>u

" Paragraph navigation
noremap j gj
noremap k gk

" Shortcut to Edit .vmirc
nnoremap <leader>ev :vsp $MYVIMRC<CR>

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Relative numbers
set number relativenumber

set pastetoggle=<F5>  " Paste without indent issues
" set mouse=a
set encoding=utf-8
set splitbelow
set splitright
set clipboard=unnamedplus

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']  " ignore files

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Buffers and Windows
set hidden
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
" nmap <leader>bl :ls<CR>

" Buffergator
let g:buffergator_viewport_split_policy = 'R'
let g:buffergator_suppress_keymaps = 1
nmap <leader>jj :BuffergatorMruCyclePrev<CR>
nmap <leader>kk :BuffergatorMruCycleNext<CR>
nmap <leader>bl :BuffergatorOpen<CR>

" fzf.vim
map <c-p> :FZF<CR>

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_list = [{
	\ 'path': '~/vimwiki',
	\ 'template_path': '~/vimwiki/templates/',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/vimwiki/site_html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
	\ 'template_ext': '.tpl'}]

" Folding
" let g:vim_markdown_folding_disabled=1
" nnoremap <Space> za

" Python stuff
let python_highlight_all=1
syntax on
nnoremap <F9> <Esc>:w<CR>:!clear;python %<CR> 

" Spellcheck
map <leader>sc :setlocal spell! spelllang=en_us<CR>

" Toggle indentations
nnoremap <F8> :setl noai nocin nosi inde=<CR>

" LaTeX
" LaTeX word count
map <F3> :w !detex \| wc -w<CR>
let g:tex_flavor = 'latex'

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
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_open_to_the_world = 1
map <localleader>md :InstantMarkdownPreview<CR>

" split navigations
set splitright splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Split Resizing
" <C-w>= will center horizontal splits
" <C-w>_ will max size a horizontal window
" <C-w>| will max size a vertical window
" <C-w>R will swap 2 splits
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

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
    autocmd BufEnter *.c setlocal tabstop=4
    autocmd BufEnter *.c setlocal shiftwidth=4
    autocmd BufEnter *.c setlocal softtabstop=4
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.txt setlocal wrap
    autocmd BufEnter *.txt setlocal linebreak
    " autocmd BufEnter *.txt setlocal spell spelllang=en_us
    autocmd BufEnter *.md setlocal wrap
    autocmd BufEnter *.md setlocal linebreak
    autocmd BufEnter *.md setlocal spell spelllang=en_us
    autocmd BufEnter *.tex setlocal wrap
    autocmd BufEnter *.tex setlocal linebreak
    autocmd BufEnter *.tex setlocal spell spelllang=en_us
    autocmd BufEnter *.tex setlocal noai nocin nosi inde=
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
    autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
augroup END

