if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')

    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')

"----------------------------------------------------------
" ツリー表示
"----------------------------------------------------------
    call dein#add('scrooloose/nerdtree')
"----------------------------------------------------------
" endキーワードの自動挿入
"----------------------------------------------------------
    call dein#add('tpope/vim-endwise') 
"----------------------------------------------------------
" インデントの可視化
"----------------------------------------------------------
    call dein#add('Yggdroot/indentLine') 

  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

"----------------------------------------------------------
" 括弧の自動挿入
"----------------------------------------------------------
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

"----------------------------------------------------------
" 起動時にツリー表示する
"----------------------------------------------------------
autocmd VimEnter * execute 'NERDTree'

let NERDTreeWinSize=26  "ツリー表示の幅
let g:NERDTreeShowHidden=1
let g:indentLine_color_term = 239

"----------------------------------------------------------
" 行番号の表示
"----------------------------------------------------------
set number
hi LineNr ctermbg=grey ctermfg=0
hi CursorLineNr ctermbg=0 ctermfg=7
set cursorline
hi clear CursorLine

"----------------------------------------------------------
" 読み込み時の文字コードの設定
"----------------------------------------------------------
set encoding=utf-8
"----------------------------------------------------------
" Vim Script内でマルチバイトを使う場合の設定
"----------------------------------------------------------
scriptencoding utf-8

"----------------------------------------------------------
" 文字
"----------------------------------------------------------
set fileencoding=utf-8 " 保存時の文字コード

"----------------------------------------------------------
" タブ・インデント
"----------------------------------------------------------
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅

"----------------------------------------------------------
" マウスでカーソル移動とスクロール
"----------------------------------------------------------
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"----------------------------------------------------------
" クリップボードからのペースト
"----------------------------------------------------------
" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


