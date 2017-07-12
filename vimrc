set number
set ai

"C/C++ -> Snippets -> template setup wizard

let g:C_UseTool_cmake   = 'yes'
let g:C_UseTool_doxygen = 'yes'

set nocompatible
filetype off
set mouse=a

" Show current line
set cursorline

" Limit completion popup height
set pumheight=20

set lazyredraw

" folding
set foldenable
set foldmethod=marker
set foldlevel=0


set clipboard=unnamedplus





"pathogen
execute pathogen#infect()
syntax on

"python plugin
call pathogen#infect()
call pathogen#helptags()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'valloric/youcompleteme'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'

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


" Misc
Plugin 'tmux-plugins/vim-tmux'           " tmuxconf color
Plugin 'vimperator/vimperator.vim'       " vimperatorrc color
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'Matt-Deacalion/vim-systemd-syntax'

Plugin 'rudes/vim-java'
Plugin 'artur-shaik/vim-javacomplete2'   " https://github.com/artur-shaik/vim-javacomplete2


call vundle#end()
filetype plugin indent on

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf_openframeworks.py"

" IndentLine {{{

" vim
let g:indentLine_color_term = 239
" gvim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

let g:indentLine_char = '┆'

" }}}

" NERDTree
"{{{
" NERDTre size
let g:NERDTreeWinSize=30

" Quit on open
let g:NERDTreeQuitOnOpen=1
"
"}}}

"{{{
" Tagbar
let g:tagbar_left = 0
let g:tagbar_width = 30
"}}}



