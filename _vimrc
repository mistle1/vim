"--------------------
" ��{�I�Ȑݒ�
"--------------------
"�V�����s�̃C���f���g�����ݍs�Ɠ����ɂ���
set autoindent 

"�o�b�N�A�b�v�t�@�C���̃f�B���N�g�����w�肷��
set backupdir=$HOME/vimbackup

"�N���b�v�{�[�h��Windows�ƘA�g����
set clipboard=unnamed

"vi�݊����I�t����
set nocompatible

"�X���b�v�t�@�C���p�̃f�B���N�g�����w�肷��
set directory=$HOME/vimbackup

"�^�u�̑���ɋ󔒕������w�肷��
set expandtab

" tabstop(ts) : <tab>�̋󔒐� ���� : 4 
" shiftwidth(sw) : �����C���f���g�̊e�i�K�Ɏg����󔒐� : 4
" softtabstop(sts) : �^�u�L�[���������ɑ}������镶�����w��
"   0�̏ꍇ��tabstop�̐��l���g�p�����
set ts=4 sw=4 sts=4

" �����I�ɃC���f���g����
set autoindent

" C�C���f���g�̐ݒ�
set cinoptions+=:0

" �^�C�g����\��
set title

"�ύX���̃t�@�C���ł��A�ۑ����Ȃ��ő��̃t�@�C����\������
set hidden

"�C���N�������^���T�[�`���s��
set incsearch

"�s�ԍ���\������
set number

"���ʂ����͂��ꂽ���A�Ή����銇�ʂ���������
set showmatch

"�J�[�\���s�̔w�i�F��ς���
set cursorline

"�J�[�\���ʒu�̃J�����̔w�i�F��ς���
set cursorcolumn

" ���{��̍s�̘A�����ɂ͋󔒂���͂��Ȃ�
set formatoptions+=mM

" Tab�A�s���̔��p�X�y�[�X�𖾎��I�ɕ\������
set list
set listchars=tab:^\ ,trail:~
" �o�b�N�X�y�[�X�ŃC���f���g����s���폜�ł���悤�ɂ���
set backspace=indent,eol,start

" �}�E�X��L���ɂ���
if has('mouse')
  set mouse=a
endif

" grep������ݒ肷��
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" �������ʂ̃n�C���C�g��Esc�A�łŃN���A����
nnoremap <ESC><ESC> :nohlsearch<CR>

"------------------------------------
"   �����R�[�h�̎����F��
" http://ksknet.net/vi/vim_1.html
"------------------------------------
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconv��eucJP-ms�ɑΉ����Ă��邩���`�F�b�N
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconv��JISX0213�ɑΉ����Ă��邩���`�F�b�N
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodings���\�z
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " �萔������
  unlet s:enc_euc
  unlet s:enc_jis
endif
" ���{����܂܂Ȃ��ꍇ�� fileencoding �� encoding ���g���悤�ɂ���
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" ���s�R�[�h�̎����F��
set fileformats=unix,dos,mac
" ���Ƃ����̕����������Ă��J�[�\���ʒu������Ȃ��悤�ɂ���
if exists('&ambiwidth')
  set ambiwidth=double
endif

""""""""""""""""""""""""""""""
" �X�e�[�^�X���C���ɕ����R�[�h���\��
" iconv���g�p�\�̏ꍇ�A�J�[�\����̕����R�[�h���G���R�[�h�ɉ������\���ɂ���FencB()���g�p
""""""""""""""""""""""""""""""
if has('iconv')
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
else
  set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
endif

" FencB() : �J�[�\����̕����R�[�h���G���R�[�h�ɉ������\���ɂ���
function! FencB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return s:Byte2hex(s:Str2byte(c))
endfunction

function! s:Str2byte(str)
  return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

function! s:Byte2hex(bytes)
  return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

"------------------------------------
"   netrw�֘A
"------------------------------------
" netrw�͏��tree view
let g:netrw_liststyle = 3
" 'v'�Ńt�@�C�����J���Ƃ��͉E���ɊJ���i�f�t�H���g�������j
let g:netrw_altv = 1
" 'o'�Ńt�@�C�����J���Ƃ��͉����ɊJ���i�f�t�H���g���㑤�j
let g:netrw_alto = 1
""""""""""""""""""""""""""""""
" grep,tags�̂��߃J�����g�f�B���N�g�����t�@�C���Ɠ����f�B���N�g���Ɉړ�����
""""""""""""""""""""""""""""""
" if exists('+autochdir')
"   "autochdir������ꍇ�J�����g�f�B���N�g�����ړ�
"   set autochdir
" else
"   "autochdir�����݂��Ȃ����A�J�����g�f�B���N�g�����ړ��������ꍇ
"   au BufEnter * execute ":silent! lcd " . escape(expand("%:p:h"), ' ')
" endif

"----------------------------------------
" �e��v���O�C���ݒ�
"----------------------------------------

"----------------------------------------
" �ꎞ�ݒ�
"----------------------------------------
