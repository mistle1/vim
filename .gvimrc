"-----------------
" 基本的な設定
"-----------------
set showtabline=2
set transparency=5
set imdisable
set guioptions-=T
set antialias
set tabstop=4
set number
set nobackup
set visualbell t_vb=
set nowrapscan
set columns=100
set lines=48
set laststatus=2
set statusline=2


colorscheme molokai

"-----------------
" エンコードファイル表示
"-----------------

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




