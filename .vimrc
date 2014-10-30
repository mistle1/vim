"--------------------
" 基本的な設定
"--------------------
"新しい行のインデントを現在行と同じにする
set autoindent 

"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup

"クリップボードをWindowsと連携する
set clipboard=unnamed

"vi互換をオフする
set nocompatible

"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup

"タブの代わりに空白文字を指定する
set expandtab

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

"インクリメンタルサーチを行う
set incsearch

"行番号を表示する
set number

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"新しい行を作った時に高度な自動インデントを行う
set smarttab

"カーソル行の背景色を変える
set cursorline

"カーソル位置のカラムの背景色を変える
set cursorcolumn

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>


"------------------------------------
"   netrw関連
"------------------------------------
" netrwは常にtree view
let g:netrw_liststyle = 3
" 'v'でファイルを開くときは右側に開く（デフォルトが左側）
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く（デフォルトが上側）
let g:netrw_alto = 1

"------------------------------------
"   Vundle
"------------------------------------

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle で管理するプラグインを書いていく
Bundle 'gmarik/vundle'

filetype plugin indent os

function! GetStatusEx()
        let str = ''
        if &ft != ''
                let str = str . '[' . &ft . ']'
        endif
        if has('multi_byte')
                if &fenc != ''
                        let str = str . '[' . &fenc . ']'
                elseif &enc != ''
                        let str = str . '[' . &enc ']'
                endif
        endif
        if &ff != ''
                let str = str . '[' . &ff  ']'
        endif
        return str
endfunction

set statusline=%<%f\ %m%r%h%w%=%{GetStatusEx()}\ \ %l,%c%V%8P
