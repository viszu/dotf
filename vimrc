" = GENERAL"{{{1
" --------------
" viszu's vimrc - https://github.com/viszu
set nocompatible
" NeoBundle"{{{2
if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
  set rtp+=~/dotf/vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'vim-scripts/haskell.vim'
NeoBundle 'bogado/file-line'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-git'
NeoBundle 'vim-scripts/Gundo'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'rking/vim-detailed'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'morhetz/gruvbox'
" NeoBundle 'godlygeek/tabular'
" NeoBundle 'junegunn/vim-easy-align'
" NeoBundle 'Raimondi/delimitMate'
" NeoBundle 'jeetsukumaran/vim-buffergator'
" NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'JuliaLang/julia-vim'
" NeoBundle 'tpope/vim-vinegar'
" NeoBundle 'ajh17/VimCompletesMe'
" NeoBundle 'tpope/vim-obsession'
" NeoBundle 'mileszs/ack.vim'
" NeoBundle 'majutsushi/tagbar'
" NeoBundle 'viszu/vim-julia-fold'
" NeoBundle 'leafo/moonscript-vim'
" NeoBundle 'viszu/vim-moon-fold'
" NeoBundle 'flazz/vim-colorschemes'
" NeoBundle 'tristen/vim-sparkup'
" NeoBundle 'tpope/vim-markdown'
" NeoBundle 'jtratner/vim-flavored-markdown'
" NeoBundle 'viszu/vmath.vim'
"}}}2
" Filetype detection:ON, plugin:ON, indent:ON
filetype plugin indent on " required for plugin manager
NeoBundleCheck
" - Path"{{{2
if has('vim_starting')
  set rtp+=~/dotf/vim/
endif
"}}}2
" Enable syntax highlighting
syntax on
" - Support unicode characters"{{{2
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif
"}}}2
" Emulate typical editor navigation
set nostartofline
" Don't insert extra space(after .?!)
set nojoinspaces
" <C-a>, <C-x> fixup
set nrformats-=octal
" When creating a new line, set indentation same as previous line
set autoindent
" - Indentation"{{{2
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set shiftround
" set smarttab
"}}}2
" - Folding"{{{2
set foldlevel=99
set foldmethod=marker
" Use custom fold text
set foldtext=CustomFoldText()
" }}}2
" Buffer becomes hidden when it is abandoned
set hidden
" Create new split window below the current one
set splitbelow
" Create vertical split window right of the current one
set splitright
set scrolloff=1
set sidescrolloff=5
set display+=lastline
" For regular expressions turn magic on
set magic
" Enable menu for command-line completion
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.fo,*.xml,.svn,.git,.hg,*.pyc,*.o,*.a,*.class,*.obj,*.swp
set completeopt=menuone,preview
" - Display special characters for certain whitespace situations"{{{2
set list
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5\u00b7,trail:\u2022,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif
" }}}2
" Search stuff
set hlsearch
set incsearch
set ignorecase
set smartcase
" Lang for spell checker
set spelllang=en,pl
" Number of suggested words for spell checker popup
set spellsuggest=9
" Terminal title
set title
" Always show cursor position in statusline
set ruler
" Use hybrid mode number + relative (7.4+)
set number
set relativenumber
" This shows what you are typing as a command
set showcmd
set cmdheight=2
" Show matching brackets
set showmatch
" Always show status line
set laststatus=2
set statusline=\ [%n]\ %<%.99f\ %h%w%m%r%y%=%-16(\ %l/%L\ %c\ %)%P
" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set textwidth=78 wrap linebreak
" Backspace
set backspace=indent,eol,start
set complete-=i
" Timeout for keycodes (such as arrow keys and function keys) is only 10ms
" Timeout for Vim keymaps is a second
set timeout timeoutlen=1000 ttimeoutlen=10
" Mouse support
set mouse=a
" Limit Vim's "hit-enter" messages
set shortmess=atI
" set fileformats+=mac
set viminfo^=!
" Look for file changes
set autoread
set autowrite
" - Backup, undo, history"{{{2
" Disable swapfile and backup
set nobackup
set noswapfile
" Enable persistent undo
set undofile
set undodir=~/tmp/vim/undo
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
" Command-line history
if &history < 1000
  set history=1000
endif
" Netrw stuff
" if !exists('g:netrw_list_hide')
  " let g:netrw_list_hide = '^\.,\~$,^tags$'
" endif
" hide quick help, toggle with 'I'
" let g:netrw_banner = 0
" let g:matchparen_insert_timeout=5

" = MAPPINGS"{{{1
" --------------
" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor
nn <Space> za
nn Q <Nop>
nn <silent> <C-l> :noh<CR><C-l>
" nn <silent> - :Ex<CR>
" nn <leader>/ :nohlsearch<CR>
" nno ; :
" nno : ;
let mapleader = ','
let maplocalleader = '\\'
" Window navigation
nn <C-c> <C-w>c
" nn <C-h> <C-w>h
" nn <C-j> <C-w>j
" nn <C-k> <C-w>k
" nn <C-l> <C-w>l
" Be consistent with bash
" Go to the 1st non blank
ino <C-a> <C-o>^
cno <C-a> <Home>
" Go to the end of a line
ino <C-e> <C-o>$
cno <C-e> <End>
" Write current buffer
nn <silent> <leader>s :w!<CR>
" Quit without writing
nn <leader>qq :qall!<CR>
" Write all buffers and quit Vim
nn <leader>wq :wa!<CR>:q<CR>
nn <leader>a GVgg
" Write read-only files
cno w!! w !sudo tee >/dev/null %
cno ara ar **/*.*
" Close current buffer without closing window split
cno bd bp\|bd #
cno bd! bp\|bd! #
" Reselect visual block after indent/outdent
vn < <gv
vn > >gv
" Select (charwise) the contents of the current line, excluding indentation
" Great for pasting Python lines into REPLs.
nn vv ^vg_
" Easier linewise reselection
nn <leader>V V`]
" Make Y behave like other capitals
nn Y y$
nn <F12> "+
vn <F12> "+
" " Improve up/down movement on wrapped lines
nn j gj
nn k gk
" Toggle spell checking
nn <F3> :setl spell! spell?<CR>
" Toggle paste / nopaste
nn <silent> <F4> :setl paste!<CR>
" Center screen on next / prev found
nn N Nzz
nn n nzz
" Switch fast between buffers
nn <leader>b :ls<CR>:b<Space>
" Open vimrc
nn <leader>ev :e $MYVIMRC<CR>
" Source vimrc
nn <leader>vs :source $MYVIMRC<CR>
" cd to the directory containing the file in the buffer
nn <silent> <leader>cd :lcd %:p:h<CR>:pwd<CR>
" print working directory
nn <silent> <leader>pw :pwd<CR>
" print directory of the current file
nn <silent> <leader>pf :echo expand('%:p:h')<CR>
" undo to last write
nn <silent> <leader>u :ea 1f<CR>
" nn <leader>e :e **/
" Underline text, to create headers
nn <leader>- yypVr-
nn <leader>= yypVr=
nn <leader>` yypVr~
" Make <C-u> and <C-w> undoable
ino <C-u> <C-g>u<C-u>
ino <C-w> <C-g>u<C-w>
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" = ABBREVIATIONS"{{{1
cnorea H h

" = PLUGINS SETTINGS & MAPPINGS"{{{1
" ----------------------------------
no <silent> <leader>e :NR<CR>
" let g:ycm_server_log_level = 'warning'
" - Vmath"{{{2
vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++

" - Sparkup"{{{2
" let g:sparkupExecuteMapping='<leader>j'
" let g:sparkupNextMapping='<leader>n'
" let g:sparkupPreviousMapping='<c-f>'


" - Buffergator"{{{2
" let g:buffergator_split_size = 30
" let g:buffergator_display_regime = "bufname"
" let g:buffergator_autoexpand_on_split = 0
" let g:buffergator_suppress_keymaps = 1
" nn <silent> <leader>b :BuffergatorToggle<CR>


" - Ultisnips"{{{2
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-s-l>"
let g:UltiSnipsSnippetsDir="~/dotf/vim/UltiSnips"
" let g:UltiSnipsSnippetDirectories=["Ultisnips"]
let g:snips_author="viszu"
" Since this ultisnips fork can also use snipmate snips, prefer ultisnips snips
" let g:always_use_first_snippet = 1


" - Fugitive"{{{2
nn <silent> <leader>gs :Gstatus<CR>
nn <silent> <leader>gd :Gdiff<CR>
nn <silent> <leader>gc :Gcommit<CR>
nn <silent> <leader>gb :Gblame<CR>
nn <silent> <leader>gl :Glog<CR>
nn <silent> <leader>gp :Git push<CR>


" - NERDTree"{{{2
nn <silent> - :NERDTreeToggle<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeChDirMode=0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeShowHidden=0


" - CtrlP"{{{2
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)|tmp|dl|vids|pics|music$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'a'


" - Syntastic"{{{2
nn <silent> <leader>x :SyntasticCheck<CR>
" Disable all ruby warnings. Default setting is '-w -T1 -c'
let g:syntastic_ruby_mri_args='-T1 -c'

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E111,E501,E226'

" let g:syntastic_quiet_warnings=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_enable_signs=0
let g:syntastic_echo_current_error=0


" - Commentary"{{{2
" autocmd FileType python set commentstring=#\ %s
xmap \ <Plug>Commentary
nmap \ <Plug>Commentary
nmap \\ <Plug>CommentaryLine
nmap \u <Plug>CommentaryUndo


" - Gundo"{{{2
nn <silent> <F2> :GundoToggle<CR>


" - Dwm"{{{2
" let g:dwm_master_pane_width="50%"


" - Tagbar"{{{2
let g:tagbar_autofocus = 1
nn <silent> <F7> :TagbarToggle<CR>
nn <silent> <F8> :TagbarOpenAutoClose<CR>


" - EasyMotion"{{{2
" let g:EasyMotion_leader_key = '\'
" let g:EasyMotion_do_shade = 0


" - Dispatch"{{{2
" nn <F9> :Dispatch<CR>


" = AUTOCOMMANDS"{{{1
" -------------------
augroup General
  au!
  " Remove any trailing whitespace that is in the file
  au BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

  " Jumps to the last known position in a file just after opening it
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
    \ endif

  " When leaving insert mode, set nopaste
  au InsertLeave * set nopaste

  " Turns off error bells
  set noerrorbells visualbell t_vb=
  au GUIEnter * set vb t_vb=

  " Resize splits when the window is resized
  au VimResized * :wincmd =

  au BufEnter * call system("tmux rename-window " . expand("%:t"))

augroup END

augroup FTCheck
  " filetype.vim
  au!
  au BufEnter *.jl setl commentstring=#%s
  au BufNewFile,BufRead TODO,HELP,LINKS,NOTES,MUSIC if &ft == ""
    \ | set ft=markdown|endif
  " Move tasks todo <-> done
  au BufRead TODO nn <buffer> <leader>z dd/ZROBIONEjp/TODOjj
  au BufRead TODO nn <buffer> <leader>x dd/TODOjp/ZROBIONEjj
  " UltiSnips is missing a setf trigger for snippets on BufEnter
  au BufEnter *.snippets setf snippets
augroup END

augroup FTOptions
  " ftplugin
  au!
  au FileType haskell nn <buffer> <F5> :!clear<CR>:!ghci %<CR>
  au FileType julia nn <buffer> <F5> :!clear<CR>:!julia %<CR>
  au FileType lua nn <buffer> <F5> :!clear<CR>:!luajit %<CR>
  au FileType moon nn <buffer> <F5> :!clear<CR>:!moon %<CR>
  au FileType python nn <buffer> <F5> :!python %<CR>
  au FileType html nn <buffer> <F5> :!clear<CR>:!chromium-browser %<CR><CR>
augroup END

" = FUNCTIONS{{{1
" ---------------

" - CustomFoldText{{{2
fun! CustomFoldText()
  "get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
      let line = getline(v:foldstart)
  else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let lineCount = line("$")
  let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
  let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfun

" = GUI & COLOR SCHEME"{{{1
" -------------------------
if has('gui_running')
  if has('unix')
    set guifont=Inconsolata-g\ 10
  endif
  set lines=38 columns=83
  colorscheme detailed
  " Turn off menu, toolbar, scrollbars
  set guioptions=aegit
else
  " Terminal
  " set t_Co=256 "t_md=
  " Fix broken bg colors with tmux $TERM conflict"
  " set t_ut=
endif

set background=dark
" colorscheme gruvbox
colorscheme detailed
" don't bold, underline folded
hi Folded term=none cterm=none gui=none
hi Normal ctermfg=223 guifg=#ebdbb2
" black vsplit border
hi VertSplit ctermfg=232 cterm=none gui=none
" don't revert statusline colors, use those instead
hi StatusLine ctermfg=223 ctermbg=233 term=none cterm=none gui=none
hi StatusLineNC ctermbg=233 term=none cterm=none gui=none
" if g:colors_name == 'skittles_dark'
" endif
" SignColumn will use same bg color as linenumber (GitGutter will set it)
hi clear SignColumn
