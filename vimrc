""""""""""""""""""""""""""""""""""
"         core settings          "
""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax enable
colorscheme koehler

set runtimepath+=~/.vim/plugins/*

let mapleader = "m"
""""""""""""""""""""""""""""""""""
"           settings             "
""""""""""""""""""""""""""""""""""
set ambiwidth=double
set nu
set autoindent
set vb t_vb=
set iminsert=0
set titlestring=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}
set laststatus=0
set linespace=4
set antialias
"set nobackup
set backupdir=~/.vim/backup
set directory=~/.vim/swp
"オートインデント時にタブが2つ入ることを防ぐ
set ts=4 sw=4 sts=0
set scrolloff=5
set wrap

if has('gui')
  " コマンドラインの高さ(GUI使用時)
  set cmdheight=1
  " ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
  set guioptions+=a
  " クリップボード
  set clipboard+=unnamed
  " ツールバー非表示
  set guioptions-=T
endif

""""""""""""""""""""""""""""""""""
"         auto command           "
""""""""""""""""""""""""""""""""""
au BufEnter * set bh=hide
au BufNewFile,BufRead *.scala setf scala
"set autochdir
au BufEnter * execute ":lcd " . substitute(expand("%:p:h")," ","\\\\ ","g")
" for ruby
autocmd FileType ruby  :setlocal tabstop=2
autocmd FileType ruby  :setlocal shiftwidth=2
autocmd FileType ruby  :setlocal expandtab
" for eruby
autocmd FileType eruby :setlocal tabstop=2
autocmd FileType eruby :setlocal shiftwidth=2
autocmd FileType eruby :setlocal expandtab
" for scala
autocmd FileType scala :setlocal tabstop=2
autocmd FileType scala :setlocal shiftwidth=2
autocmd FileType scala :setlocal expandtab


""""""""""""""""""""""""""""""""""
"            colors              "
""""""""""""""""""""""""""""""""""
hi Cursor	  guifg=bg	guibg=orange

""""""""""""""""""""""""""""""""""
"             map                "
""""""""""""""""""""""""""""""""""
map <silent> <S-u> :redo<CR>
map bn    :bnext<CR>
map <silent> <C-f> :bnext<CR>
map <silent> <C-b> :bprevious<CR>
"ウインドウのフォーカス移動
map  wh <C-w>h
map  wl <C-w>l
map  wj <C-w>j
map  wk <C-w>k
map gl :macaction selectNextWindow:<CR>
map gh :macaction selectPreviousWindow:<CR>

nnoremap <Space>.   :<C-u>edit   $MYVIMRC<Enter>
nnoremap <Space>s.  :<C-u>source $MYVIMRC<Enter>
nnoremap <Space>g.  :<C-u>edit   $MYGVIMRC<Enter>
noremap  <Space>gs. :<C-u>source $MYGVIMRC<Enter>

"コマンドモードで Ctl + v で貼り付ける
cmap <C-v> <C-R>+
"挿入モードで Ctl + v で貼り付ける
imap <C-v> <C-R>+
"全て選択
map  <C-a> ggvG$
"貼り付け
map  <C-v> "+gP
" バッファリストを表示
map <silent> <F3> :call BufferList()<CR>
" 編集履歴を表示
map <C-r> :MRU<CR>
" gvim で q → bd をしてる用
map <C-q><C-q><C-q> ZQ

""""""""""""""""""""""""""""""""""
"        neo complcache          "
""""""""""""""""""""""""""""""""""
let g:NeoComplCache_EnableAtStartup = 1
let g:NeoComplCache_SkipInputTime = '0.5'
" snippet ファイルの保存先
let g:NeoComplCache_SnippetsDir='~/.vim/snippets'
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" C-jでオムニ補完
inoremap <expr> <C-j> &filetype == 'vim' ? "\<C-x>\<C-v>\<C-p>" : "\<C-x>\<C-o>\<C-p>"
" C-kを押すと行末まで削除
inoremap <C-k> <C-o>D
" C-hで補完を続行しない
inoremap <expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
" C-nでneocomplcache補完
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 途中でEnterしたとき、ポップアップを消して改行し、
" 改行を連続して入力してもインデント部を保持する
inoremap <expr><CR> pumvisible() ? "\<C-y>\<CR>X\<BS>" : "\<CR>X\<BS>"
"
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
"map <silent> <ESC> <ESC>:set iminsert=0<CR>
" snippet 補完
imap <silent> <C-l> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-l> <Plug>(neocomplcache_snippets_expand)
command! -nargs=* Nes NeoComplCacheEditSnippets <args>
""""""""""""""""""""""""""""""""""
"             other              "
""""""""""""""""""""""""""""""""""
" hatena.vim
let g:hatena_user = 'basyura'
"let g:hatena_edit_new_tab = 1
" vimwiki
let g:vimwiki_list = [{'path':'~/dropbox/vimwiki/text/', 'path_html':'~/dropbox/vimwiki/html/'}]
" mru.vim
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*\|^/private/var\|COMMIT_EDITMSG'
let MRU_Max_Entries   = 20
let MRU_Window_Height = 21
let MRU_Add_Menu = 0
