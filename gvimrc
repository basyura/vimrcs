""""""""""""""""""""""""""""""""""
"         core settings          "
""""""""""""""""""""""""""""""""""
colorscheme koehler
""""""""""""""""""""""""""""""""""
"           settings             "
""""""""""""""""""""""""""""""""""
if has('windows') && !has('unix')
  set guifont=MeiryoKe_Gothic:h11:cSHIFTJIS
  set linespace=5
elseif has('mac')
  " フォント
  set guifont=Monaco:h12
  " ウインドウ幅
  set columns=110
  " ウインドウの高さ
  set lines=30
  " 透明度
  set transparency=10 
  " esc 時に ime off mac vim only
  set imda
elseif has('unix')
  " 行間
  set linespace=4
  " アンチエイリアス
  set antialias
  " フォント
  set guifont=MeiryoKe_Gothic\ 11.5
  " 幅
  set columns=100
  " 高さ
  set lines=28
endif


"*******************************************************
"*                   保存・終了                        *
"*******************************************************
" gui の時だけ。Terminal ではやらない。
call altercmd#load() "これを書かないとコマンド定義されない
command! -nargs=? -bang WQ  call s:WriteClose('<bang>')
function! s:WriteClose(bang)
  if a:bang == ''
    write | bd
  else
    write! | bd!
  endif
endfunction
AlterCommand q bd
AlterCommand wq WQ
""""""""""""""""""""""""""""""""""
"             other              "
""""""""""""""""""""""""""""""""""
" esc 連打すれば ime  off にしちゃう
" terminal だと git のコミットに失敗した気がするのでこちらに
if has('mac')
  map <silent> <ESC> <ESC>:set iminsert=0<CR>
endif
" カーソルオレンジ"
hi Cursor	  guifg=bg	guibg=orange
