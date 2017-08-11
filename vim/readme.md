Пользовательские настройки vim дужат в файле ~/.vimrc, если такого файла нету - его можно создать

# Pathagon менеджер плагинов vim, подгружает все плагины из папки $HOME/.vim/bundle 
(https://github.com/tpope/vim-pathogen)

## Установка:

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Добавим в .vimrc
execute pathogen#infect()
syntax on
filetype plugin indent on

# vim-go плагин для разработки на go
(https://github.com/fatih/vim-go)

## Установка:

git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
и все, проверить что плагин загружен:
:scriptnames
после загрузки плагина нужно подгрузить go toolkit
:GoInstallBinaries

# neocomplete плагин для автоподстановки, иногда срабатывает самостоятельно, в go программах нужно нажать C-x C-o
(https://github.com/Shougo/neocomplete.vim)

## Установка

для работы плагина нужна поддержка lua, когда устанавливаеш vim нужно ставить не viv, а vim-nox
cd ~/.vim/bundle && git clone https://github.com/Shougo/neocomplete.vim.git
В .vimrc добавим
let g:neocomplete#enable_at_startup = 1

# NERDTree плагин для отображения дерева дирректорий
(https://github.com/scrooloose/nerdtree)

## Установка
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
В .vimrc добавим
autocmd vimenter * NERDTree
