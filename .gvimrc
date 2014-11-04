"-----------------
" 基本的な設定
"-----------------
" showtabline タブページを表示するか指定 2 : 常に表示
set showtabline=2

" transparency 半透明の指定 255 : 透明じゃなくなります 1 : 透明
set transparency=10

" imdisable 日本語入力を使わない 初期値 : オフ
set imdisable

" guioptions GUI用オプション T : ツールバー表示 -=T : 表示しない
set guioptions-=T

" antialias フォントがアンチエイリアスされる（Macのみ）
set antialias

" tabstop ファイル内の<tab>が対応する空白の数 初期値 : 8
set tabstop=4

" number 行番号表示
set number

" backup ファイルを上書きする前にバックアップファイルを作る nobackup 作らない
" ファイルの上書きの前にバックアップを作る/作らない
" set writebackupを指定してもオプション 'backup' がオンでない限り、
" バックアップは上書きに成功した後に削除される。
set nowritebackup
" バックアップ/スワップファイルを作成する/しない
set nobackup

" visualbell エラーにビープ音をフラッシュにする t_vb= : フラッシュもオフにする
set visualbell t_vb=

" wrapscan 検索をファイルの末尾まで検索したら、先頭へループ
" nowrapscan : ループしない
set nowrapscan

" columns スクリーン上の列幅 初期値 : 80 またはターミナル幅
set columns=100

" limes ウィンドウの高さを行単位で指定する 初期値 : 24 or ターミナル幅
set lines=48

" laststatus ステータスラインの表示 2 : 常にステータスラインを表示する
set laststatus=2

" statusline ステータス行の表示内容を設定 
set statusline=2


colorscheme molokai




