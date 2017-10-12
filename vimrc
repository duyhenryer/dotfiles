set number
set ai
set clipboard=unnamedplus
hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
filetype off
set mouse=a

call pathogen#infect()
call pathogen#helptags()


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'mileszs/ack.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'             " Indent  guide
Plugin 'majutsushi/tagbar'               " outline class viewer
Plugin 'godlygeek/tabular'               " vim-markdown dependency
Plugin 'joshdick/onedark.vim'
Plugin 'tmux-plugins/vim-tmux'           " tmuxconf color
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/rainbow_parentheses.vim'    " bracket color support
Plugin 'tpope/vim-surround'		 " parentheses, brackets, quotes, XML tags, and more
Plugin 'jiangmiao/auto-pairs' 
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'

""" Development
Plugin 'chrisbra/csv.vim'    
Plugin 'plasticboy/vim-markdown' 
Plugin 'Vimjas/vim-python-pep8-indent'
"Plugin 'Shougo/deoplete.nvim'
"" Python
Plugin 'python-mode/python-mode'
Plugin 'tpope/vim-sensible'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'Matt-Deacalion/vim-systemd-syntax'


call vundle#end()
filetype plugin indent on
syntax on


""" Plugin Configuration {{{  

""" Color scheme {{{

set t_Co=256
set background=dark
color onedark
let g:onedark_termcolors=256

""" }}}

""" Hightline {{{
if !has('gui_running')
	set t_Co=256
endif

""" indentLine {{{
" vim
let g:indentLine_color_term = 239
" gvim
let g:indentLine_color_gui = '#A4E57E'
" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

let g:indentLine_char = '┆'
"let g:indentLine_char = '│'

""" }}}

""" NERDTree {{{ 

" NERDTre size
let g:NERDTreeWinSize=30

map <F7> :NERDTreeToggle<CR>

" Quit on open
"let g:NERDTreeQuitOnOpen=1
"

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾' 
nmap <F8> :TagbarToggle<CR>

""" }}}

"""  Tagbar {{{
let g:tagbar_left = 0
let g:tagbar_width = 35
"}}}

""" vim-airline {{{ 


" vim-airline {{{

"" Disable powerline completely
let g:powerline_loaded = 1
let g:powerline_pycmd = 'py3'

set incsearch

" Exclude preview buffer
let g:airline_exclude_preview = 1

" Use airline fonts
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Powerline glyph
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'


" Tabline enhancement
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1

"let g:airline#extensions#tabline#show_close_button = 1
"let g:airline#extensions#tabline#close_symbol = 'X'

" Syntastic integration
let g:airline#extensions#syntastic#enabled = 1

" gitgutter/signify/changesPlugin//quickfixsigns intergration
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

" ctrlp integration
let g:airline#extensions#ctrlp#color_template = 'insert'

" tagbar integration
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'

" fugitive/lawrencium integration
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#format = 2


" virtualenv integration
"let g:airline#extensions#virtualenv#enabled = 1

" Nrrwrgn integration
let g:airline#extensions#nrrwrgn#enabled = 1

" vim-windowswap integration
let g:airline#extensions#windowswap#enabled = 1

" whitespace error detection
let g:airline#extensions#whitespace#enabled = 1

" Airline Theme
let g:airline_theme = "onedark"


""" }}}


 """  Rainbow parantheses {{{

let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

""" }}}

""" Python-mode {{{
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"

" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

"" python 3 syntax
let g:pymode_python = 'python3'

""" }}}

""" auto-pairs {{{

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

""" }}}

""" nerdcommenter {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" customize keymapping
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment

""" }}}

""" vim-gitgutter {{{
let g:gitgutter_max_signs = 1000
""" }}}

""" vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
""" }}}

""" vim-csv {{{
hi CSVColumnEven term=bold ctermbg=4 guibg=DarkBlue
hi CSVColumnOdd  term=bold ctermbg=5 guibg=DarkMagenta
let g:csv_highlight_column = 'n'
""" }}}

""" deoplete {{{
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete_start_length = 0
""" }}}


""" }}}

