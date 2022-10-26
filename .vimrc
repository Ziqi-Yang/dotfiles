set nocp " nocompatible
filetype plugin indent on
syn on " syntax
set nu " number
set ts=4 sw=4 " tabstop shiftwidth
set ai cin " autoindent & cindent
imap kk <esc>
nmap <Space>zca :w<CR>:!clear && g++ -g -O2 -std=gnu++17 -static % -o main && ./main && echo && read -P '[press enter to exit]'<CR> 

set hls " hlsearch, useful for replacing
set is " incsearch, useful for replacing
set mouse=a " enable mouse for jumping and selecting

hi Search ctermbg=red
hi Search ctermfg=white

cd ~/programme/algo
