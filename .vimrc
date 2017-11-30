" Setup Vundle
set nocompatible
filetype off

set t_Co=256 " We support 256 colors
set laststatus=2 " Force vim-airline to always display

"set cc=80

let mapleader=","

let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_always_populate_location_list = 1
let g:airline_powerline_fonts = 1
let g:ycm_use_ultisnips_completer = 1
let g:ctrlp_root_markers = ['.go-deps']
let g:go_template_file = "sm.go"

set clipboard=unnamed


" customize the tmux powerline
" let g:tmuxline_preset = 'custom'


call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'gmarik/Vundle.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'fatih/vim-go'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
" Plug 'DrawIt'
Plug 'bling/vim-airline'
Plug 'raimondi/delimitmate'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'vim-ruby/vim-ruby'
Plug 'zenbro/mirror.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'epeli/slimux'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin indent on

set background=dark
colorscheme delek

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set tabstop=2
set shiftwidth=2
set expandtab

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>i <Plug>(go-info)
nmap <Leader>p :MirrorEdit prod<CR>
nmap <Leader>s :MirrorEdit staging<CR>
nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>f :NERDTreeFind<cr>
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>d :SlimuxREPLSendBuffer<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>

nnoremap <C-P> :GFiles<CR>


let g:go_bin_path = expand("~/bin")
"let g:go_auto_type_info = 1


" Fix Ultisnips to work with YCM
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

source ~/.vimrc.custom

let g:rustfmt_autosave = 1

set viminfo='100,<50,s10,h,f1
" set cmdheight=2

set smartcase

autocmd FileType proto setlocal noexpandtab
au BufNewFile,BufRead *.sls set filetype=yaml.jinja
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
