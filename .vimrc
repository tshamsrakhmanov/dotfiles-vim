syntax on
set autoindent
set number
set relativenumber
set mouse=a
set wrap
set formatoptions=tcqrnl
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set colorcolumn=0
set showcmd
set scrolloff=10
set backspace=indent,eol,start
set ttyfast
set ruler
set cursorline
set hlsearch
set nospell

colorscheme elflord

nnoremap <C-_> :terminal<CR>
nnoremap <C-]> :nohlsearch<CR>

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

nnoremap <S-h> gT
nnoremap <S-l> gt

highlight DiffChange cterm=NONE ctermfg=black ctermbg=DarkBlue
highlight DiffAdd    cterm=NONE ctermfg=black ctermbg=DarkGreen
highlight DiffDelete cterm=NONE ctermfg=white ctermbg=DarkRed
highlight DiffText   cterm=NONE ctermfg=black ctermbg=DarkCyan

set laststatus=2
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ [NORMAL]\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='i')?'\ \ [INSERT]\ ':''}
set statusline+=%#DiffVisual#%{(mode()=='v')?'\ \ [VISUAL]\ ':''}
set statusline+=%#DiffVisual#%{(mode()=='V')?'\ \ [VISUAL-LINE]\ ':''}
set statusline+=%#Visual#\ %f\ %m\ %r
set statusline+=%=
set statusline+=%#StatusLine#\ %y\ [%L]\ %p%%
