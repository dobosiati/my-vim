set nocompatible									"We want the latest Vim settings/options

so ~/.vim/plugins.vim

syntax enable

colorscheme minimalist
"colorscheme lightning

set backspace=indent,eol,start						"Make backspace behave like every other editor.
let mapleader=','									"The default leader is \m but a comma is much better.

set number											"Lets activate line numbers.

"set autochdir                                      "Always change to the current file's directory

let g:vue_disable_pre_processors=1					"Speed up vim plugin

hi! link FoldColumn Normal
set foldcolumn=1									"Adding margin

set linespace=10									"Macvim-specific line-height.
set noerrorbells visualbell t_vb=					"No bells

set showtabline=1									"Always show the tabs

set shiftwidth=4
set tabstop=4

set t_CO=256										"Use 256 colors. This is useful for Terminal Vim.
set guioptions=m									"Show menubar
set guioptions-=T									"Hide taskbar
set guioptions-=l									"Hide leftscroll bar
set guioptions-=L									"Hide leftscroll bar when split
set guioptions-=r									"Hide rightscroll bar
set guioptions-=R									"Hide rightscroll bar when split

set whichwrap+=>,l									"Go to next line from end of line
set whichwrap+=<,h									"Go to previous line from start of line

"No background
"hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE

"-------------- Mappings -----------"

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Edit snippets
nmap <Leader>es :e ~/.vim/snippets/

"Make it easy to edit the Vim plugins.
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Open new tab
nmap <C-t> :tabedit<cr>

"Paste from system clipboard in gvim
nmap <Leader>v "+gP
"Copy from system clipboard in gvim
vmap <Leader>y "+y
"Cut from system clipboard in gvim
vmap <Leader>x "+x

"Add space in normal mode
nmap <space> i<space><Esc>
"Delete back in normal mode
nmap <BS> i<BS><Esc>l
"New line in normal mode
nmap <cr> i<cr><Esc>
"Tab in normal mode
nmap <Tab> i<Tab><Esc>l

"Faster way to quit
nmap <C-w><C-w> :q<cr>
"Faster way to save the file
nmap <C-s> :w<cr>
imap <C-s> <Esc>:w<cr>i<right>

"Turn off line numbers and turn on margin
nmap <Leader>nnu :set nonumber<cr>:set foldcolumn=1<cr>
"Turn on line numbers and turn off margin
nmap <Leader>nu :set number<cr>:set foldcolumn=0<cr>
"Turn on margin
nmap <Leader>m :set foldcolumn=1<cr>
"Turn off margin
nmap <Leader>nm :set foldcolumn=0<cr>

"Show hidden characters
nmap <Leader>lc :set  listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·<cr>:set list<cr>
"Hide hidden characters
nmap <Leader>lnc :set list!<cr>

"Move this line up
nmap <C-A-up> :m .-2<CR>==
imap <C-A-up> <Esc>:m .-2<CR>==gi
vmap <C-A-up> :m '<-2<CR>gv=gv
"Move this line down
nmap <C-A-down> :m .+1<CR>==
imap <C-A-down> <Esc>:m .+1<CR>==gi
vmap <C-A-down> :m '>+1<CR>gv=gv

"Code autoformat
nmap <F3> :Autoformat<CR>

"Switching between colorshemes (light or dark)
"nmap <Leader>cd :!vim -c '%s/"colorscheme lightning/colorscheme lightning/g|wq' ~/.vimrc<CR>

"-------------- Plugins ------------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|git'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"Jumt to function in a file
nmap rr :CtrlPBufTag<cr>
"Jump to function or variable in a direrctory tree
nmap <Leader>f :ts<space>
"Recently opened files
nmap <S-e> :CtrlPMRUFiles<cr>


"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"Make NERDTree easier to toggle.
nmap <Leader><Leader> :NERDTreeToggle<cr>


"-------------- Search -------------"

set hlsearch
set incsearch

"Search content between files
nmap <Leader>s :Ag<space>
"Search replace between files and able to modify those contents
nmap <Leader>gs :Gsearch<cr>
"Search and replace between files
nmap <Leader>gr :Greplace<cr>

"Sortcut for replacing in file
nmap <Leader>r :%s/

"/
"/ Greplace.vim
"/
set grepprg=ag														"We want to use Ag for the search.



"----------- Split Management ------"
set splitbelow
set splitright

"Switching between windows
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
nmap <C-down> <C-W><C-J>
nmap <C-up> <C-W><C-K>
nmap <C-left> <C-W><C-H>
nmap <C-right> <C-W><C-L>

"------------ Auto-Commands --------"

"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup ENDo
	
"Commenter for vuejs component
let g:ft = ''
function! NERDCommenter_before()
	if &ft == 'vue'
		let g:ft = 'vue'
		let stack = synstack(line('.'), col('.'))
		if len(stack) > 0
			let syn = synIDattr((stack)[0], 'name')
			if len(syn) > 0
				exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
			endif
		endif
	endif
endfunction
function! NERDCommenter_after()
	if g:ft == 'vue'
		setf vue
		let g:ft = ''
		syntax sync fromstart
	endif
endfunction
