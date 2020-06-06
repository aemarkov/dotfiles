
" - Don't focus nerd tree on load
" - Complete C++ settings
" - Formatting?
" - Python
" - List of TODOs
" - Go foward-backward
" - Switch between two last places
" - fuzzy search
" - fix fucking auto-pairs

call plug#begin()
Plug 'arcticicestudio/nord-vim'                  " Nordic theme
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'                        " NERDTree - file explorer
Plug 'preservim/nerdcommenter'                   " Multiline comments
"Plug 'jiangmiao/auto-pairs'                      " Auto close pair backets etc
Plug 'lervag/vimtex'                             " TeX support
Plug 'sirver/ultisnips'                          " Snippets (used only for TeX now)
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " CoC - autocompleation
Plug 'rust-lang/rust.vim'                        " Rust support
Plug 'vim-syntastic/syntastic'                   " ???
Plug 'majutsushi/tagbar'                         " ???
Plug 'vim-airline/vim-airline'                   " Nice tatus line 
Plug 'airblade/vim-rooter'                       " Make pathes relative to the VCS root
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" *** General settings ***************************
" Allow changing buffer without closing and writing
set hidden
" disable backups
set nobackup
set nowritebackup
" Low update time for better compleation
set updatetime=300
" Don't pass messages to |ins-completion-menu| " ???
set shortmess+=c

" *** General keyboard settings ******************
" Setup leader key
let mapleader = ","

" Move over wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" Switch buffers
nnoremap <silent> <M-left> :bp<CR>
nnoremap <silent> <M-right> :bn<CR>

" Go to the previous file
nnoremap <silent> <leader><leader> <c-^>

" Open with FZF
" Open buffer
nnoremap ; :Buffers<CR>
" Open file
nnoremap <leader>o :Files<CR>
" Find tag
nnoremap <leader>t :Tags<CR>

" Toggle NERDTree
map <leader>e :NERDTreeToggle<CR>

" Standard mapping help
" <C-i> go forward
" <C-o> go backward

"*** Appearence settings ************************
colorscheme nord

let g:nord_bold_vertical_split_line = 1
let g:nord_comment_brightness = 12

" 24-bit color
set termguicolors

" line numbers
set nu                                      " Display line numbers
set relativenumber                          " Relative line numbers
set cursorline                              " Highlight number of the current line 

" UTF-8 (used for icons)
set encoding=UTF-8

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"*** Indention **********************************
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set expandtab
set smarttab

" Some more cool autocompleate menu
set wildmenu

"*** Page settings ******************************
set colorcolumn=100

"*** Search *************************************
" Highlight pair braces
set showmatch

" Search settings
set incsearch                               " Search while typing 
set hlsearch                                " Highlight search results
nnoremap <leader><space> :nohlsearch <CR>



"*** UltiSnips **********************************
" TODO: <tab> conflicts with COC
let g:UltiSnipsExpandTrigger = '<leader><tab>'
let g:UltiSnipsJumpForwardTrigger = '<leader><tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

"*** Comments **********************************
" Disable auti comments
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" NERDComment
let g:NERDSpaceDelims = 1                   " Add space after comment
let g:NERDCommentEmptyLines = 1             " Comment empty lines
let g:NERDCreateDefaultMappings = 0         " Disable default key mappings
map <leader>cc <plug>NERDCommenterToggle
map <leader>cv <plug>NERDCommenterAppend
" TODO: use single line comments
" TODO: comment only selected part of line (if possible)

"*** COC ****************************************
" TAB completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Go to something
" declaratiom - e.g. function prototype in C/C++ or extern
" definition  - e.g. function implementation or variable
nmap <silent> gc <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :CocCommand clangd.switchSourceHeader<CR>

" Don't work with clangd
" I don't know what is the "type defintion" and what the difference
" between "implementation" and "definition"
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Rename current symbol
nmap <leader>rn <Plug>(coc-rename)

" Format selected code
" TOOD: Not work or I am trying it from wrong MODE
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply codeAction to the selected region
" ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Apply codeAction to the current buffer
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" *** LaTeX **************************************
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal="abdgms"
hi clear Conceal                            " Background color fix for conceal
let g:vimtex_complete_enabled = 1           " Enable auto-compleate

map <M-l> <plug>(vimtex-view) 
nmap <leader>l :VimtexTocToggle<CR>
" augroup Vimtex
    " au!
    " autocmd BufEnter,BufNew *.tex VimtexTocOpen 
" augroup End
"" TODO: vimtex-view on save
" TODO: switch buffer when opening TOC
" TODO: close vim when closing tex file

"*** ctags **************************************
nmap <F8> :TagbarToggle<CR>

"*** syntastic **********************************
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
