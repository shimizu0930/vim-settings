syntax on
set number
set backspace=indent,eol,start
set hlsearch
set listchars=tab:^\ ,trail:~
set history=10000
set title
set softtabstop=2
set shiftwidth=2
set showmatch
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" Gitスペルチェック
augroup GitSpellCheck
    autocmd!
    autocmd FileType gitcommit setlocal spell
augroup END

"　自動補完
call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim'
Plug 'ujihisa/neco-look'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'

let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('sources', {
" \ 'gitcommit': ['look'],
" \})

call plug#end()

" コミットメッセージ可視化
Plug 'rhysd/committia.vim'
let g:committia_hooks = {}

function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell
    setlocal spelllang+=cjk

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

