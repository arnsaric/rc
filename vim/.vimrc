"Vimrc inspired by timsateroy@gmail.com, way less plugin-heavy

" Settings

set nocompatible                                "not vi-compatible

""" General settings
set cursorline                                  " hilight cursor line
set hidden                                      " buffer change, more undo
set history=1000                                " default 20
set iskeyword+=_,@                              " not word dividers
set laststatus=2                                " always show statusline
set linebreak                                   " don't cut words on wrap
set listchars=tab:>\                            " > to highlight <tab>
set list                                        " displaying listchars
set more                                        " ---more--- like less
set mouse=                                      " disable mouse
set noshowmode                                  " hide mode, got powerline
set noexrc                                      " don't use other .*rc(s)
set nostartofline                               " keep cursor column pos
set scrolloff=3                                 " lines above/below cursor
set shortmess+=I                                " disable startup message
set showcmd                                     " show cmds being typed
set splitbelow                                  " splits go below w/focus
set splitright                                  " vsplits go right w/focus
set vb t_vb=                                    " disable beep and flashing

""" Files
set autochdir                                   " always use curr. dir.
set autoread                                    " refresh if changed
set backup                                      " backup curr file
set backupdir=$HOME/.vim/backup                 " backup director{y,ies}
set backupext=~                                 " append ~ to backups
set confirm                                     " confirm changed files
set noautowrite                                 " never autowrite
set updatecount=50                              " update swp after 50chars

""" Search and replace
set incsearch                               " "live"-search
set hlsearch                                " highlight matches

""" Matching
set matchtime=2                             " time to blink match {}
set matchpairs+=<:>                         " for ci< or ci>
set showmatch                               " tmpjump to match-bracket

""" Syntax
filetype plugin indent on                   " detect file plugin+indent
syntax on                                   " syntax highlighting
set t_Co=256                                " 256-colors
set background=dark                         " we're using a dark bg
highlight Normal ctermbg=NONE               " use terminal background
highlight nonText ctermbg=NONE              " use terminal background
au BufRead,BufNewFile *.txt set ft=sh       " opens .txt w/highlight

""" Text formatting
set autoindent                                  " preserve indentation
set backspace=indent,eol,start                  " smart backspace
set cinkeys-=0#                                 " don't force # indentation
set expandtab                                   " no real tabs
set nrformats+=alpha                            " incr/decr letters C-a/-x
set shiftround                                  " be clever with tabs
set shiftwidth=8                                " default 8
set smartcase                                   " igncase,except capitals
set softtabstop=8                               " "tab" feels like <tab>
set tabstop=8                                   " replace <TAB> w/4 spaces
""" Only auto-comment newline for block comments
au FileType c,cpp setlocal comments -=:// comments +=f://
""" Highlight characters past 79 (toggleable)
let g:overlength_enabled = 1
highlight OverLength ctermbg=darkred
match OverLength /\%79v.*/
function! ToggleOverLengthHighlight()
        if g:overlength_enabled == 0
                match OverLength /\%79v.*/
                let g:overlength_enabled = 1
                echo 'OverLength highlighting turned on'
        else
                match
                let g:overlength_enabled = 0
                echo 'OverLength highlighting turned off'
        endif
endfunction

""" Folding
set foldcolumn=0                            " hide folding column
set foldmethod=indent                       " folds using indent
set foldnestmax=10                          " max 10 nested folds
set foldlevelstart=99                       " folds open by default

""" Autocomplete in Ex mode
set wildignore=.pyc,.o,.ojb,.a,                 " ignore said files
                        \.pdf,.jpg,.gif,.png,
                        \.avi,.mkv,.so
set wildmenu                                " better auto complete
set wildmode=longest,list                   " bash-like auto complete

""" Undo
if has('persistent_undo') && exists("&undodir")
        set undodir=$HOME/.vim/undo/            " where to store undofiles
        set undofile                            " enable undofile
        set undolevels=500                      " max undos stored
        set undoreload=10000                    " buffer stored undos
endif

"Keybindings

""" General
" Yank(copy) to system clipboard
noremap gy "+y
" Toggle text wrapping
nmap <silent> gw :set invwrap<CR>:set wrap?<CR>
" Toggle folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" Treat wrapped lines as normal lines
nnoremap j gj
nnoremap k gk
" Move a line of text using CTRL-{j,k}
nmap <C-j> mz:m+<CR>`z
nmap <C-k> mz:m-2<CR>`z
" Working ci(, works for both breaklined, inline and multiple ()
nnoremap ci( %ci(
" We don't need any help!
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>
" Toggle pastemode, doesn't indent
set pastetoggle=<F3>
" Toggle highlighting of chars past 79
nnoremap <C-h> :call ToggleOverLengthHighlight()<CR>

"Bars

""" Tabline
highlight TabLineFill ctermfg=NONE ctermbg=237 cterm=NONE
highlight TabLine ctermfg=241 ctermbg=235
highlight TabLineSel ctermfg=250 ctermbg=235

""" Statusline (inspired by github.com/Lokaltog/vim-powerline)
highlight CustomSLNMode cterm=bold ctermfg=22 ctermbg=148
highlight CustomSLNFName cterm=bold ctermfg=231 ctermbg=240
highlight CustomSLNModif cterm=bold ctermfg=196 ctermbg=240
highlight CustomSLNFormat ctermfg=245 ctermbg=235
highlight CustomSLNPct ctermfg=250 ctermbg=240
highlight CustomSLNLine cterm=bold ctermfg=236 ctermbg=252
highlight CustomSLNCol ctermfg=244 ctermbg=252
highlight CustomSLNOMode cterm=bold ctermfg=160 ctermbg=148
highlight CustomSLExMode cterm=bold ctermfg=245 ctermbg=233
highlight CustomSLVMode cterm=bold ctermfg=88 ctermbg=208
highlight CustomSLIMode cterm=bold ctermfg=23 ctermbg=231
highlight CustomSLIFName cterm=bold ctermfg=231 ctermbg=31
highlight CustomSLIModif cterm=bold ctermfg=196 ctermbg=31
highlight CustomSLIFormat ctermfg=117 ctermbg=24
highlight CustomSLIPct ctermfg=117 ctermbg=31
highlight CustomSLILine cterm=bold ctermfg=23 ctermbg=117
highlight CustomSLICol ctermfg=23 ctermbg=117
highlight CustomSLRMode cterm=bold ctermfg=231 ctermbg=160

let g:slcolors = {
        \   'n': ['%#CustomSLNMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , 'no': ['%#CustomSLNOMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , 'v': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , 'V': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , '': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , 's': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , 'S': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , '': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , 'i': ['%#CustomSLIMode#', '%#CustomSLIModif#', '%#CustomSLIFName#',
                \ '%#CustomSLIModif#', '%#CustomSLIFormat#', '%#CustomSLIPct#',
                \ '%#CustomSLILine#', '%#CustomSLICol#']
        \ , 'R': ['%#CustomSLRMode#', '%#CustomSLIModif#', '%#CustomSLIFName#',
                \ '%#CustomSLIModif#', '%#CustomSLIFormat#', '%#CustomSLIPct#',
                \ '%#CustomSLILine#', '%#CustomSLICol#']
        \ , 'Rv': ['%#CustomSLRMode#', '%#CustomSLIModif#', '%#CustomSLIFName#',
                \ '%#CustomSLIModif#', '%#CustomSLIFormat#', '%#CustomSLIPct#',
                \ '%#CustomSLILine#', '%#CustomSLICol#']
        \ , 'c': ['%#CustomSLExMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , 'cv': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , 'ce': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , 'r': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , 'rm': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , 'r?': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ , '!': ['%#CustomSLVMode#', '%#CustomSLNModif#', '%#CustomSLNFName#',
                \ '%#CustomSLNModif#', '%#CustomSLNFormat#', '%#CustomSLNPct#',
                \ '%#CustomSLNLine#', '%#CustomSLNCol#']
        \ }

let g:slmodetxt = {
        \   'n': ' N '
        \ , 'no': ' N '
        \ , 'v': ' V '
        \ , 'V': 'V-L'
        \ , '': 'V-B'
        \ , 's': ' S '
        \ , 'S': 'S-L'
        \ , '': 'S-B'
        \ , 'i': ' I '
        \ , 'R': ' R '
        \ , 'Rv': ' R '
        \ , 'c': 'CMD'
        \ , 'cv': 'CMD'
        \ , 'ce': 'CMD'
        \ , 'r': ' ? '
        \ , 'rm': ' ? '
        \ , 'r?': ' ? '
        \ , '!': ' ! '
        \ }

function! GetStatusline()
        let md = mode()
        let stl = g:slcolors[md][0]
        let stl .= ' '
        let stl .= g:slmodetxt[md]
        let stl .= ' '
        let stl .= g:slcolors[md][2]
        let stl .= ' %t'
        let stl .= g:slcolors[md][3]
        let stl .= ' '
        let stl .= '%{&modified?"+ ":""}'
        let stl .= '%{&modifiable?"":"RO "}'
        let stl .= g:slcolors[md][4]
        let stl .= '%='
        let stl .= '%{&ff} | '
        let stl .= '%{strlen(&fenc)?&fenc:"none"} | '
        let stl .= '%{strlen(&ft)?&ft:"noft"} '
        let stl .= g:slcolors[md][5]
        let stl .= ' %4P '
        let stl .= g:slcolors[md][6]
        let stl .= ' LN %3l'
        let stl .= g:slcolors[md][7]
        let stl .= ':%-3c '
        return stl
endfunction

set statusline=
set statusline+=%!GetStatusline()

"Misc

""" Return to last edit position when opening files
autocmd BufReadPost *
                        \ if line("'\"") > 0 && line("'\"") <= line("$") |
                        \     exe "normal! g`\"" |
                        \ endif

"Plugins

""" EasyMotion
let g:EasyMotion_leader_key = ','
let g:EasyMotion_keys = 'qsdfghjklmazertyuiopwxcvbnQSDFGHJKLMAZERTYUIOPWXCVBN'
