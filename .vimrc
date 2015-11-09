" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-scripts/taglist.vim'
Plugin 'sjl/gundo.vim'
call vundle#end()

"set leader key
let mapleader="\<space>"

"NERDTree setting
"open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree 
" open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"open on the right side
let g:NERDTreeWinPos = "right"
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=24
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
" let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1


"YouCompleteMe setting
"允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0

"airline setting
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
"打开tabline功能,方便查看Buffer和切换
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
"映射切换buffer的键位
nnoremap <leader>n :bn<CR>
"closes the current buffer and takes you to the previous one
"avoid collision with nerdtree
nnoremap <leader>q :bp<cr> :bd #<cr>

"easymotion setting
let g:EasyMotion_smartcase = 1

"taglist setting
"让taglist可以同时展示一个文件的函数列表
let Tlist_Show_One_File=1  
"当taglist是最后一个分割窗口时，自动退出vim
let Tlist_Exit_OnlyWindow=1    

"gundo setting
"用F6切换undo面板
nnoremap <F6> :GundoToggle<CR>
"将所有的undo记录都保存下来，即使关闭了vim或者buffer也能继续撤销
try
    set undodir=~/.vim/temp_dirs/undodir
	set undofile
catch
endtry
"修改宽度
" let g:gundo_width = 60
"修改高度
" let g:gundo_preview_height = 40
"让预览出现在右边区域
" let g:gundo_right = 1
"禁掉gundo
" g:gundo_disable = 1


"Ternimal color problem solution: 在终端下打开256色
set t_Co=256

" CVE-2007-2438
set modelines=0

"mouse on
set mouse=a

"设置vi兼容性，设置为不兼容以避免vi限制
set nocompatible

" more powerful backspacing
set backspace=2

"显示行号
set number
"为方便复制，用<F2>开启/关闭行号显示
nnoremap <F2> :set nonumber!<CR>

"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on

"设置自动缩进：每行的缩进值与上一行相等
set autoindent         

"在处理未保存或只读文件时，弹出确认
set confirm             

"Tab键的宽度
set tabstop=4           


"设置颜色主题
colorscheme Tomorrow-Night-Eighties

"设置光标十字坐标，高亮当前行，高亮当前列
set cursorline
set cursorcolumn

"高亮显示对应的括号
set showmatch           

"对应括号高亮的时间（单位是十分之一秒）
set matchtime=5         

"在切换buffer时自动保存当前文件
set autowrite           

"搜索的时候实时显示结果
set incsearch

" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

"高亮搜索结果
set hlsearch

"搜索忽略大小写
set ignorecase

"括号自动补全
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
