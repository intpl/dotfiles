set nocompatible
set encoding=utf-8
filetype plugin indent on
syntax on

"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

if has("autocmd")
  filetype plugin indent on
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

:set tabstop=2
:set shiftwidth=2
:set expandtab

set path=$PWD/**

if &shell =~# 'fish$'
      set shell=bash
    endif

:noremap <C-P> @:<CR>

" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

set autoindent
set number
highlight LineNr ctermfg=5

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

set pastetoggle=<F2>

noremap <F9> gT
noremap <F10> gt

:set incsearch
:set hlsearch
nmap <silent> <BS> :nohlsearch<CR>

filetype off                  " required

nmap <space> zz
nmap n nzz
nmap N Nzz

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-rails'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "ctrlpvim/ctrlp.vim"
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle "honza/vim-snippets"
Bundle 'KurtPreston/vim-autoformat-rails'
"Bundle 'bling/vim-airline'
"Bundle 'vim-airline/vim-airline-themes'
Bundle 'sukima/xmledit'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'airblade/vim-gitgutter'
Bundle 'myusuf3/numbers.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'
Bundle 'gregsexton/MatchTag'
Bundle "pangloss/vim-javascript"
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'othree/javascript-libraries-syntax.vim'
"Bundle 'scrooloose/syntastic'
"Bundle 'matthewsimo/angular-vim-snippets'
"Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
"Bundle 'nelstrom/vim-markdown-folding'
"Bundle 'bruno-/vim-ruby-fold'
"Bundle 'godlygeek/tabular'
"Bundle 'plasticboy/vim-markdown'
Bundle 'rking/ag.vim'
Bundle 'tmhedberg/matchit'
"Bundle 'fatih/vim-go'
Bundle 'elixir-lang/vim-elixir'
Bundle 'mxw/vim-jsx'
Bundle 'christoomey/vim-tmux-navigator'
" Bundle 'ryanoasis/vim-devicons'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'isRuslan/vim-es6'

" Themes below
Bundle 'sjl/badwolf'
Bundle 'wellsjo/wells-colorscheme.vim'
Bundle 'ajgrf/sprinkles'
Bundle 'stulzer/heroku-colorscheme'
Bundle 'CruizeMissile/Revolution.vim'
Bundle 'whatyouhide/vim-gotham'
Bundle 'farseer90718/flattr.vim'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/BusyBee'
Bundle 'gregsexton/Muon'
Bundle 'desert-warm-256'
Bundle 'flazz/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'aliou/moriarty.vim'
" Themes above

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_ruby_checkers          = ['rubocop']
" let g:syntastic_ruby_rubocop_exec      = '/home/b/.rvm/rubies/ruby-2.3.0/bin/ruby  /home/b/.rvm/gems/ruby-2.3.0/bin/rubocop'
" let g:syntastic_loc_list_height =3
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
"nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set tags=./tags;
set grepprg=ack
set wildmenu
set winminheight=0

set backspace=indent,eol,start

set wildignore+=*/node_modules/* " Ciekawe czy chcesz to kurwa zmienic, co? ;ppp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 0

" Folding with space
" nnoremap <Space> za

" if exists('$TMUX')
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_powerline_fonts = 0
set laststatus=2

"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

set cursorline
"hi CursorLine   cterm=NONE ctermbg=8
set fillchars+=vert:\ 

"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' // custom ignore not working with ag (sad as shit tho)
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}

set t_Co=256
set background=dark
colorscheme SweetCandy
hi CursorLine term=bold cterm=bold ctermbg=233

highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE
highlight Comment ctermbg=NONE
highlight Constant ctermbg=NONE
highlight Identifier ctermbg=NONE
highlight Cursor ctermbg=NONE
highlight String ctermbg=NONE
highlight Character ctermbg=NONE
highlight Number ctermbg=NONE
highlight Special ctermbg=NONE
highlight Folded ctermbg=NONE
highlight PreProc ctermbg=NONE

hi! VertSplit ctermfg=NONE ctermbg=NONE term=NONE

let g:javascript_enable_domhtmlcss = 1
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" this is needed by webpack. it ensures that original file is overwritten:
set backupcopy=yes

" more natural behavior
  set splitbelow
  set splitright

hi StatusLine                  ctermfg=7     ctermbg=8     cterm=NONE
hi StatusLineNC                ctermfg=2     ctermbg=8     cterm=NONE

set shell=/bin/bash

command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif

nnoremap <silent> <C-S> :<C-u>Update<CR>
