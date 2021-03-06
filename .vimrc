" General
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as wel sanely reset options when re-sourcing .vimrc
set nocompatible

" Set how many lines of history VIM has to remember
set history=500

"show statusline from begining
set laststatus=2

" Enable filetype plugins
" let &runtimepath.=',~/.vim/bundle/ale'
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null

" VIM User Interface

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid grabled characters in Chinese language window OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild Menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Line Numbers
set number

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden so it acts as it should act
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" enable mouse
set mouse=a

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tents of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

execute pathogen#infect()

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" Colors and Fonts
" Enable 256 colors palette in Gnome Terminal
" if has('gui_running')
"     set background=light
" else
"     set background=dark
" endif

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || !s:settings.is_win
    set t_Co=256
endif    

"try
" colorscheme desert
"catch
"endtry

" Enable syntax highlighting
let g:solarized_termcolors=16 
set background=dark
syntax enable
colorscheme solarized

" Set UTF8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Files, backups and undo

" Turn backup off, since most stuff is in SVN, git etc;
set nobackup
set nowb
set noswapfile

" Text, tab and indent related

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500


" lightline settings
let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified', 'Ale' ] ]
            \ },
            \ 'component': {
            \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
            \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
            \ },
            \ 'Component_function': {
            \  'ale': 'ALEGetStatusLine'
            \ },
            \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
            \ },
            \ 'separator': { 'left': '⮀', 'right': '⮂' },
            \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
            \ }

" Syntax Highlighting for js files using jsx
let g:jsx_ext_required = 0

" NerdTree Settings
" Hit the right arrow to open the node
let NERDTreeMapActivateNode='<right>'

" Display hidden files
let NERDTreeShowHidden=1

" Toggle display of the tree with <Leader>+k+b
nmap <leader>kb :NERDTreeToggle<CR>

" Always open the tree when booting Vim, but don’t focus it:
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Do not display some useless files in the tree:
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" set signcolumn=yes

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs = 1
" let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_javascript_eslint_exe = 'eslint_d'
" let g:syntastic_javascript_flow_exe = 'flow status'

" vim flow settings
let g:flow#enable = 0
let g:flow#autoclose = 1

"Vim-javascript rules
let g:javascript_plugin_flow = 1
"set foldmethod=syntax
" set conceallevel=1

" Ale Settings
let g:ale_emit_conflict_warnings = 0
" set statusline+=%#warningmsg#
" set statusline+=%{ALEGetStatusLine()}
" set statusline+=%*

" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_enter = 1
" let g:ale_lint_on_text_changed = 0
" let g:ale_linters = {
"     \  'javascript': ['eslint', 'flow'],
"     \}
" let g:ale_javascript_eslint_executable = 'eslint'
" let g:ale_javascript_eslint_options = ''
" let g:ale_javascript_eslint_use_global = 0 
" let g:ale_javascript_flow_executable = 'flow'
" let g:ale_javascript_flow_use_global = 0
" let g:ale_javascript_jshint_executable = 'jshint'
" let g:ale_javascript_jshint_use_global = 0
" let g:ale_javascript_standard_executable = 'standard'
" let g:ale_javascript_standard_options = ''
" let g:ale_javascript_standard_use_global = 0
" let g:ale_javascript_xo_executable = 'xo'
" let g:ale_javascript_xo_options = ''
" let g:ale_javascript_xo_use_global = 0


"Leave open even if errors and warnings are gone 
" let g:ale_open_list = 1
" let  g: ale_keep_ list_ window_open  =  1

" CTRLP to disable the folder to look up for
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" tern_for_vim settings
let g:tern#command = ["node", 'C:\cygwin64/home/pramod/.vim/bundle/tern_for_vim/node_modules/tern/bin/tern', '--no-port-file']
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

" Supertab settings and tern completion with supertab
augroup omnifunc
    autocmd!
    autocmd Filetype *
                \   if &omnifunc == "" |
                \       setlocal omnifunc=syntaxcomplete#Complete |
                \   endif
    autocmd FileType *
                \ if &omnifunc != '' |
                \   call SuperTabChain(&omnifunc, "<c-p>") |
                \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
                \ endif
augroup END

        "\   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
        " make autocomplete more like an IDE
        set completeopt=longest,menuone,preview
        "set complete=.,w,b,u,t,i,k
        set complete=.,k,t,i,d " t allows completing on tags, but that takes waaay too long
        " automatically open and close the popup menu / preview window
        " au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

        " supertab options
        let g:SuperTabLongestHighlight = 1
        let g:SuperTabClosePreviewOnPopupClose = 1
        let g:SuperTabLongestEnhanced = 1
        let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']


