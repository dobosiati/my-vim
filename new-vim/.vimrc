"test
set nocompatible              						"We want the latest Vim settings/options	

so ~/.vim/plugins.vim

syntax enable

colorscheme minimalist
"colorscheme lightning

set backspace=indent,eol,start						"Make backspace behave like every other editor.
let mapleader=','									"The default leader is \m but a comma is much better.

set number											"Lets activate line numbers.
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

"Turn off line numbers
nmap <Leader>nnu :set nonumber<cr>
"Turn on line numbers
nmap <Leader>nu :set number<cr>

nmap <Leader>lc :set  listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·<cr>:set list<cr>
nmap <Leader>lnc :set list!<cr>
 
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
"Search and replace between files
nmap <Leader>r :Greplace<cr>

"/
"/ Greplace.vim
"/
set grepprg=ag														"We want to use Ag for the search.



"----------- Split Management ------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



"------------ Auto-Commands --------"

"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
