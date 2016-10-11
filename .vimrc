" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r skeleton.spec
	language time en_US
	let login = system('whoami')
	if v:shell_error
	   let login = 'unknown'
	else
	   let newline = stridx(login, "\n")
	   if newline != -1
		let login = strpart(login, 0, newline)
	   endif
	endif
	let hostname = system('hostname -f')
	if v:shell_error
	    let hostname = 'localhost'
	else
	    let newline = stridx(hostname, "\n")
	    if newline != -1
		let hostname = strpart(hostname, 0, newline)
	    endif
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set shiftwidth=4
set number
set autoindent
set cindent
set smartindent
set backspace=eol,start,indent
set incsearch
set visualbell
set title
" ~/.vimrc ends here
let Tlist_Auto_Open=1

set list listchars=tab:→\ ,trail:→
set ruler
syntax on
set showmatch
set showmode
set hlsearch
set ignorecase
set showcmd
autocmd FileType c,idl,cpp,java,php,xml,json,lua,js autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


set history=50
set mouse=a
set scrolloff=4
set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags,../../../../../../tags,tags

au Bufenter *.\(c\|cpp\|h\|java\|html\|sh\|lua\|js\|py\) set tabstop=4
au Bufenter *.\(c\|cpp\|h\|java\|html\|sh\|lua\|js\|py\) set expandtab
au Bufenter *.\(c\|cpp\|h\|java\|html\|sh\|lua\|js\|py\) set softtabstop=4

set encoding=korea
set encoding=utf8



func! Man()
    let sm = expand("<cword>")
    exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>

if version >= 500
func! Sts()
    let st = expand("<cword>")
    exe "sts ".st
endfunc
nmap ,st :call Sts()<cr><cr>

func! Tj()
    let tj = expand("<cword>")
    exe "tj ".tj
endfunc
nmap ,tj :call Tj()<cr><cr>
endif

" version 7+ commands
if version >= 700
" spelling is configured yet disabled by default
setlocal nospell
" set a spell file where new words are added with 'zg'
set spellfile=~/.vim.spell.add

nnoremap <silent> <F7> <ESC>:setlocal spell spelllang=en_us<CR>
nnoremap <silent> <F8> <ESC>:setlocal nospell<CR>
endif

