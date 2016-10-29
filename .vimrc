set shell=bash\ --login

set nocompatible
filetype off

" Disable spellcheck.
set nospell

" Dark background.
set background=dark

" Clear autocommands.
autocmd!

" Look for settings at the top or bottom of file.
set modeline
set modelines=5

" Re-source vimrc if it has been modified.
autocmd! BufWritePost *vimrc source %

" Set the leader.
let g:mapleader = ","

" Wildmode options.
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.jpg,*.png,*.gif,*.jpeg,*.bmp
set wildignore+=*.hg,*.git,*.svn
set wildignore+=*.exe,*.dll
set wildignore+=*.pyc

" Vundle plugins.
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'mbbill/undotree'
Plugin 'myusuf3/numbers.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

augroup MarkdownFiles
	autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup end

au BufWritePost ~/.bashrc !source %

filetype on
filetype off

" Allow backspace past insert mode.
set backspace=2

" Increase history.
set history=999

" Enable line numbers in left margin.
set number

" Set cursor scroll offset.
set scrolloff=10

" User UTF-8 encoding.
set encoding=utf-8 nobomb

" Hide buffers after they are abandoned.
set hidden

" Disable files that don't need to be created.
set noswapfile
set nobackup
set nowb

" Auto complet menu.
set completeopt=longest,menu

" Set tab size.
set tabstop=4
set shiftwidth=4

" Auto indent.
set autoindent

" Replace trailing whitespace and tabs with unicode characters.
exec "set listchars=tab:\uBB\uBB,trail:\u2716,nbsp:~"
set list

" Enable syntax highlighting
syntax enable

" Set color scheme.
set t_Co=256
colorscheme molokai

" Persistent undo.
if v:version >= 703
	set undofile
	set undodir=~/.vim/tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
endif

" Open file and goto previous location.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
	\| exe "normal! g`\""
	\| endif

" Airline settings.
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:bufferline_echo = 0
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1

" Markdown settings.
let g:vim_markdown_folding_disabled = 1

" Vim session persist.
let g:session_autosave = 1
let g:session_autoload = 1

" NERDTree.
let g:NERDTreeDirArrows=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let g:NERDTreeWinSize = 35

" Make sure that shen NERDTree root is changed, Vim's pwd is also updated.
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeAutoCenter = 1

" Open NERDTree on startup when no file has been specified.
autocmd VimEnter * if !argc() | NERDTree | endif

" Neocomplete.
" Disable AutoCompPop.
let g:acp_enableAtStartup = 0

" Syntastic.
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Vim-go.
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_lsit_type = "quickfix"

" Show a list of interfaces which is implemented by the type under your
" cursor.
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor.
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor.
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser.
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage.
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)

" Enable syntax highlighting for functions, methods and structs.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1

" Tagbar.
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds' 		: [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin' 	: 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" Mappings.
" Disable Q (Command Shell Mode).
nnoremap Q <nop>
nnoremap gq <nop>
nnoremap q: <nop>
nmap * *Nzz
nmap # #Nzz

" Y y$ Fix.
nnoremap Y y$

" Easy window switching.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <C-Up> :tabnew<CR>
nmap <C-Down> :tabclose<CR>
nmap <C-Left> :tabprevious<CR>
nmap <C-Right> :tabnext<CR>

" Space folds and unfolds.
nnoremap <Space> za
vnoremap <Space> za

" Redraw the screen.
imap jj <Esc>:redraw!<CR>:syntax sync fromstart<CR>

" NERDTreeToggle.
function! NERDTreeToggleOrFocus()
	if expand("%") =~ "NERD_tree"
		:NERDTreeTabsToggle
	else
		call NERDTreeFocus()
	endif
endfunction
nmap <Leader>n :call NERDTreeToggleOrFocus()<CR>

" Quickfix list nav with C-n and C-m.
map <C-n> :cn<CR>
map <C-m> :cp<CR>

" Multipurpose Tab-key.
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		if CanExpandSnippet() > 0
			return "\<C-r>=TriggerSnippet()\<cr>"
		else
			return "\<c-p>"
		endif
	endif
endfunction

" Toggle Paste/No Paste.
function! TogglePaste()
	if &paste
		:set nopaste
	else
		:set paste
	endif
endfunction
nmap <Leader>p :call TogglePaste()<CR>

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 3

" Performance.
set ttyfast
set lazyredraw
syntax sync minlines=256

" Post configuration.
" Find local Vim files.
silent! source ~/.vimrc.local
silent! source ./.vimrc.local
" Remap mappings that get overwritten by plugins.
set rtp+=~/.vim/after/

set foldmethod=marker
