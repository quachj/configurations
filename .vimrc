"" Just some temp snippets and examples for testing
" i believe ! is force mode
function! SubstBrackets(word)
	let word_re = '\V'.escape(a:word, '/\')
	let pattern = '\v<('.word_re.'\v)\((.{-})\)'
	execute '%s/'.pattern.'/\1{\2}/eg'
endfunction

command! -bar -nargs=1 SubstBrackets
  \ call SubstBrackets(<q-args>)

" nnoremap <C-r> :bufdo bdelete<cr>
" nnoremap <silent> ;subst :call SubstBrackets(
"   \ input('Word to replace? ', 'interior'))<CR>
" noremap <F2> :echo 'Current time is ' . strftime('%c')<CR>
" noremap <silent> <c-k> :.m+2<CR> " move current line up 2
" noremap <silent> <c-t> :ls<CR> " why does this not work? map to display list of buffers
" " nnoremap yy yypkkyyp
" "" End Notes
 

" """"""""""""""""""""""
" my vim settings      "
" """"""""""""""""""""""


" custom key mappings
 
" this close tab with N doesn't work very good. can't think of a good way to
" do this.
" nnoremap <silent> ct :tabclose  " close tab <number> <enter> in normal vim mode
" leader usually default is \ (:help leader) comma is a good leader
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>  " change directory to the file being edited
nnoremap <leader>c <c-^>:bdelete #

" default plugin directory '~/.vim/plugged' can be passed in as arg
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim' 
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
call plug#end()

set mouse=a
set showcmd " show commands bottom right corner
" set ignorecase
set smartcase

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_list_hide='.*\.swp$'

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

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

" setlocal indentkeys+=0

set noexpandtab
set tabstop=4
set softtabstop=0
set smartindent
set shiftwidth=4

set number 
" set nonumber

" :help laststatus
" :help statusline
set laststatus=1
" # show full file path
set statusline+=%F

" ###################
" ## vim references##
" ###################
" ctrl b # back 1 full screen
" ctrl f # forward 1 full screen
" ctrl d # down 1/2 screen
" ctrl u # up 1/2 screen
" <num> | # move to column
"
" help docs follow link
" ctrl ]
" ctrl T
" ctrl o
" ## tabs
" gt
" :tabn
" :tabp 
" :tabm <n> # move tab 0 indexed (to end if not specified)
" gT
" <num>gt
" :tabnew <filepath>
" :tabf <filepath*>
" :tabc <number> # :tabclose <number>
"
"
" :scriptnames
" :function
" :verbose set history?
" :func SearchCompl
"
" ## key mapping
" :unmap <F2>
" :map g
" :map  # list commands
" :map! # list commands for insert mode
" :imap # insert mode
" :nmap # normal mode
" :vmap # visual and selection mode
" :smap # select mode
" :cmap # command line mode
" :xmap # visual mode
" :omap # operator pending mode maps
" #### can not unmap vim native command
" #### ensure mappings and unmappings is created after plugin maps 
" autocmd VimEnter * unmap! <F2>
" #### mapping for specific file type
" autocmd FileType python unmap! <F2>
" ## key codes
" :help keycodes
" :help <C-
"
" ## help tagging
" #### jump to next tag in help doc
" :tag <tagname> # *meta* *ctrl* *sometag*
"
" ctrl-g # shows current file path
" :echo @%
" :f
" 
" ## buffers
" :ls
" :buffers
"
" ## netrw
" :Rex " resume exploring
" <c-6>/<c-^>
" :e #
" {count}CTRL-^ # edit nth file in buffer list equivelent to :e #[count]
"
" ## buffers
" :bwipeout (:bw)
"
" ## windows
" CTRL-W_x " exchange window 
