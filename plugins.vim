call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jremmen/vim-ripgrep'
Plug 'neovim/nvim-lsp'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'bfredl/nvim-ipy'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} "
Plug 'leanprover/lean.vim', {'for': 'lean'}
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jpalardy/vim-slime'
Plug 'cjrh/vim-conda', {'for': 'python'}
Plug 'junegunn/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'alvan/vim-closetag'
Plug 'brooth/far.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'

call plug#end()

