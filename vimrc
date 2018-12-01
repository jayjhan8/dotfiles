" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================
syntax on
set smartindent
set cindent
set smarttab
set number
set showcmd
set list
set listchars=tab:\|\ ,trail:«
set showmatch
set backspace=eol,start,indent
set hlsearch
set hidden
set modeline

" let mapleader = "\<Space>"
" ============================================================================
" }}} BASIC SETTINGS END
" ============================================================================

" To copy/paste in vim
" set clipboard=unnamed
" set shiftwidth=4 tabstop=4 noexpandtab

" ============================================================================
" AUTOCMD {{{
" ============================================================================
"if has("autocmd")
augroup vimrc
	autocmd!
	autocmd BufNewFile,BufRead *.html set filetype=html
	autocmd BufNewFile,BufRead *.json set filetype=js
	autocmd BufNewFile,BufRead *.eyaml set filetype=yaml
	autocmd BufNewFile,BufRead *.pp set filetype=sh
	autocmd BufNewFile,BufRead Vagrantfile set filetype=vagrant
	"au FileType javascript,python,html,css,sh,js,yaml setl sw=4 ts=2 noexpandtab
	au FileType html,css,vagrant,yaml setl sw=2 ts=2 expandtab
	au FileType js setl sw=4 ts=4 noexpandtab
	au FileType sh setl sw=4 ts=4 expandtab
	"au FileType cpp setl sw=4 ts=4 noexpandtab
	au BufNewFile,BufRead *.py setl 
				\ tabstop=4
				\ softtabstop=4
				\ shiftwidth=4
				\ textwidth=79
				\ expandtab
				\ autoindent
				\ fileformat=unix
				\ colorcolumn=110
				"\ foldmethod=indent
				\ foldlevel=99


	"" Reload .vimrc after editing and saving
	autocmd bufwritepost .vimrc source $MYVIMRC
augroup END
"endif

" }}} AUTOCMD END

" Install Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



function! BuildYCM(info)
	" info is a dictionary with 3 fields  
	" - name:   name of the plugin  
	" - status: 'installed', 'updated', or 'unchanged'  
	" - force:  set on PlugInstall! or PlugUpdate!  
	if a:info.status == 'installed' || a:info.force
		!/usr/local/bin/python3 install.py --gocode-completer
	endif
endfunction
" ============================================================================
" Vim-Plug {{{
" ============================================================================
se nocompatible              " be iMproved, requmred

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/surround.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/vimux'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'fatih/vim-go'
Plug 'junegunn/seoul256.vim'
Plug 'w0rp/ale'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-scripts/unimpaired.vim'
Plug 'vim-scripts/pydoc.vim'
Plug 'vim-scripts/virtualenv.vim'
Plug 'vim-scripts/SimpylFold'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/vimlatex'
Plug 'vim-scripts/Puppet-Syntax-Highlighting'
Plug 'vim-scripts/Tabular'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'kchmck/vim-coffee-script'
Plug 'qpkorr/vim-bufkill', {'on': 'BD'}
call plug#end()
" }}} Vim-Plug END


colorscheme seoul256
" NerdTree Config
map <C-n> :NERDTreeToggle<CR>
map <C-g> :NERDTreeFind<CR>
let NERDTreeShowLineNumbers=1

" Tmux config
let g:tmux_navigator_no_mappings = 1
"augroup vimrc
    "autocmd!
    ""au VimEnter * nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
"augroup END
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
let g:tmux_navigator_save_on_switch = 1

" Buffer Navigation
nnoremap <silent> [b :bp<cr>
nnoremap <silent> ]b :bn<cr>
"nnoremap <leader>x :b#<bar>bd# <cr>
" Buffer cleanup
nnoremap <leader>x :BD<CR> "Delete the current buffer without closing out the pane

" Location Navigation
nnoremap <silent> [l :lprev<cr>
nnoremap <silent> ]l :lnext<cr>

" Python
let python_highlight_all = 1
" Python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
	"project_base_dir = os.environ['VIRTUAL_ENV']
	"activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	"execfile(activate_this, dict(__file__=activate_this))
"EOF

"" Airline
" uses powerline font
let g:airline_powerline_fonts = 1

let g:airline_extensions = ['tabline']
" use tab extension
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 1
set laststatus=2

let g:airline#extensions#ale#enabled = 1
let g:airline_highlighting_cache = 1

" Colors for Solarized Darcula
"hi LineNr ctermfg=239 ctermbg=236
"hi Folded ctermfg=144 ctermbg=17
""hi CursorLine
"set cursorline
"hi clear cursorline
"hi CursorLineNr cterm=bold ctermfg=255 ctermbg=13


" RIPGREP
"if executable('rg')
    "let g:ackprg = 'rg -s --vimgrep --type-add=tags:tags --type-not tags'
    "let g:ctrlp_user_command = 'rg -u --files %s'
"endif

" Vimux
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>

" SimpyIFold
let g:SimpylFold_docstring_preview = 1

" Markdown
let g:markdown_enable_folding = 0
let g:markdown_enable_spell_checking = 0

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['pylint']

" Fugitive
let g:fugitive_gitlab_domains = ['https://gitlab-app.eng.qops.net']

" Vim command mode
set wildmode=longest,list,full
set wildmenu

" Pydoc
let g:pydoc_cmd = 'python3 -m pydoc'


if has('gui_running')
	set guifont=Menlo:h14 columns=80 lines=40
	silent! colo seoul256-light
else
	silent! colo seoul256
endif

" ----------------------------------------------------------------------------
" ALE
" ----------------------------------------------------------------------------
let g:ale_linters = {'python': ['pylint'], 
			\ 'yaml': ['yamllint'],
			\ 'scala':[],
			\ 'markdown': ['remark_lint', 'alex'],
			\ 'javascript': ['eslint' ],
			\  'typescript': ['prettier', 'tslint', 'tsserver', 'typecheck'],
			\}

"let g:ale_javascript_eslint_executable='yarn run eslint:client'
"let g:ale_javascript_eslint_options='--config .eslintrc.client.json'
"let g:ale_fixers = {'ruby': ['rubocop']}
let g:ale_lint_delay = 1000
let g:ale_cache_executable_check_failures = 1
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)

" ----------------------------------------------------------------------------
" ULTISNIPS
" ----------------------------------------------------------------------------

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-.>"
"let g:UltiSnipsJumpBackwardTrigger="<c-,>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style='numpy'

" YCM
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0 
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_max_diagnostics_to_display = 10 "let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_server_python_interpreter = "/usr/local/bin/python3"
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"" YCM PYTHON
let g:ycm_python_binary_path = '/usr/local/bin/python3'

" SuperTab
let g:SuperTabDefaultCompletionType = "<C-n>"

" make YCM compatible with UltiSnips (using supertab)
 let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
 let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
"
" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<TAB>"
let g:UltiSnipsJumpForwardTrigger = "<TAB>"
let g:UltiSnipsJumpBackwardTrigger = "<s-TAB>"

" Profiling
nnoremap <silent> <leader>PS :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>PP :exe ":profile pause"<cr>
nnoremap <silent> <leader>PC :exe ":profile continue"<cr>
nnoremap <silent> <leader>PQ :exe ":profile pause"<cr>:noautocmd qall!<cr>
let g:vim_json_syntax_conceal = 0

"" FZF quickaction
nnoremap <silent> <expr> <c-p> (expand('%') =~ 'NERD_tree' ?"\<c-w>\<c-w>" : '').":GFiles\<cr>"
"nnoremap <silent> <Leader>b  :Buffers<CR>
nnoremap <silent> <Leader><Leader>  :Buffers<CR>
"nnoremap <silent> <Leader>rg  :Rg
nnoremap <Leader>rg :Rg<Space>
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>`        :Marks<CR>

" look for this word in visual mode
vnoremap // y/<C-R>"<CR>



" Always paste with set nopaste in insert mode from system clipboard
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction
