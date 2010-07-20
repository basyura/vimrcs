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
  set guifont=Monaco:h11.5
  " ウインドウ幅
  set columns=95
  " ウインドウの高さ
  set lines=40
  " 透明度
  set transparency=10 
  " esc 時に ime off mac vim only
  set imda
  "
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

set guioptions-=rL


"*******************************************************
"*                   保存・終了                        *
"*******************************************************
" gui の時だけ。Terminal ではやらない。
call altercmd#load() "これを書かないとコマンド定義されない
command! -nargs=? -bang WQ  call s:WriteClose('<bang>')
function! s:WriteClose(bang)
  if a:bang == ''
    write | bw
  else
    write! | bw!
  endif
endfunction
AlterCommand q bw
AlterCommand wq WQ
""""""""""""""""""""""""""""""""""
"             other              "
""""""""""""""""""""""""""""""""""
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>:<C-u>source $MYGVIMRC<Enter>
" esc 連打すれば ime  off にしちゃう
" terminal だと git のコミットに失敗した気がするのでこちらに
if has('mac')
  map <silent> <ESC> <ESC>:set iminsert=0<CR>
endif
" カーソルオレンジ"
hi Cursor	  guifg=bg	guibg=orange
" ポップアップの選択中
hi PmenuSel guibg=magenta guifg=white
hi Pmenu guibg=white guifg=black
hi Folded guifg=blue

autocmd FileType vimwiki :hi Comment guifg=#ffffff
autocmd FileType vimwiki :hi PreProc guifg=#ffffff
autocmd FileType vimwiki :hi Special guifg=#ffffff
