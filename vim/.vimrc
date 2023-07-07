syntax on

set helplang=ja
colorscheme codedark

set encoding=UTF-8
set backspace=indent,eol,start  " バックスペースを有効にする
set termwinsize=12x0  " ターミナルのサイズを指定
set updatetime=250  " 反映時間を短くする(デフォルトは4000ms)

"" キーマップ
" タブを作成する
nnoremap tc :tabnew<CR>
" 前のタブを開く
nnoremap tp :tabp<CR>
" 次のタブを開く
nnoremap tn :tabn<CR>
" タブを閉じる
nnoremap tx :tabclose<CR>

" 行番号を追加
set number
" タブ文字を4つのスペースに設定する
set tabstop=4
" タブ文字が入力された場合に4つのスペースに自動変換する
set softtabstop=4
" 自動インデントスペース数を4に設定
set shiftwidth=4
" タブ文字をスペースに変換
set expandtab
" インデントを自動でやる
set autoindent
" 検索結果をハイライトする
set hlsearch
" ファイルタイプに応じたプラグインを有効にする
filetype plugin indent on
" コマンドラインに入力された文字列を表示
set showcmd
" 検索文字列を入力中にインクリメンタルに表示する
set incsearch
" 検索文字列に大文字小文字の区別をしない
set smartcase
" 現在の行を強調表示
set cursorline
set cursorcolumn
" 置換ラクにする設定 ref.https://zenn.dev/vim_jp/articles/2023-06-30-vim-substitute-tips
cnoreabbrev <expr> s getcmdtype() .. getcmdline() ==# ':s' ? [getchar(), ''][1] .. "%s///g<Left><Left>" : 's'


