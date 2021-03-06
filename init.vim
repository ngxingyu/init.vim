let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
let g:vim_bootstrap_langs = "c,go,html,javascript,python,typescript"
let g:vim_bootstrap_editor = "nvim"

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

let g:python3_host_prog = '~/miniconda3/envs/DataScience/bin/python3'
scriptencoding utf-8
source ~/.config/nvim/plugins.vim
syntax on
colorscheme molokai
set mouse=nvirh
set mousemodel=popup_setpos
set nonu rnu
set splitright
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
set cursorline
set foldmethod=syntax
set foldlevelstart=99
set clipboard=unnamedplus
set termguicolors
set conceallevel=1
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set title
set winheight=10
set winwidth=80
set winminheight=1
set winminwidth=5

let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}

lua << END
    require'nvim_lsp'.tsserver.setup{}
    require'nvim_lsp'.pyls.setup{}
    require'nvim_lsp'.leanls.setup{}
    require'nvim_lsp'.kotlin_language_server.setup{
    settings={kotlin={languageServer={path="/home/ngxingyu/kotlin-language-server/server/build/install/server/bin/"}}}}
    require'nvim_lsp'.bashls.setup{}
    require'nvim_lsp'.clangd.setup{}
    require'nvim_lsp'.texlab.setup{}
    require'nvim_lsp'.vuels.setup{}
    require'nvim_lsp'.jsonls.setup{}
    require'nvim_lsp'.gopls.setup{}
END
autocmd Filetype lean,tex,html,js,ts,css,python,go,c,cpp setl omnifunc=v:lua.vim.lsp.omnifunc
nnoremap <silent> ;dc <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ;df <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ;h  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ;i  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ;s  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> ;td <cmd>lua vim.lsp.buf.type_definition()<CR>
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('_', 'max_menu_width', 80)
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:slime_target = "neovim"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_cell_delimiter = "#%%"
let g:slime_python_ipython = 1
let g:python3_host_prog = '~/miniconda3/envs/DataScience/bin/python3'

let g:rg_command = 'rg --vimgrep -S'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_progname = 'nvr'
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"

"let g:tex_conceal="abdgm"
au FileType tex syn region texMathZoneZ matchgroup=texStatement start="\\eqn{"  start="\\eqns{" start="\\eqna{" start="\\eqnas{"    matchgroup=texStatement end="}" end="%stopzone\>"   contains=@texMathZoneGroup

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'



filetype plugin indent on
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

augroup go_files
autocmd!
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd Filetype go command! -bang Av call go#alternate#Switch(<bang>0, 'vsplit')
augroup end
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction


autocmd FileType c nnoremap <buffer> <F5> :w<CR>:!gcc -o %< % && ./%< <CR>
autocmd FileType cpp nnoremap <buffer> <F5> :w<CR>:!g++ -o %< % && ./%< <CR>
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

map <Space> <Leader>
nmap <F6> :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~
nnoremap <leader>bn :echo bufnr('%')<Enter>
nnoremap <leader>jn :echo b:terminal_job_id<Enter>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction


map <C-q> :q!<cr>
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
tnoremap <Esc> <C-\><C-n>
nnoremap <C-b>c :tabnew +terminal<CR>
tnoremap <C-b>c <C-\><C-n>:tabnew +terminal<CR>
nnoremap <C-b><C-j> :new +terminal<CR>
tnoremap <C-b><C-j> <C-\><C-n>:new +terminal<CR>
nnoremap <C-b><C-l> :vnew +terminal<CR>
tnoremap <C-b><C-l> <C-\><C-n>:vnew +terminal<cr>
augroup neovim_terminal
    autocmd!

    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert

    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
augroup END
noremap <Leader>bf :ls<CR>
nnoremap <leader>bq :bp <bar> bd! #<cr>
nnoremap <Leader><Left> :bp<CR>
nnoremap <Leader><Right> :bn<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
" screen:



