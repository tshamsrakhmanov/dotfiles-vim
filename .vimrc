syntax on
set autoindent
filetype plugin indent on
set pastetoggle=<F2>
set number
set relativenumber
set mouse=a
set wrap
set formatoptions=tcqrnl
set smartindent
set tabstop=8
set shiftwidth=4
set softtabstop=4
" set expandtab
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
let mapleader=" "

" setup HISTORY and its file
" -- DONT FORGET TO MKDIR IT !!!
set undofile
set undodir=~/.vim/undodir

set background=dark
colorscheme retrobox

nnoremap <C-_> :terminal<CR>
nnoremap <C-]> :nohlsearch<CR>

nnoremap <S-h> gT
nnoremap <S-l> gt

" auto complite works
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" some goode example how to work with executing smth with buffer on screen
" in this case - reformat xml or jq
" ...if you have exact software, of course
nnoremap <leader>x :%!xmlstarlet fo<CR>
nnoremap <leader>j :%!jq .<CR>

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
set statusline+=%#StatusLine#\ %y\ [%L]\ %p%%\ \[%l:%c\]

" COMMENTING EVERYWHERE
function! ToggleComment() range
    let l:cs = substitute(&commentstring, '\s*%s.*', '', '')
    if empty(l:cs)
	echohl WarningMsg | echo 'No commentstring for this filetype ' | echohl None
	return
    endif
    let l:esc = escape(l:cs, '*/\')
    for l:lnum in range(a:firstline, a:lastline)
	let l:line = getline(l:lnum)
	if l:line =~ '^\s*' . l:esc
	    call setline(l:lnum, substitute(l:line, '^\(\s*\)' . l:esc . '\s\?', '\1', ''))
	else
	    call setline(l:lnum, substitute(l:line, '^\(\s*\)', '\1' . l:cs . ' ', ''))
	endif
    endfor
endfunction

nnoremap <leader>c :call ToggleComment()<CR>
vnoremap <leader>c :call ToggleComment()<CR>
" COMMENTING EVERYWHERE

" AUTOCOMPLITE BETTER
" just works with tab and thats it!
function! SmartTab()
    if pumvisible()
	return "\<C-n>"
    endif
    if col('.') > 1 && getline('.')[col('.') -2] =~ '\k'
	return "\<C-n>"
    endif
    return "\<Tab>"
endfunction


inoremap <Tab> <C-R>=SmartTab()<CR>
inoremap <S-Tab> <C-R>=pumvisible() ? "\<C-p>" : "\<S-Tab>"<CR>
" AUTOCOMPLITE BETTER
