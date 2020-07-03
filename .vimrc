""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Your Highness .vimrc 2016-03-21
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""
"Compatibility
"""
set nocompatible
set bs=2 "set backspace to be able to delete previous characters
"set backupdir=/tmp
set directory=/tmp

"""
"Look'n'Feel
"""
set history=1000
"set title
"remove annoying saving feature
set hidden
"set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
set cursorline
set ruler
"Linenumbers
set number
set numberwidth=4
"show linebreaks
set list
"Word wrapping and line width
set nowrap
set tw=80
set cc=+1
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
"Set color scheme
set t_Co=256
syntax enable
colorscheme elflord
"Splitting (vsp -> right, sp -> below)
set splitright
set splitbelow
"Close a split with ,d in normal mode switching to previous buffer
nmap ,d :b#<bar>bd#<CR>
"Wildcard completion
set wildmenu
set wildmode=list:longest


"""
"Tab settings
"""
set tabstop=2
set shiftwidth=2 "use ts setting
set softtabstop=0 "set tab character to 4 characters
set expandtab "turn tabs into whitespace


"""
"Indentation
"""
set autoindent
set smartindent
filetype indent on
"Folds
set foldenable
set foldlevelstart=0
set fdm=indent
hi Folded ctermbg=black
"Set space to toggle a fold completly
nnoremap <space> za
vnoremap <space> zf


"""
"Filetype behavior
"""
filetype plugin on
"vim-r-plugin
"let vimrplugin_term = "xterm"
"let vimrplugin_screenplugin = 0
"let vimrplugin_term_cmd = "/usr/bin/Eterm --scrollbar 1 "

"""
"Search
"""
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>


"""
"Spell Checking
""""
"set spell"only switch on if needed
set spelllang=en_us
set spellsuggest=4 "show only 9 suggestions for misspelled words

"""
"Pasting
"""
set pastetoggle=<F10>
"nnoremap <C-e> 3<C-e>
"nnoremap <C-y> 3<C-y>


"""
"Hacks
"""
let mapleader = '\'
nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>

"no linewise up and down
nmap j gj
nmap k gk

"emacs ike commandline controls
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

"go to previous buffer
nmap <C-e> :b#<CR>

"better buffer navigation
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
"other peoples code wrapping corrected
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

"""
"Plugins
"""
""Pathogen
"execute pathogen#infect()
""Slime send text through screen
"let g:slime_target = "screen"
"let g:slime_paste_file = tempname()
""Syntastic (recommend from https://github.com/scrooloose/syntastic)
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
""R spell checker (needs lint package -> install.packages("lint") )
"let g:syntastic_r_lint_styles = 'list(spacing.indentation.notabs, spacing.indentation.evenindent)'
"let g:syntastic_java_checkers = []
""CtrlP Fuzzy Filesearch
"nmap ] :CtrlPBuffer<CR>
"let g:ctrlp_map = '<Leader>t'
"let g:ctrlp_match_window_bottom = 0
"let g:ctrlp_match_window_reversed = 0
"let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_dotfiles = 0
"let g:ctrlp_switch_buffer = 0
""NERDtree
"nmap \e :NERDTreeToggle<CR>
""Airline
"set laststatus=2

"snakemake
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake
