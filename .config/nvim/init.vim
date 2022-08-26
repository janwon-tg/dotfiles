let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_calls = 1
let g:go_list_type = "quickfix"
"let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let g:go_metalinter_autosave = 1

let mapleader = ","

"xmap ga <Plug>(EasyAlign)
"nmap ga <Plug>(EasyAlign)
"vmap <Enter> <Plug>(EasyAlign)

nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
nmap <leader>f <Plug>(go-test-func)
nmap <leader>t <Plug>(go-test)
nmap <leader>r <Plug>(go-run)
nmap <leader>i <Plug>(go-info)
nmap <leader>c <Plug>(go-coverage-toggle)
nmap <leader>gd <Plug>(go-decls)
nmap <leader>ga <Plug>(go-decls-dir)
command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <C-s>$ :source $MYVIMRC<CR>

set noexpandtab
set tabstop=4
set shiftwidth=4

set autowrite


call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/molokai'
Plug 'cohama/lexima.vim'
Plug 'mattn/vim-goaddtags'

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

" run :GoBuild or :GotestCompile based on the *.go or *_test.go
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
	  call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
	  call go#cmd#Build(0)
  endif
endfunction

let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
