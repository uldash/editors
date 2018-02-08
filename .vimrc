set nocompatible	"отключить совместимость с vi
filetype off		"

"=========================================================
"	Vundle Settings
"=========================================================
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"----==== Навигация по коду/проекту ====----
Plugin 'scrooloose/nerdtree' " навигация по директориям 
Plugin 'majutsushi/tagbar'  " навигация по классам/функциям/переменным

"----==== Прочее ====----
Plugin 'vim-airline/vim-airline' " подключить другую тему
Plugin 'vim-airline/vim-airline-themes' "файлы тем 
Plugin 'fisadev/FixedTaskList.vim' " поиск в файле FIXME,TODO и т.п.
Plugin 'rosenfeld/conque-term' " используем для выбора дебаггера
Plugin 'tpope/vim-surround' " автозакрытие тегов HTML/XML и т.п.

"----==== Поддержка сниппетов ====----
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

"----==== Поддержка языка ====----
"---- Python ----
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim' " автодополнение для python
Plugin 'mitsuhiko/vim-jinja' " поддержка синтаксиса шаблонов Jinja
Plugin 'mitsuhiko/vim-python-combined'

call vundle#end()

filetype on
filetype plugin on
filetype plugin indent on

"=========================================================
"	General Settings	
"=========================================================

set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.

let no_buffers_menu=1
set mousemodel=popup

set ruler
set completeopt=preview
set gcr=a:blinkon0
if has("gui_running")
	set cursorline
endif
set ttyfast

"Включить подсветку кода
syntax on
if has("gui_running")
	" GUI? устанавливаем тему и размер окна
	set lines=50 columns=125
	colorscheme solarized 'molokai'
	"autocmd vimenter * TagbarToggle
	"autocmd vimenter * NERDTree
	"autocmd vimenter * if !argc()|NERDTree|endif
endif
tab sball
set switchbuf=useopen

"Отключаем пищалку и мигание
set visualbell t_vb=
set novisualbell
set enc=utf-8
set ls=2
set incsearch
set hlsearch
set nu
set scrolloff=5

"Отключаем бэкапы и свопфайлы
set nobackup
set nowritebackup
set noswapfile

"Прячем панельки
set guioptions-=m
set guioptions-=T
set guioptions-=r

" настройка на Tab
set smarttab
set tabstop=8

" это чтобы tmux не сбивал цветовые настройки
set background=dark
set t_Co=256

" указываем каталог с настройками SnipMate
let g:snippets_dir='~/.vim/vim-snippets/snippets'

" настройки Vim-Airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'

"TagBar настройки
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus=0

"NedTree настройки
"Показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
"let NERDTreeIgnore=['~$','\.pyc$','\.pyo$','\.class$','pip-log\.txt$','\.o$']

"TaskList настройки
map <F2> :TaskList<CR> "Отобразить список тасков и туду
map <leader>bd :bd<CR> " <esc>\bd - закрыть текущий буфер
map <C-w> :bd<CR> " <esc>\bd - закрыть текущий буфер

"===============================================================
" Python-mode settings
"===============================================================

"отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0

"Документация
let g:pymode_doc=0
let g:pymode_doc_key='K'

"Проверка кода
let g:pymode_lint=1
let g:pymode_lint_checker="pep8"
let g:pymode_lint_ignore="E501,W601,C0110,E2"
"Проверка кода после сохранения
let g:pymode_lint_write=1

"Поддержка virtualenv
let g:pymode_virtualenv=1

"Установка breakpoints
let g:pymode_breakbpoint=1
let g:pymode_breakpoint_key='<leader>b'

"Подсветка синтаксиса
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all

"Отключить autoflood по коду
let g:pymode_folding=0

"возможность запускать код
let g:pymode_run=0

"=================================================================
"User hotkeys
"=================================================================

"ConqueTerm
"Запуск интерпретатора на F5
nnoremap <F5> :ConqueTermSplit ipython3<CR>
"a debug-mode на F6
nnoremap <F6> :exe "ConqueTermSplit ipython3 ". expand("%")<CR>
let g:ConqueTerm_StartMessages=0
let g:ConqueTerm_CloseOnEnd=0

"проверка в соответсвии с PEP8 через <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

"автокомплит через Ctrl+Space
inoremap <C-space> <C-x> <C-o>

" переключение между синтаксисами
"nnoremap <leader>Th :set ft=htmljinja<CR>
"nnoremap <leader>Tp :set ft=python<CR>
"nnoremap <leader>Tj :set ft=javascript<CR>
"nnoremap <leader>Tc :set ft=css<CR>
"nnoremap <leader>Td :set ft=django<CR>


"=====================================================
" Languages support
"=====================================================

" --- Python ---
"autocmd FileType python set completeopt-=preview " раскомментируйте, в случае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" --- JavaScript ---
let javascript_enable_domhtmlcss=1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" --- template language support (SGML / XML too) ---
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
let html_no_rendering=1
let g:closetag_default_xml=1
let g:sparkupNextMapping='<c-l>'
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
