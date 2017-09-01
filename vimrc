set number
set ai

let g:C_UseTool_cmake   = 'yes'
let g:C_UseTool_doxygen = 'yes'

set nocompatible

set mouse=a

" Show current line
set cursorline
"nnoremap <Leader>c :set cursorline!
"cursorcolumn!<CR>
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white

" Limit completion popup height
set pumheight=20

set lazyredraw

" folding
set foldenable
set foldmethod=marker
set foldlevel=0


set clipboard=unnamedplus

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
 Plugin 'scrooloose/nerdcommenter'

Plugin 'Yggdroot/indentLine'             " Indent  guide
Plugin 'jiangmiao/auto-pairs'            " auto close bracets
Plugin 'kien/rainbow_parentheses.vim'    " bracket color support
Plugin 'gorodinskiy/vim-coloresque'      " Color preview

" Development
Plugin 'Shougo/deoplete.nvim'
Plugin 'vim-syntastic/syntastic'
Plugin 'SirVer/ultisnips' | Plugin 'honza/vim-snippets' " Snippets
Plugin 'airblade/vim-rooter'             " Automatic change working dir
Plugin 'tpope/vim-fugitive'              " Git commands for vim
Plugin 'majutsushi/tagbar'               " outline class viewer
Plugin 'Shougo/context_filetype.vim'     " context filetype for neocomplete
Plugin 'xolox/vim-easytags'              " auto ctags
Plugin 'xolox/vim-misc'                  " Misc functions - helper for other plugins
Plugin 'aliou/moriarty.vim'
Plugin 'sjl/gundo.vim'

Plugin 'Chiel92/vim-autoformat'          " Code formatter
Plugin 'airblade/vim-gitgutter'          " Git left column
Plugin 'mattn/emmet-vim'                 " HTML/CSS Quick coding
Plugin 'godlygeek/tabular'               " vim-markdown dependency
Plugin 'plasticboy/vim-markdown'         " markdown control
Plugin 'jtratner/vim-flavored-markdown'  " github markdown for vim
Plugin 'hynek/vim-python-pep8-indent'    " Python indentation helper
Plugin 'chrisbra/csv.vim'                " CSV extended features
Plugin 'joshdick/onedark.vim'
Plugin 'Shougo/neocomplete.vim'
" Python
Plugin 'python-mode/python-mode.git'
Plugin 'chrisbra/NrrwRgn'

" Misc
Plugin 'tmux-plugins/vim-tmux'           " tmuxconf color
Plugin 'vimperator/vimperator.vim'       " vimperatorrc color
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'Matt-Deacalion/vim-systemd-syntax'

"Java
Plugin 'robertbraeutigam/vim-java-tags'
Plugin 'rudes/vim-java'
Plugin 'artur-shaik/vim-javacomplete2'   " https://github.com/artur-shaik/vim-javacomplete2
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()


"let g:ycm_global_ycm_extra_conf = ~/.vim/.ycm_extra_conf_openframeworks.py"

" youcompleteme
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" IndentLine {{{

" vim
let g:indentLine_color_term = 239
" gvim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

let g:indentLine_char = '┆'
"let g:indentLine_char = '│'
" }}}

" NERDTree
"{{{
" NERDTre size
let g:NERDTreeWinSize=30

map <C-n> :NERDTreeToggle<CR>

" Quit on open
"let g:NERDTreeQuitOnOpen=1
"


let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


"}}}


nmap <F8> :TagbarToggle<CR>

"{{{
" Tagbar
let g:tagbar_left = 0
let g:tagbar_width = 45
"}}}

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

"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

" Tabline enhancement
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1

"nmap <leader>1 <Plug>AirlineSelectTab1
"nmap <leader>2 <Plug>AirlineSelectTab2
"nmap <leader>3 <Plug>AirlineSelectTab3
"nmap <leader>4 <Plug>AirlineSelectTab4
"nmap <leader>5 <Plug>AirlineSelectTab5
"nmap <leader>6 <Plug>AirlineSelectTab6
"nmap <leader>7 <Plug>AirlineSelectTab7
"nmap <leader>8 <Plug>AirlineSelectTab8
"nmap <leader>9 <Plug>AirlineSelectTab9
"nmap <leader>p <Plug>AirlineSelectPrevTab
"nmap <leader>n <Plug>AirlineSelectNextTab

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

" csv integration
"let g:airline#extensions#csv#enabled = 1

" virtualenv integration
"let g:airline#extensions#virtualenv#enabled = 1

" Nrrwrgn integration
let g:airline#extensions#nrrwrgn#enabled = 1

" vim-windowswap integration
let g:airline#extensions#windowswap#enabled = 1

" integration with vim-bufferline
"let g:airline#extensions#bufferline#enabled = 1
"let g:airline#extensions#bufferline#overwrite_variables = 1

" YouCompleteMe integration
"let g:airline#extensions#ycm#enabled = 1
"let g:airline#extensions#ycm#error_symbol = '✗'
"let g:airline#extensions#ycm#warning_symbol = '⚡'

" word counting
"let g:airline#extensions#wordcount#enabled = 1

" whitespace error detection
let g:airline#extensions#whitespace#enabled = 1

" Airline Theme
let g:airline_theme = "onedark"

" }}}


" Nrrwrgn integration
let g:airline#extensions#nrrwrgn#enabled = 1



" ListToggle {{{
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10
" }}}

" Rainbow parantheses {{{

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

" }}}


"vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
"}}}

" autopairs {{{
let g:AutoPairsShortcutToggle = '<M-slash>'

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
"}}}


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


 let g:neocomplcache_enable_at_startup = 1



" gundo {{{
let g:gundo_width = 10
let g:gundo_preview_height = 40  "40
let g:gundo_help=0

let g:gundo_preview_bottom=1
let g:gundo_close_on_revert=1
"map <leader>u :GundoToggle<CR>
" }}}

let g:pymode_indent = 0

" vim-rooter {{{

let g:rooter_use_lcd = 1
let g:rooter_resolve_links = 0
"let g:rooter_silent_chdir = 1
let g:rooter_change_directory_for_non_project_files = 'current'

" }}}


let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"java
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" UltiSnips {{{

let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsListSnippets = "<c-x>"
" }}}

"{{{
" Reformat file
noremap <leader>fm :Autoformat<CR>
map <leader>r :GundoToggle<CR>
" }}}


nmap <leader>b <C-w>=

" Open Tagbar
nmap <leader>t :TagbarToggle<CR><C-w>=


" Navigation through windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" cpp {{{
augroup filetype_cpp
    autocmd!
    autocmd FileType cpp autocmd BufWritePre <buffer> :%s/\s\+$//e
    "autocmd FileType cpp TagbarOpen
    autocmd FileTYpe cpp set makeprg=make\ -C\ ../build\ -j9
    "autocmd FileType cpp set textwidth=80

    autocmd Filetype cpp nnoremap <F3> :YcmCompleter GoTo<CR>
    autocmd FileType cpp call ReadCPPTags()
    autocmd FileType cpp nnoremap <C-f> :%!astyle --options=$HOME/.vim/astyle/cpp-custom<CR>

    autocmd Syntax cpp call EnhanceCppSyntax()
augroup END

" }}}

" cs {{{

augroup filetype_cs
    autocmd!
    autocmd FileType cs noremap <F5> :!vim-build-cs "%:p"<CR>
    "autocmd FileType cs noremap <buffer> <c-f> :call CSSBeautify()<cr>
    "autocmd FileType cs vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
    autocmd FileType cs nnoremap <C-f> :%!astyle --options=$HOME/.vim/astyle/cpp-custom<CR>
augroup END

" }}}

" css {{{

augroup filetype_css
    autocmd!
    autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
    autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
augroup END

" }}}

" csv {{{
aug CSV_Editing
        au!
        au BufRead,BufWritePost *.csv :%ArrangeColumn
        au BufWritePre *.csv :%UnArrangeColumn
    aug end
" }}}

""" {{{
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<F5>'
let g:ctrlp_cmd = 'CtrlP'

"""}}}


" html {{{

augroup filetype_html
    autocmd!
    autocmd FileType html set ft=htmldjango
    autocmd FileType html set colorcolumn=81
    autocmd FileType html set tabstop=4
    autocmd FileType html set softtabstop=4
    autocmd FileType html set shiftwidth=4
    "autocmd FileType html vmap <c-f>  :!tidy -config "$HOME/.config/tidy.conf"<CR><CR>
    "autocmd FileType html nnoremap <F5> :silent exec "!firefox-dev \"%:p\" &>/dev/null &"<CR>:redraw!<CR>
    autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
    autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>

augroup END
" }}}

" java {{{

augroup filetype_java
    autocmd!
    "autocmd FileType java let g:EclimFileTypeValidate = 1
    autocmd FileType java set tabstop=2
    autocmd FileType java set softtabstop=2
    autocmd FileType java set shiftwidth=2
    autocmd FileType java set colorcolumn=101
    "autocmd FileType java set textwidth=100
    "autocmd FileType java TagbarOpen
    autocmd FileType java autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

" }}}

" javascript {{{

augroup filetype_js
    autocmd!
    "autocmd FileType javascript set textwidth=80
    autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
    autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
    autocmd FileType javascript nmap <F5> :!urxvtc -hold -e seed "%:p"<CR><CR>
    autocmd FileType javascript set tabstop=4
    autocmd FileType javascript set softtabstop=4
    autocmd FileType javascript set shiftwidth=4
    autocmd FileType javascript set colorcolumn=81
augroup END

" }}}

" json {{{

augroup filetype_json
    autocmd!
    autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
    autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
augroup END

" }}}

" jsx {{{

augroup filetype_jsx
    autocmd!
    autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
    autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
augroup END

" }}}

" markdown {{{

augroup filetype_md
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" }}}

" PHP {{{
" Override syntax highlighting
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

augroup filetype_php
    autocmd!
    autocmd FileType php vmap <C-f> :Autoformat<CR>
    autocmd FileType php nmap <F5> :!clear && php "%:p"<CR>
augroup END

" }}}

" python {{{
augroup filetype_py
    autocmd!
    " TODO active pygtk completion
    "autocmd FileType python TagbarOpen
    autocmd FileType python set tabstop=4
    "autocmd FileType python set textwidth=79
    autocmd FileType python set colorcolumn=80
    autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    autocmd FileType python autocmd BufWritePre <buffer> :%s/\s\+$//e
    autocmd FileType python call PythonKeywordHighlight()
    autocmd FileType python nmap <F5> :!clear && ipython "%:p"<CR>
    autocmd FileType python nmap <F6> :!clear && ipython -m pudb "%:p" <CR><CR>
    autocmd FileType python vmap <C-f> :Autoformat<CR>
augroup END



" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" }}}

" ruby {{{
augroup filetype_rb
    autocmd!
    "autocmd FileType ruby TagbarOpen
    autocmd FileType ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

" }}}

" scala {{{

augroup filetype_scala
    autocmd!
    "autocmd FileType scala let g:EclimFileTypeValidate = 1
    autocmd FileType scala set tabstop=2
    autocmd FileType scala set softtabstop=2
    autocmd FileType scala set shiftwidth=2
    autocmd FileType scala set colorcolumn=101
    "autocmd FileType scala set textwidth=100
    "autocmd FileType scala TagbarOpen
    autocmd FileType scala autocmd BufWritePre <buffer> :%s/\s\+$//e

    if has('gui_running')
        "autocmd FileTYpe scala set lines=50 columns=140
    endif
augroup END
" }}}
""" Javascript {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
"" Concealing Characters"
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1
set foldmethod=syntax


"""}}}

""" {{{{
" html
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode."
"just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"<C-Y>
let g:user_emmet_leader_key='<C-Z>'

" Add wed-api
"let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))

""" //5
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

"""}}}}
set  rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256


"""  java
"autocmd FileType java setlocal omnifunc=javacomplete#Complete


"let g:JavaComplete_MavenRepositoryDisable = 1

