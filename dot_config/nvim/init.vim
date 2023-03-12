set nocompatible
syntax on
set mouse=a
set noshowmatch
set guicursor=
set nohlsearch
set hidden
set showcmd
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set foldmethod=syntax
set foldlevel=1
" highlight ColorColumn ctermbg=0 guibg=lightgray
filetype plugin indent on
" Give more space for displaying messages.
set background=dark

"disable parenthesis highlighting
let loaded_matchparen = 1

let mapleader = " "

if executable('rg')
    let g:rg_derive_root='true'
endif

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <F5> :call Execute_program()<CR>
func! Execute_program()
    write
    if &filetype=='cpp' || &filetype=='c'
        exec "w" | exec "!g++ % -o %:r.o" | exec "belowright sp" | exec "resize 15" | exec "term ./%:r.o" 
    elseif &filetype=='python'
        exec "w"
        exec "!/bin/env python %"
    elseif &filetype=='html'
        exec "w"
        exec "!firefox %"
    elseif &filetype=='markdown'
        exec "MarkdownPreview"
    elseif &filetype=='go'
        exec  "w" | exec "!gofmt -w % && go run %"
    elseif &filetype=='javascript'
        exec  "w" | exec "!node %"
    endif
endfunc

nnoremap <F6> :call Compile_program()<CR>
func! Compile_program()
    write
    if &filetype=='cpp' || &filetype=='c'
        exec "w" | exec "!g++ -ggdb % -o %:r.o" | exec "belowright sp" | exec "resize 15" | exec "term gdb -q %:r.o"
    elseif &filetype=='python'
        exec "w"
        exec "!/bin/env python %"
    elseif &filetype=='html'
        exec "w"
        exec "!firefox %"
    elseif &filetype=='markdown'
        exec "MarkdownPreview"
    elseif &filetype=='go'
        exec  "w" | exec "!gofmt -w % && go run %"
    endif
endfunc


" windows management
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>pv :wincmd v<CR>

source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/plug-config/coc.vim

set background=dark
colorscheme gruvbox
" let g:coc_node_path = '/home/efficacy38/.nvm/versions/node/v18.12.1/bin/node'
