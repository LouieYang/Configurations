"                                           _
"       ___ _ __   __ _  ___ ___     __   _(_)_ __ ___
"      / __| -_ \ / _- |/ __/ _ \____\ \ / / | -_ - _ \
"      \__ \ |_) | (_| | (_|  __/_____\ V /| | | | | | |
"      |___/ .__/ \__._|\___\___|      \_/ |_|_| |_| |_|
"          |_|
"
"   Copyright (c) 2017 Liu-Cheng Xu & Contributors
"
"   You can customize space-vim with .spacevim
"   and don't have to take care of this file.
"
"   Author: Liu-Cheng Xu <xuliuchengxlc@gmail.com>
"   URL: https://github.com/liuchengxu/space-vim
"   License: MIT

scriptencoding utf-8
let mapleader=" "

" Identify platform {
let g:MAC = has('macunix')
let g:LINUX = has('unix') && !has('macunix') && !has('win32unix')
let g:WINDOWS = has('win32') || has('win64')
" }

" Windows Compatible {
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if g:WINDOWS || g:LINUX
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after,$HOME/.vim/bundle/Vundle.vim
endif
" }

let g:spacevim_dir = $HOME.'/.space-vim'
let g:spacevim_core_dir = '/core'
let g:spacevim_version = '0.7.0'

let g:ycm_python_binary_path = '/root/anaconda3/bin/python/'

set runtimepath+=$HOME/.space-vim/core

call spacevim#begin()

Layer 'spacevim'

call spacevim#end()

" Line start end switch
nnoremap <A-Right> $
nnoremap <A-Left> ^
inoremap <A-Right> <C-o>A
inoremap <A-Left> <C-o>^

" Move Line up and down
nnoremap <A-Up> :call feedkeys( line('.')==1? '' : 'ddkP' )<CR>
nnoremap <A-Down> ddp

" Next planes
nnoremap nw <C-w>w
nnoremap <C-a>j <C-w>j
nnoremap <C-a>l <C-w>l
nnoremap <C-a>k <C-w>k
nnoremap <C-a>h <C-w>h

" Split planes
nnoremap <bar> :vnew<CR>
nnoremap _ :new<CR>

" Toggling between shell and vim
noremap <C-d> :sh<CR>

colorscheme space-vim-dark
hi Comment cterm=italic

" Jedi-Vim Settings
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0

" Nerd-Tree Settings
nmap ,m :NERDTreeToggle<CR>
nmap ,n :NERDTreeFind<CR>

" Easy Motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Tagbar
nmap <Leader>t :TagbarToggle<CR>

"copy (write) highlighted text to .vimbuffer
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>

" Netrw Setting
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25

set background=dark
set t_Co=256

let g:mkdp_path_to_chrome = '/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'
" for normal mode
nmap <silent> <F8> <Plug>MarkdownPreview        
" for insert mode
imap <silent> <F8> <Plug>MarkdownPreview        
