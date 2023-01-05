call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    " Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " coc go language server
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Use release branch (recommend)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " nice looking
    Plug 'gruvbox-community/gruvbox'

    " snippets
    Plug 'mbbill/undotree'
    " for auto vim comment
    Plug 'tpope/vim-commentary'

    " for python auto format
    " Plug 'igorpejic/vim-black'
    Plug 'psf/black'
    Plug 'rust-lang/rust.vim'
    Plug 'darrikonn/vim-gofmt'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-dispatch'
    Plug 'theprimeagen/vim-be-good'
    Plug 'gruvbox-community/gruvbox'
    Plug 'tpope/vim-projectionist'
    Plug 'tomlion/vim-solidity'
    Plug 'lyuts/vim-rtags'
    " Plug 'https://github.com/ycm-core/YouCompleteMe.git'

call plug#end()
