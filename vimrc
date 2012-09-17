" vundle插件的设置{{{
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"""以上的不要动，vundle插件需要"""
"}}}

"要安装的插件"{{{
Bundle 'vim-scripts/TabBar'
Bundle 'vim-scripts/mru.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-ragtag'
Bundle 'altercation/vim-colors-solarized'
Bundle 'maksimr/vim-jsbeautify' 


"snipmate-dependences
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle 'garbas/vim-snipmate'
Bundle 'kien/ctrlp.vim'
"}}}


"标准设置"{{{

"When this file has been updated, just reload it
if has("win32")
	autocmd! bufwritepost _vimrc source $V
else
	autocmd! BufWritePost .vimrc nested source %
endif


set nocompatible   " Disable vi-compatibility

set noimd "中文输入法时按ESC键可以切换到en输入法

set nohidden

syntax on

filetype plugin indent on

set encoding=utf-8 " Necessary to show unicode glyphs

set foldmethod=marker
"}}}

"搜索"{{{
set incsearch " 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）

set hlsearch "搜索出之后高亮关键词
"}}}

"显示"{{{
set guioptions-=T  "hide toolbar

"set guifont=Courier_New:h14

set laststatus=2   " Always show the statusline

if has('gui_running')
    set background=light
else
	let g:solarized_termcolors=256
    set background=dark
endif

colorscheme solarized
"}}}

"排版"{{{
set tabstop=4

set softtabstop=4

set cindent shiftwidth=4

set autoindent shiftwidth=4

autocmd FileType ruby set shiftwidth=2 expandtab softtabstop=2
"}}}


" 键映射"{{{1

" 其他键映射"{{{
let mapleader = ","

"no highlight
nmap <leader>h :nohl<CR>
"}}}

"buffer切换"{{{

nmap gj :bn<CR>

nmap gk :bp<CR>

nmap gh :bfirst<CR>

nmap gl :blast<CR>

nmap td :bd<CR>
"}}}

"文件打开相关"{{{

nmap tr :MRU 

nmap te :e .<CR>

nmap cd :cd work/

nmap cfg :e ~/.vimrc<CR>
"}}}

"切换显示行号"{{{

function! SwitchLineNum()
	if !exists("b:nu_on")
		let b:nu_on = 0
	endif
	if b:nu_on == 0
		set nu
		let b:nu_on = 1
	else
		set nonu
		let b:nu_on = 0
	endif
endfunction

nmap <leader>n :call SwitchLineNum()<CR>
"}}}

"切换主题色"{{{

let g:color = "evening"

function! SwitchColor()
	if g:color == "evening"
		color macvim
		set background=light
		let g:color = "macvim"
	else
		color evening
		set background=dark
		let g:color = "evening"
	end	
endfunction

nmap <leader>c :call SwitchColor()<CR>
"}}}

"}}}1


" 插件设置"{{{

" powerline
"let g:Powerline_symbols = 'fancy'
"set guifont=Anonymous\ Pro\ for\ Powerline:h14 

"jsbeautify
nmap <leader>ff :call JsBeautify()<cr>


"}}}

au BufRead,BufNewFile *.aspx,*.asmx,*.ascx set filetype=aspvbs
