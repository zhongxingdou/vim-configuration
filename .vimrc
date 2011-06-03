" ********************* Vimrc files for GVim *p*************
" Author: zhongxingdou<zhongxingdou@gmail.com>
" Create Date: 2010-04-20 10:20:22
" Last Change:  2010-08-11 20:47:46
" Encoding: UTF-8.

if has("win32")
	set nocompatible
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
endif

" 持久撤消，即使文件关闭后重新打开也可以
if has("win32")
    let $VIMFILES = $VIM.'/vimfiles'
    let $V = $VIM.'/_vimrc'
else
    let $VIMFILES = $HOME.'/.vim'
    let $V = $HOME.'/.vimrc'
endif
"
if has("gui_running")
    set undofile
    set undodir=$VIMFILES/undodir
    set undolevels=1000 "maximum number of changes that can be undone
	set undoreload=10000 "maximum number of lines to save for undo on a buffer reload
endif

" 编码设置
"
if has("win32")
	"set encoding=cp936 "set encoding=utf-8
else
	set fileencodings=ucs-bom,utf-8,cp936

	"set fileencodings=gb18030,utf-8,utf-16,big5 "识别文档时的编码 
	
	"因为淘宝用的是gb编码
	set fileformat=dos
	set fileencoding=gb18030 "文件存储时的编码

	"set termencoding=utf-8 "终端用的编码
	"set encoding=utf-8 "vim内部编码
endif

"language zh_CN.UTF-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       全局设定                          
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

" 设置自动切换目录。
" set autochdir

:au! Cursorhold
:match none

" 设置不兼容模式
set nocp

" 当buffer被丢弃时隐藏
set bufhidden=hide

" GNU标准
"au BufEnter /usr/* call GnuIndent()

"隐藏工具栏
set guioptions-=T
"""""""""""""""""""""""""""""""""""""""""""""
"         命令行
"""""""""""""""""""""""""""""""""""""""""""""
" 设置命令行高度为2行
"set cmdheight=1

" 命令行补全
set wildmenu

" 显示未完成命令
set showcmd

" history文件中需要记录的行数，恢复必须用到。
"set history=1024

" 保存全局变量
"set viminfo+=!


""""""""""""""""""""""""""""""""""""""""""""""
"            编辑文件
""""""""""""""""""""""""""""""""""""""""""""""
" 光标移动到buffer的顶部和底部时保持3行距离, 光标在顶部及底部时不易看见
"set scrolloff=3

" 带有如下符号的单词不要被换行分割
"set iskeyword+=_,$,@,%,#,-

" 语法高亮
syntax on

" tab宽度
set tabstop=4

" 设置TAB为4个空格。
set softtabstop=4

"indent
set cindent shiftwidth=4
set autoindent shiftwidth=4

" 共享外部剪贴板
"set clipboard+=unnamed

" 设置非粘贴模式
set nopaste

" 设置自动粘贴功能。
"set pastetoggle=<F3>

" 文件被其他程序修改时自动载入
"set autoread

" 打开文件时，总是跳到退出之前的光标处
"autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"记录文件状态（包括独立于该文件的键盘映射、代码折叠状态等）
"autocmd BufWinLeave * if expand('%') != '' && &buftype == '' | mkview | endif
"autocmd BufRead     * if expand('%') != '' && &buftype == '' | silent loadview | syntax on | endif

"上面的代码最大的缺陷可能就是时间长了 $VIMFILES/views
"目录下就会有很多垃圾文件，下面的代码删除90天以上的文件
"function! RemoveOldViewFiles
    "exe 'find '.$VIMFILES.'/view* -mtime +90 -exec rm {} \;'
"endfunction
"nmap <leader>.cl :call RemoveOldViewFiles<cr>



" 设置以缩进的方式自动折叠和设置快捷方式，用空格键来开关折叠
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 保存代码文件前自动修改最后修改时间
" 启用timestamp插件
"let g:timestamp = 1


"""""""""""""""""""""""""""""""""""""""""""""""
"       文件类型
"""""""""""""""""""""""""""""""""""""""""""""""
" 侦测文件类型
filetype on

" 自动格式化设置
filetype indent on
set autoindent
set smartindent

"允许使用ftplugin目录下的文件类型特定脚本
filetype plugin on

"autocmd FileType ruby set shiftwidth=2 expandtab softtabstop=2
"autocmd FileType javascript set shiftwidth=4 expandtab softtabstop=4

"*.tpl使用html语法文件。
"au BufRead,BufNewFile *.tpl set filetype=html


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 状态行
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 总是显示状态行
"set laststatus=2

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%<%F%m%r%=\ [pos=%l,%v]\ [%{&ff}-%{&fenc}]
 "set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v]\ [%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %l\ of\ %L,%c%V\ Page\ %N\ %P
" set statusline=[%n]%F%<%f%y%h%m%r%=\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [%{strftime(\"%Y-%m-%d\ %H:%M\")}]\ [POS=%l,%v]\ [%p%%]\ %l\ of\ %L,%c%V\ Page\ %N\ %P


" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        搜索和匹配                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=3

" 在搜索的时候忽略大小写
"set ignorecase

" 不要高亮被搜索的句子（phrases）
set nohlsearch

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 输入:set list命令是应该显示些啥？
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" Tab补全时忽略这些忽略这些
set wildignore=*.o,*.obj,*.bak,*.exe

"搜索出之后高亮关键词
set hlsearch

" 高亮字符，让其不受100列限制
" highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
" match OverLength '\%101v.*'

" highlight CursorLine guibg=lightblue guifg=black ctermbg=lightgray ctermfg=black
" highlight CursorColumn guibg=lightblue ctermbg=lightgray guifg=black ctermfg=black

"colors textmate16
"colors evening
"colors desert
"colors solarized
"colors vylight
if has("gui_running")
	colors mac_classic
else
	colors default
endif
	

set nu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        快捷键映射                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

map <MiddleMouse> <LeftMouse>

"save file
nmap cs :w<CR>

"no highlight
nmap <F2> :nohl<CR>

"set current work dir
nmap cd :cd ~/work/taobao/

"open file list
nmap co :e .<CR>jjjj

"edit config file
if has("win32")
	nmap cfg :e $V<CR>
else
	nmap cfg :e ~/.vimrc<CR>
endif


" Move lines (Eclipse like)
nmap <C-Down> :<C-u>move .+1<cr>
nmap <C-Up> :<C-u>move .-2<cr>
imap <C-Down> <C-o>:<C-u>move .+1<cr>
imap <C-Up> <C-o>:<C-u>move .-2<cr>
vmap <C-Down> :move '>+1<cr>gv
vmap <C-Up> :move '<-2<cr>gv

" 自动补全( { [ < 这几个符号。
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>

"""""""""""""""""  plugin keymap   """"""""""""""""""

" tabbar
nmap tn :Tbbn<CR>
nmap tp :Tbbp<CR>
nmap tw :bd<CR>

"nmap tc <c-w>c
"nmap th <C-w>h
"nmap tl <C-w>l

"winmanager
"let g:winManagerWindowLayout = 'FileExplorer'
"map th :FirstExplorerWindow<CR>
"map tl <C-w>l
"map <F7> :WMToggle<CR>

"Jsbeautify
nmap <leader>fjs :call g:Jsbeautify()<CR>

"
"left curr = line('.')
"g:Jsbeautify()

"mru
noremap tr :MRU 

" comment
noremap  cm :call CommentLine()<CR>
vnoremap cm :call RangeCommentLine()<CR>
noremap  cu :call UnCommentLine()<CR>
vnoremap cu :call RangeUnCommentLine()<CR>

" TimeStamp
"function InitTimeStamp()
	"TimeStamp "*.js,*.css", ' * ' 
	"TimeStamp ".vimrc", '" ' 
	"TimeStamp "*.rb,*.py,*.sh", '# ' 
"endfunction

"autocmd VimEnter * call InitTimeStamp()

" diffchanges
"noremap <leader>dd :DiffChangesDiffToggle<CR>
"noremap <leader>dp :DiffChangesPatchToggle<CR>

" unix to dos 
noremap <leader>tw :set fileformat=dos<CR>:set fileencoding=gb18030<CR>
noremap <leader>w :set fileformat=unix<CR>:set fileencoding=utf8<CR>

"onlyfor windows,
"当中文输入法时光标紫色，当esc后，等待光标变成绿色后再操作
"if has('multi_byte_ime')
	"highlight Cursor guifg=NONE guibg=Green
	"highlight CursorIM guifg=NONE guibg=Purple
"endif

if has("mac")
	set guifont=Monaco:h16
elseif has("win32")
	set guifont=Courier_New:h14:cANSI
endif

"When .vimrc is edited, reload it; 当它引起报错时，是新装的某个插件的原因
autocmd! bufwritepost .vimrc source ~/.vimrc

"hignlight current line
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
"nnoremap <Leader>c :set cursorline!<CR>

"if you only want the hignlight applied in the current window, use an autocmd
"instead
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

set noimd
if has("gui_running")
	if has("mac")
		set imactivatekey=M-space
		inoremap <ESC> <ESC>:set iminsert=1<CR>
	endif

    "显示一条竖线，在指定列
    "set colorcolumn=80
    "hi ColorColumn guibg=#383333
endif

" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil 
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction

"autocmd BufWritePre * call RemoveTrailingWhitespace()
nmap <leader>r :rubyf %<CR>
nmap <leader>R :!rake<CR>

"delete tag attribute
nmap <leader>da 2dt"x
