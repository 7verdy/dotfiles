" -----------------------------------------------------------------------------
"            \BBBBBBBBBBBBBBB&*      B   B      *&BBBBBBBBBBBBBBB/
"                \&BBBBBBBBBBBB&\___/BBBBB\___/&BBBBBBBBBBBB&/
"                  \%BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB%/
"                    \BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB/
"                       *****\%BBBBBBBBBBBBBBBBB%/*****
"                              ...#BBBBBBBBB#...
"                                   \BBBBB/
"                                     \B/
"                                      B
"
"                        Baptman's Utility Belt: vimrc
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" -------------------------------   Options     -------------------------------
" -----------------------------------------------------------------------------


" Enable filetype detection for plugins and indentation options
filetype plugin indent on
" colors
syntax on

" Encoding
set encoding=utf-8

" Enable Mouse
set mouse=a

" Enable Line Number
set number

" Show cmd on the bottom
set showcmd

" Set list chars:
" trail -> trailing spaces
" nbsp -> non breakable space character
set list listchars=tab:>-,nbsp:.,eol:$,trail:.

" Faster update time
set updatetime=100

" Enable visual bell and deactivate the flash
set visualbell
set t_vb=
set belloff=all

" Add info to statusline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" add all directory and sub directory to path for find
set path+=**

" wild menu for auto complete
set wildmenu
" remove the check of included files for the auto complete
set complete-=i

"try
"    set undodir=~/.vim/tmp/undodir
"    set undofile
"    set backupdir=~/.vim/tmp/backup
"    set backup
"    set directory=~/.vim/tmp/swap
"    set swapfile
"catch
"endtry

" set unnamed for linux
set clipboard=unnamed

"--search--"
" highlight the case
set hlsearch
" ignore case
set ignorecase
" don't ignore case if uppercase is specified
set smartcase
" move to match
set incsearch



" jump to matching for brackets and co
set showmatch

" Time for the showmatch
set matchtime=2

" display mode
set showmode

" Auto reload file when it has changed outside of vim
set autoread

" Auto write buffer when exiting
set autowrite

" Highlight current line
set cursorline

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" --- Tab and CO ---
" Insert spaces instead of tab char
set expandtab

" Number of spaces a tab char counts for
set tabstop=8
" when press TAB (number of spaces) 
set shiftwidth=4
" keep the indent when creating new line
set autoindent
" delete smartindent spaces and add to match width
set smarttab
" auto indent
set smartindent

" text width
set textwidth=79

"color column
set cc=80

" width when inserting tab
set softtabstop=4

" stuff that backspace can delete
set backspace=eol,start,indent

" go to
set whichwrap=b,s,<,>,h,l

" quickfix list switch
set swb=useopen,vsplit

" Scroll
set scrolloff=1
set sidescrolloff=5

" display, add lastine
set display+=lastline

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif

" -----------------------------------------------------------------------------
" ---------------------------      Mapping      -------------------------------
" -----------------------------------------------------------------------------

let mapleader=","

" remove the highlight
nnoremap <leader>n :noh

" Toggle paste mode
noremap <leader>pp :setlocal paste!<cr>

" ---- COC mappings ----
inoremap <silent><expr> <C-@> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Navigation
nnoremap <leader>kd :CocDiagnostic<cr>
nnoremap <leader>kp <Plug>(coc-diagnostic-prev)
nnoremap <leader>kn <Plug>(coc-diagnostic-next)


" GoTo code navigation.
nmap <silent> <leader>kk <Plug>(coc-definition)
nmap <silent> <leader>kt <Plug>(coc-type-definition)
nmap <silent> <leader>ki <Plug>(coc-implementation)
nmap <silent> <leader>kr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>krn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>kf  <Plug>(coc-format-selected)
nmap <leader>kf  <Plug>(coc-format-selected)
nnoremap <leader>ko  <Plug>(coc-format)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>kac  <Plug>(coc-codeaction)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

nnoremap <leader>kb :silent! :Format<CR>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Command line remap
cnoremap <C-A> <Home>

" -- quickfix list --
nnoremap <leader>cw :botright :cw<CR>
nnoremap <leader>ccl :ccl<CR>

" --- make ---
nnoremap <leader>m :silent! :make! \| :redraw!<CR>
nnoremap <leader>mc :silent! :make! check \| :redraw!<CR>
nnoremap <leader>ml :silent! :make! clean \| :redraw!<CR>

" Tab char
inoremap <S-Tab> <C-V><Tab>

" terminal
nnoremap <leader>te :rightb terminal ++rows=12<CR>

" -- fugitive --
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap <leader>gdf :Gvdiff<CR>
nnoremap <leader>g2 :diffget //2<CR>
nnoremap <leader>g3 :diffget //3<CR>
nnoremap <leader>gp :diffput<CR>

nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>glt :Git log --decorate<CR>
nnoremap <leader>gl :silent! Glog<CR>

nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>

nnoremap <leader>gt :Git tag -a -m ''<Space>

" never used it so far
" nnoremap <leader>gr :Gread<CR>
" nnoremap <leader>gw :Gwrite<CR><CR>
" nnoremap <leader>gp :Ggrep<Space>
" nnoremap <leader>gm :Gmove<Space>
" nnoremap <leader>gps :Dispatch! git push<CR>
" nnoremap <leader>gpl :Dispatch! git pull<CR>

" -- clang format --
" nnoremap <leader>cf :!clang-format --verbose -style=file -i %:p<CR>

" -----------------------------------------------------------------------------
" ---------------------------      Function     -------------------------------
" -----------------------------------------------------------------------------

autocmd BufNewFile,BufRead *.mail setfiletype mail
autocmd FileType mail call Format_mail()

function Format_mail()
    setlocal nocindent
    setlocal noautoindent
    setlocal textwidth=68
    setlocal cc=68
    setlocal spell spelllang=en
    setlocal fileencodings=iso8859-1,utf-8

    setlocal makeprg=/home/baptman/yaka/leodagan/leodagan.py
    nnoremap <leader>c :make %:p -q<CR>
endfunction

autocmd FileType tex call Mapping_TEX()

function Mapping_TEX()
    nnoremap <leader>b o\begin{}<Esc>i
    nnoremap <leader>e o\end{}<Esc>i
    vnoremap <leader>f :s/\%V\(.*\)\/\(.*\)\%V/\\frac{\1}{\2}/<Esc>:noh<CR>i
    nnoremap <leader>1 i\frac{1}{}<Esc>i
endfunction
" -----------------------------------------------------------------------------
" ---------------------------     Skeletons     -------------------------------
" -----------------------------------------------------------------------------

" Miscellaneous
cnoremap <leader>ubc :-1read ~/.vim/.skeletons/ub_comment.txt<CR>j6wi
" C
cnoremap <leader>cmain :-1read ~/.vim/.skeletons/c/main.c<CR>2jO
cnoremap <leader>cmaini :-1read ~/.vim/.skeletons/c/main_i.c<CR>2jO
cnoremap <leader>cmaina :-1read ~/.vim/.skeletons/c/main_a.c<CR>2jO
cnoremap <leader>cmainia :-1read ~/.vim/.skeletons/c/main_ia.c<CR>2jO
" Signature
nnoremap <leader>sig :-1read ~/.vim/.skeletons/signature.mail<CR>O-- <C-V><C-M><Esc>


" -----------------------------------------------------------------------------
" ---------------------------      Plugin       -------------------------------
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" markdown align
Plug 'junegunn/vim-easy-align'

" syntax highlight for nix
Plug 'LnL7/vim-nix'

" Theme
Plug 'joshdick/onedark.vim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'

" [x] Git integration
Plug 'tpope/vim-fugitive'
" [x] Bracket mapping
Plug 'tpope/vim-unimpaired'
" [x] Automatic sessions
Plug 'tpope/vim-obsession'
" [x] Surround
Plug 'tpope/vim-surround'
" [x] Tags handling
Plug 'ludovicchabant/vim-gutentags'
" [x] repeat
Plug 'tpope/vim-repeat'
" [x] LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" [x] pydoc
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
" [x] testing
Plug 'janko/vim-test'

" [x] svelte syntax highlight
Plug 'leafOfTree/vim-svelte-plugin'

call plug#end()

" mapping for markdown align
nmap <leader>ga <Plug>(EasyAlign)
xmap <leader>ga <Plug>(EasyAlign)

" status line always present
set laststatus=2

" lightline properties
let g:lightline = {
        \ 'colorscheme': 'onedark',
        \ 'active': {
        \   'left': [ [ 'mde', 'paste' ],
        \             [ 'gitbranch', 'readonly',
        \               'filename', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'fileencoding', 'filetype', 'charvaluehex' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead'
        \ },
        \ 'component': {
        \   'charvaluehex': '0x%B'
        \ },
    \ }

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
" if (has("autocmd") && !has("gui_running"))
"     augroup colorset
"         autocmd!
"         let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
"         autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
"     augroup END
" endif
colorscheme onedark
