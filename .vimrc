"" Just some temp snippets and examples for testing
" i believe ! is force mode
function! SubstBrackets(word)
	let word_re = '\V'.escape(a:word, '/\')
	let pattern = '\v<('.word_re.'\v)\((.{-})\)'
	execute '%s/'.pattern.'/\1{\2}/eg'
endfunction

" note: absolute paths do not work for external grep command.
" todo: maybe look at switching to use find.
" use vimgrep is slower
function! FindUsingGrep(match)

	let match_re = '\V'.escape(a:match, '/\')
	let pattern = '\v<('.match_re.'\v)\((.{-})\)'
 
	execute " grep! -srnw --binary-files=without-match "
	 			\ . "--exclude-dir=node_modules "
				\ . "--exclude-dir=node_modules "
				\ . a:match . " "
				\ . expand("#:p:h") . "/*"
endfunction

function! FindUsingVimGrep(match)

	let match_re = '\V'.escape(a:match, '/\')
	let pattern = '\v<('.match_re.'\v)\((.{-})\)'
 
	" uses wildignore configuration to exclude directories
    execute " vimgrep /" . escape(a:match,'/\') . "/j **"
endfunction

" nnoremap <C-r> :bufdo bdelete<cr>
" nnoremap <silent> ;subst :call SubstBrackets(
"   \ input('Word to replace? ', 'interior'))<CR>
" noremap <F2> :echo 'Current time is ' . strftime('%c')<CR>
" noremap <silent> <c-k> :.m+2<CR> " move current line up 2
" noremap <silent> <c-t> :ls<CR> " why does this not work? map to display list of buffers
" " nnoremap yy yypkkyyp
" "" End Notes
 
function ClearQuickfixList()
  call setqflist([])
endfunction

" """"""""""""""""""""""
" my vim settings      "
" """"""""""""""""""""""

" :Sch {pattern}
command -nargs=1 Sch noautocmd vimgrep /<args>/gj `git ls-files` | cw
command! ClearQuickfixList cexpr[] "call ClearQuickfixList()

command! -bar -nargs=1 SubstBrackets
  \ call SubstBrackets(<q-args>)

command! -bar -nargs=1 FindUsingGrep 
  \ call FindUsingGrep(<q-args>) | cw

command! -bar -nargs=1 FindUsingVimGrep
  \ call FindUsingVimGrep(<q-args>) 



" eliminate the extra log output dump for grep and lgrep and go directly to
" quickfix window
" cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() =~# '^grep')  ? 'silent grep'  : 'grep'
" cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() =~# '^lgrep') ? 'silent lgrep' : 'lgrep'
"augroup init_quickfix
"  autocmd!
"  autocmd QuickFixCmdPost [^l]* cwindow
"  autocmd QuickFixCmdPost l* lwindow
"augroup END


" Custom Key Mappings
 
" this close tab with N doesn't work very good. can't think of a good way to do this.
" close tab <number> <enter> in normal vim mode
" nnoremap <silent> ct :tabclose  
" leader usually default is \ (:help leader) comma is a good leader
let mapleader=","
set timeoutlen=2000
"let mapleader="\<Space>"
noremap <leader>cf :ClearQuickfixList<CR>
noremap <Leader>W :w !sudo tee % > /dev/null
" change directory to the file being edited
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>  
" nnoremap <leader>c <c-^>:bdelete #
" delete all buffers except this one
" nnoremap <leader>bc :%bd|e#<CR> 

nnoremap <leader>f :call FindUsingGrep(
			\ input('find? ', '' . expand('<cword>') ))<CR>
nnoremap <leader>g :call FindUsingVimGrep(
			\ input('find? ', '' .expand('<cword>') ))<CR>

"map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F4> :execute " grep -srnw --binary-files=without-match --exclude-dir={.git,node_modules} . -e " . expand("<cword>") . " " <bar> cwindow<CR>


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

" VIM CONFIGURATIONS & SETTINGS

set mouse=a
set showcmd " show commands bottom right corner
set ignorecase
" set smartcase
" for vimgrep exclude folders
" set wildignore+=objd/**,obj/**,*.tmp,test.c,node_modules/,bin/**
" set wildignore+=node_modules,*.lock
set wildignore=*/node_modules/*,*/target/*,*/tmp/*,*/.git/*

" change vimgrep to search only files that are tracked by git
"noautocmd vimgrep /{pattern}/gj `git ls-files`

" PLUGIN CONFIGURATION & SETTINGS

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_list_hide='.*\.swp$'

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|\.*\'

" let g:javascript_plugin_jsdoc = 1
" let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = '--lib es6'

" in a tsx file :make will run tsc transpiler and show errors in quickfix window
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
set statusline=%f " %F

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
" #### open file in previous buffer use <shift-P>
"
" ## buffers
" :bwipeout (:bw)
" :edit <file>
" :enew | vnew | new
" :badd <file>
" 
"
" ## windows
" CTRL-W_x " exchange window 
