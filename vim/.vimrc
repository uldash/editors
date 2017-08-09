" Показывать номера строк
set number
" Включить подсветку синтаксиса
filetype on
filetype plugin on
filetype indent on
syntax on
" Поиск в процессе набора
set incsearch
" Подсвечивание результатов поиска
set hlsearch
" умная зависимость от регистра. Детали `:h smartcase`
set ignorecase
set smartcase
" Кодировка текста по умолчанию utf8
set encoding=utf-8
set termencoding=utf-8
" Включаем несовместимость настроек с Vi, так как Vi нам и не понадобится
set nocompatible
" Показывать положение курсора всё время.
set ruler
" Показывать незавершённые команды в статусбаре
set showcmd
" Фолдинг по отсупам
"set foldenable
"set foldlevel=100
" Использовать больше цветов в терминале
set t_Co=256
" Включить сохранение резервных копий
"set backup
