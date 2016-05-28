 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'
"
 NeoBundle 'Shougo/vimproc'
 NeoBundle 'derekwyatt/vim-scala'
 NeoBundle 'tpope/vim-fireplace'
 NeoBundle 'kien/ctrlp.vim'
 NeoBundle 'vim-scripts/paredit.vim'
 NeoBundle 'guns/vim-clojure-static'
 NeoBundle 'kien/rainbow_parentheses.vim'
 NeoBundle 'Lokaltog/vim-easymotion'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'mrdomino/vim-utf8'
"
"
 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

set history=1000
set mouse=a
set ignorecase
set smartcase
set ruler
"set hidden

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

let g:paredit_mode = 1
let g:paredit_shortmaps = 1
let g:paredit_smartjump = 1

filetype plugin indent on

syntax on

" Clojure-specific settings
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']
let g:clojure_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']
let g:clojure_align_multiline_strings = 1

" Enable Rainbow Parens everywhere
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
        

" Configure Clojure repl commands
imap <silent> <C-e> <Plug>ClojureReplEvaluate.
imap <silent> <C-k> <Plug>ClojureReplUpHistory.
imap <silent> <C-j> <Plug>ClojureReplDownHistory.
imap <silent> <C-Up> <Plug>ClojureReplUpHistory.
imap <silent> <C-Down> <Plug>ClojureReplDownHistory.

" Configure Control-P plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_custom_ignore = {
	    \ 'dir':  '\v(\.(git|hg|svn|cvs)|target)$',
	    \ 'file': '\.exe$\|\.so$\|\.dll$|\.class$',
	    \ }

" EasyMotion leader
let g:EasyMotion_leader_key = ',,'

" Make indenting and unindenting in visual mode retain the selection so
" you don't have to re-select or type gv every time.
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Make CTRL+u and CTRL+d less confusing
"map <C-u> 10<C-Y>10k
"map <C-d> 10<C-E>10j

" Switch windows quickly with CTRL+{h,j,k,l}
" This breaks backspace in a terminal, but I never use backspace in
" normal mode
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
" This would break in a terminal where ^H is
" backspace.
if has("gui_running")
    imap <C-h> <Esc><C-W>h
endif
imap <C-j> <Esc><C-W>j
imap <C-k> <Esc><C-W>k
imap <C-l> <Esc><C-W>l

" Make j,k move by screen lines instead of file lines.
" WARNING: If you use this vimrc, make sure you understand the
" implications
" of the following two mappings, especially if you use macros
" frequently.
" A temporary workaround for writing macros is to go into
" insert mode, use
" the up/down arrow keys, then exit to normal mode.
map j gj
map k gk

" Don't update the display while executing macros
set lazyredraw
