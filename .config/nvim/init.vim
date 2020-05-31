" TODO:
" - Don't focus nerd tree on load
" - Some wtf stuff
" - C/C++
" - Python
" - List of TODOs
" - LaTeX

call plug#begin()
Plug 'arcticicestudio/nord-vim'                  " Nordic theme
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'                        " NERDTree - file explorer
Plug 'preservim/nerdcommenter'                   " Multiline comments
Plug 'jiangmiao/auto-pairs'                      " Auto close pair backets etc
Plug 'lervag/vimtex'                             " TeX support
Plug 'sirver/ultisnips'                          " Snippets (used only for TeX now)
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " CoC - autocompleation
Plug 'rust-lang/rust.vim'                        " Rust support
Plug 'vim-syntastic/syntastic'                   " ???
Plug 'majutsushi/tagbar'                         " ???
Plug 'vim-airline/vim-airline'                   " Nice tatus line 
Plug 'airblade/vim-rooter'                       " Make pathes relative to the VCS root
call plug#end()

"*** General keyboard settings ******************
" Setup leader key
let mapleader = ","

" Move over wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

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

"*** Foldings ***********************************
" Looks like it doesn't work
" set foldenable
" set foldmethod=syntax

"*** NERDTree ***********************************
" Auto load NERDTree
" autocmd vimenter * NERDTree
" Don' focus NERDTree at launch
"augroup NERD
"    au!
"    autocmd VimEnter * NERDTree
"    autocmd VimEnter * wincmd p
"augroup END

map <leader>t :NERDTreeToggle<CR>

"*** UltiSnips **********************************
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

"*** NERDComment ********************************
let g:NERDSpaceDelims = 1                   " Add space after comment
let g:NERDCommentEmptyLines = 1             " Comment empty lines
let g:NERDCreateDefaultMappings = 0         " Disable default key mappings
map <leader>cc <plug>NERDCommenterToggle
map <leader>cv <plug>NERDCommenterAppend
" TODO: use single line comments
" TODO: comment only selected part of line (if possible)

"*** COC ****************************************

" inoremap <silent><expr> <Tab>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<Tab>" :
      " \ coc#refresh()

" Use TAB for compleation
" TODO: looks like it doesn't work
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" I have no idea what is it
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use <c-space> to trigger completion.
" TODO: looks like it doesn't work
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" TOOD: Not work or I am trying it from wrong MODE
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" TODO: Hm... Automatically add arguments... I don't know how to use it and I
" don't like it
" augroup mygroup
  " autocmd!
  " " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " " Update signature help on jump placeholder
  " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

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
