""""""""""""""""""""""""""""""""""
"         core settings          "
""""""""""""""""""""""""""""""""""
colorscheme koehler
""""""""""""""""""""""""""""""""""
"           settings             "
""""""""""""""""""""""""""""""""""
if has('mac')
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
  set guifont=MeiryoKe_Gothic\ 11
  " 幅
  set columns=75
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
hi Cursor	  guifg=bg	guibg=orange

