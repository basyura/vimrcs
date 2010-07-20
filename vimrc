""""""""""""""""""""""""""""""""""
"         core settings          "
""""""""""""""""""""""""""""""""""
if expand("%") != ".git/COMMIT_EDITMSG"
	filetype plugin indent on
	syntax enable
	colorscheme koehler
	set runtimepath+=~/.vim/plugins/*
endif

let mapleader = "m"

" settings {{{

""""""""""""""""""""""""""""""""""
"           settings             "
""""""""""""""""""""""""""""""""""
source ~/.vimrc_pass
set ambiwidth=double
set nu
set autoindent
set iminsert=0
set titlestring=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}
set laststatus=0
set linespace=2
set antialias
"set nobackup
set backupdir=~/.vim/backup
set directory=~/.vim/swp
"オートインデント時にタブが2つ入ることを防ぐ
set ts=4 sw=4 sts=0
set scrolloff=5
set wrap
set hlsearch
set smartindent

" ubuntu だと画面がちらつく。mac だと音が出ちゃう。
if has('mac')
  set vb t_vb=
endif

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

"}}}

" auto command {{{

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

"}}}

"hi {{{

""""""""""""""""""""""""""""""""""
"            colors              "
""""""""""""""""""""""""""""""""""
hi Cursor	  guifg=bg	guibg=orange

"}}}

" map {{{

""""""""""""""""""""""""""""""""""
"             map                "
""""""""""""""""""""""""""""""""""
map <silent> <S-u> :redo<CR>
map bn    :bnext<CR>
"map <silent> <C-f> :bnext<CR>
"map <silent> <C-b> :bprevious<CR>
"imap <silent> <C-f> <ESC>:bnext<CR>
"imap <silent> <C-b> <ESC>:bprevious<CR>
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
inoremap <C-d> <Del>
cmap <C-d> <Del>

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
map <silent> <C-l> <ESC>:call BufferList()<CR>
" gvim で q → bd をしてる用
map <C-q><C-q><C-q> ZQ

"imap <C-e> <End>
imap <C-a> <HOME>
"}}}

" neocomplcache {{{
""""""""""""""""""""""""""""""""""
"        neo complcache          "
""""""""""""""""""""""""""""""""""
" 起動時に有効
let g:neocomplcache_enable_at_startup = 1

" snippet ファイルの保存先
let g:neocomplcache_snippets_dir='~/.vim/snippets'
" dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'objc' : $HOME . '/.vim/dict/objc.dict',
    \ 'javascript' : $HOME . '/.vim/dict/js.dict',
    \ 'default' : $HOME . '/.vim/dict/default.dict'
\ }
" 日本語をキャッシュしない
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" 補完候補の数
"let g:neocomplcache_max_list = 5
" 補完しなくなる文字数
let g:neocomplcache_enable_auto_select = 1
" 補完しないパターン
let g:neocomplcache_disable_caching_buffer_name_pattern = '.*fuf.*|*.log'
let g:neocomplcache_lock_buffer_name_pattern = '*.log'
"入力に大文字が含まれている場合は、大文字・小文字を無視しない 
let g:neocomplcache_enable_smart_case = 1
" 辞書読み込み
noremap  <Space>d. :<C-u>NeoComplCacheCachingDictionary<Enter>
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" C-jでオムニ補完
inoremap <expr> <C-j> &filetype == 'vim' ? "\<C-x>\<C-v>\<C-p>" : "\<C-x>\<C-o>\<C-p>"
" C-kを押すと行末まで削除
inoremap <C-k> <C-o>D
" C-nでneocomplcache補完
inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
" C-pでkeyword補完
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
" 補完候補が出ていたら確定、なければ改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
" 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" 補完をアンドゥ
inoremap <expr><C-u>  neocomplcache#undo_completion()


inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
"map <silent> <ESC> <ESC>:set iminsert=0<CR>
" snippet 補完
imap <silent> <C-l> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-l> <Plug>(neocomplcache_snippets_expand)
command! -nargs=* Nes NeoComplCacheEditSnippets <args>

"}}}

" misc {{{

""""""""""""""""""""""""""""""""""
"             misc               "
""""""""""""""""""""""""""""""""""
" hatena.vim
let g:hatena_user = 'basyura'
"let g:hatena_edit_new_tab = 1
" vimwiki
let g:vimwiki_list = [{'path':'~/dropbox/vimwiki/text/', 'path_html':'~/dropbox/vimwiki/html/'}]
" mru.vim
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*\|^/private/var\|COMMIT_EDITMSG'
let MRU_Max_Entries   = 50
let MRU_Window_Height = 21
let MRU_Add_Menu = 0
" taglist
map <C-e> :Tlist<CR>
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Show_One_File = 1
let Tlist_Close_On_Select = 1
" ubuntu の時だけ
if !has('mac') && !has('win32')
	inoremap <silent> <esc> <esc>:call ForceImeOff()<cr>
	inoremap <silent> <C-[> <esc>:call ForceImeOff()<cr>
	inoremap <silent> <C-c> <esc>:call ForceImeOff()<cr>
	function! ForceImeOff()
		let imeoff = system('xvkbd -text "\[Control]\[Shift]\[space]" > /dev/null 2>&1')
	endfunction
endif
	
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" for rails.vim
map <silent> <Leader>r :<C-u>R<CR>


" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>

"}}}

"fuf {{{
"let g:fuf_keyOpen = ":"
map <silent> <C-n> :FufBuffer<CR>
map <silent> <Leader>d :<C-u>CD<CR>:FufFile<CR>
map <Leader>f :FufFile **/
" 編集履歴を表示
map <C-r> :FufMruFile<CR>
map <Leader>b :FufBookmark<CR>
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_maxMenuWidth = 100
let g:fuf_mrufile_exclude = '\v\~$|\.bak$|\.swp|/private/var/*|/private/tmp/*|COMMIT_EDITMSG|Downloads/*|\.DS_Store'
"map <silent> <C-f> <C-n><C-e>
"let g:fuf_mrufile_maxItem = 10000
"let g:fuf_enumeratingLimit = 20

"}}}


"neoui
"map <silent> <C-n> :NeoUI buffer<CR>
"map <silent> <Leader>d :NeoUI file<CR>
"map <C-r> :NeoUI file/mru<CR>
"let g:neoui_file_mru_time_format="%H:%M"
"

" twitvim {{{

nnoremap <Space>po   :<C-u>PosttoTwitter<Enter>
nnoremap <Space>fr   :<C-u>FriendsTwitter<Enter>
nnoremap <Space>re   :<C-u>RepliesTwitter<Enter>
nnoremap <Space>tt   :<C-u>ListTwitter tottoruby<Enter>
nnoremap <Space>nn   :<C-u>NextTwitter<Enter>
nnoremap <Leader>u   yw:UserTwitter <C-R>+<CR>

let twitvim_browser_cmd = "open -a firefox "
"let twitvim_enable_ruby = 1
"let twitvim_enable_perl = 1
let twitvim_enable_python = 1

"}}}

let g:rsenseHome = '/Users/tatsuya/opt/rsense-0.2'
let g:rsenseUseOmniFunc = 1

"let g:NeoComplCache_EnableSkipCompletion = 0
"if !exists('g:NeoComplCache_OmniPatterns')
"  let g:NeoComplCache_OmniPatterns = {}
"endif
"let g:NeoComplCache_OmniPatterns.ruby = '[^. *\t]\.\w*\|\h\w*::'


silent! nmap <Leader>q :QuickRun<CR>

autocmd FileType fuf NeoComplCacheLock

nnoremap <Space>full :call FullScreen()<Enter>
function! FullScreen()
  set columns=195
  set lines=43
endfunction


"Command-line window {{{

"set cmdwinheight=1
"nnoremap <sid>(command-line-enter) q:
"xnoremap <sid>(command-line-enter) q:
"nnoremap <sid>(command-line-norange) q:<C-u>
"nmap :  <sid>(command-line-enter)
"xmap :  <sid>(command-line-enter)
"autocmd CmdwinEnter * :NeoComplCacheLock
"autocmd CmdwinEnter * call s:init_cmdwin()
"function! s:init_cmdwin()
"  nnoremap <buffer> q bw
"  inoremap <buffer> q bw
"  inoremap <buffer> wq WQ
"
"  "cnoreabbrev q   'bd'
"  "inoreabbrev q   'bd'
"  "inoreabbrev q!  'bd!'
"  "inoreabbrev wq  'WQ'
"
"  nnoremap <buffer> <Esc> :<C-u><C-c><C-h>
"  inoremap <buffer> <C-c> :<ESC>
"  inoremap <buffer> <ESC> :<C-u><C-c><C-h>
"  nnoremap <buffer> <TAB> :<C-u>quit<CR>
"  inoremap <buffer><expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"
"  "inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
"  "inoremap <buffer><expr><BS>  pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
"
"  " Completion.
"  "inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"  inoremap <buffer><expr><TAB>  "\<C-n>"
"  " カーソル移動
"  inoremap <C-k> <Up>
"  inoremap <C-j> <Down>
"
"  startinsert!
"endfunction
""autocmd CmdwinLeave * call s:leave_cmdwin()
""function! s:leave_cmdwin()
""  let g:neocomplcache_auto_completion_start_length = 2
""endfunction

"}}}

function! Scouter(file, ...) "{{{
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
command! -bar -bang -nargs=? -complete=file GScouter
\        echo Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)
"}}}

let g:restart_vim_progname = "MacVim"


" vim: foldmethod=marker
