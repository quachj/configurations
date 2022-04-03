

" let g:javascript_plugin_jsdoc = 1
" let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = '--lib es6'

autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

syntax on
filetype plugin indent on
"filetype on
"filetype plugin on
"filetype indent on

set noexpandtab
set tabstop=4
set softtabstop=0
set smartindent
set shiftwidth=4

" setlocal indentkeys+=0

