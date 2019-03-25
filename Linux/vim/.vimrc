" Welcome to Vim (http://go/vim).
"
" If you see this file, your homedir was just created on this workstation.
" That means either you are new to Google (in that case, welcome!) or you
" got yourself a faster machine.
" Either way, the main goal of this configuration is to help you be more
" productive; if you have ideas, praise or complaints, direct them to
" vi-users@google.com (http://g/vi-users). We'd especially like to hear from you
" if you can think of ways to make this configuration better for the next
" Noogler.
" If you want to learn more about Vim at Google, see http://go/vimintro.

" Enable modern Vim features not compatible with Vi spec.
set nocompatible

" Use the 'google' package by default (see http://go/vim/packages).
" source /usr/share/vim/google/google.vim

" Plugin configuration.
" See http://google3/devtools/editors/vim/examples/ for example configurations
" and http://go/vim/plugins for more information about vim plugins at Google.

" Plugin loading is commented out below - uncomment the plugins you'd like to
" load.

" Load google's formatting plugins (http://go/vim/plugins/codefmt-google).
" The default mapping is \= (or <leader>= if g:mapleader has a custom value),
" with
" - \== formatting the current line or selected lines in visual mode
"   (:FormatLines).
" - \=b formatting the full buffer (:FormatCode).
"
" To bind :FormatLines to the same key in insert and normal mode, add:
"   noremap <C-K> :FormatLines<CR>
"   inoremap <C-K> <C-O>:FormatLines<CR>
"Glug codefmt plugin[mappings] gofmt_executable="goimports"
"Glug codefmt-google

" Enable autoformatting on save for the languages at Google that enforce
" formatting, and for which all checked-in code is already conforming (thus,
" autoformatting will never change unrelated lines in a file).
"augroup autoformat_settings
"  " For BUILD files and Go all of Google's files must be formatted.
"  autocmd FileType bzl AutoFormatBuffer buildifier
"  autocmd FileType go AutoFormatBuffer gofmt
"augroup END

" Load YCM (http://go/ycm) for semantic auto-completion and quick syntax
" error checking. Pulls in a google3-enabled version of YCM itself and
" a google3-specific default configuration.
"Glug youcompleteme-google

" Load the automated blaze dependency integration for Go.
" Note: for Go, blazedeps uses the Go team's glaze tool, which is fully
" supported by the Go team; for other languages. Note that the plugin is
" currently unsupported for other languages.
"Glug blazedeps auto_filetypes=`['go']`

" Load piper integration (http://wiki/Main/VimPerforce).
"Glug piper plugin[mappings]

" Load the Critique integration. Use :h critique for more details.
"Glug critique plugin[mappings]

" Load blaze integration (http://go/blazevim).
"Glug blaze plugin[mappings]

" Load the syntastic plugin (http://go/vim/plugins/syntastic-google).
" Note: this requires installing the upstream syntastic plugin from
" https://github.com/scrooloose/syntastic.
"Glug syntastic-google

" Load the ultisnips plugin (http://go/ultisnips).
" Note: this requires installing the upstream ultisnips plugin from
" https://github.com/SirVer/ultisnips.
"Glug ultisnips-google

" All of your plugins must be added before the following line.

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on

"set nocompatible
"set nu
"set hls
"set is
"syntax on
"set backspace=indent,eol,start
"set whichwrap=b,s,<,>,[,]
"set encoding=utf-8
"set ts=4
"set sw=4
"set et
"set smarttab
"set sm
"set cin
"set cino=:0g0t0(sus
"set ai

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'fholgado/minibufexpl.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
" 插件列表结束
call vundle#end()
filetype plugin indent on

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

set incsearch    " search as you type

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
" set cursorline
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" set cpp keyword
syntax keyword cppSTLtype initializer_list


"" 自适应不同语言的智能缩进
filetype indent on
"" 将制表符扩展为空格
set expandtab
"" 设置编辑时制表符占用空格数
set tabstop=4
"" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
 set softtabstop=4

" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" Set map leader. Default '\'
let mapleader=';'

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>


" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
" let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"


" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" Open in new tab
let NERDTreeMapOpenInTab='\r'

" CtrlP key map
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Set regexp mode as default mode of ctrlp
let g:ctrlp_regexp = 1
"" Open file in new tab
"let g:ctrlp_prompt_mappings = {
    "\ 'AcceptSelection("e")': ['<C-e>'],
    "\ 'AcceptSelection("t")': ['<Cr>'],
"    \ }
"" Close NERDTree window
"let g:ctrlp_dont_split = 'NERD'
"" Toggle NERDTree like Sublime's sidebar
"nmap <Leader>kb :NERDTreeToggle<CR>

" Key map for update nerdtree
map <leader>r :NERDTreeFind<cr>

" Open NERDTree if no file is specified and switch to right tab
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | execute "normal! \<C-w>l" | endif
" Close NERDTree if it is the last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Set tag path
set tags=/usr/local/google/home/haojiewang/Workspace/llvm-gold/llvm/tags
" Auto update tags
autocmd BufWritePost *
      \ if filereadable('tags') |
      \   call system('ctags -a '.expand('%')) |
      \ endif
" Autotags
let g:autotagTagsFile="tags"

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <leader>bn :MBEbn<cr>
map <leader>bp :MBEbp<cr>
map <leader>bd :MBEbd<cr>


" 设置环境保存项
set sessionoptions=blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize
"set sessionoptions=buffers
" 保存 undo 历史
set undodir=~/.undo_history/
set undofile
" 保存快捷键
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" 恢复快捷键
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle


"" YCM 补全菜单配色
"" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
"" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
"" 补全功能在注释中同样有效
"let g:ycm_complete_in_comments=1
"" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
"let g:ycm_confirm_extra_conf=0
"" 开启 YCM 标签补全引擎
"let g:ycm_collect_identifiers_from_tags_files=1
"" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
"" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
"" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
"" 从第一个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=1
"" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
"" 语法关键字补全
"let g:ycm_seed_identifiers_with_syntax=1
