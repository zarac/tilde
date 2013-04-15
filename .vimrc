""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This .vimrc belongs to:
"   Hannes Landstedt
"   zarac@zarac.se
"   http://www.zarac.se
"
" If found, please return!
"
" TODO : organize this messy .vimrc

"" [HL-2010-10-05 13:54] TODO ^.
" o note function
"   o ? read pdf
""

"" Tips and Tricks! {{{

    "" Wanted! {{{
        " emacs like cycling through register
        " emacs like "xmp filter(?)" " => will run line through shell and get
        " input
    "" }}}

    " CTRL+R= is great for doing quick calculations or inserting the result of a function into the text.
    " source > http://www.reddit.com/r/vim/comments/e4rbt/did_you_know_about_ctrlr_in_insert_mode/c15a3kq

    "" Searching {{{

        " , will reverse ; (search backwards)
    "" }}}

    "" Configuring Vim {{{

        "" echomsg will echo messages visible with :messages
        "echomsg hostname()
    "" }}}

    "" Unicode characters {{{

        "" insert with ctrl-v
        " ¬ u00ac   "" http://vimcasts.org/episodes/show-invisibles/
    "" }}}

    "" Normal mode commands {{{

        "" change list, back/forth
        " g;
        " g,

        "" list previous commands/searches
        " q:
        " q/
        
        "" indent/select inner paragraph/tag
        " =ip
        " Vip
        " vit
        
        "" Keep cursor position, move screen top,center,bottom.
        " zt
        " zz
        " zb
    "" }}}

    "" Insert mode commands {{{

        " CTRL-W " delete previos word
        " CTRL-T " add tab to current row
        " CTRL-D " remove tab
        " CTRL-X CTRL-L " match complete lines
        " CTRL-X CTRL-F " complete file names
        " CTRL-L " ...
        " CTRL-O " execute one command, return to Insert mode
    ""  }}}

    "" Ex mode {{{

        "" Grep the help file and see results.
        " :helpgrep
        " :cwin
        " :cnext

        "" search / replace {{{

            "" :h search-pattern
            " \%V " only match within visual selection
            " s:/\%Vfoo/bar/g
            " :g - global
            " :v - global inverse
            " :t. - copy line to below address (.) (same as :copy)
            "" combine g and s (then a second command on the same (:g) match)
            " :g/pattern/s/pattern/replace/g
            " :g/^\w/t.|s/./=/g
            "" \zs " start replace from here (these do the same)
            "" \ze " end...
            " :%s/foo\zsbar/jao/g
            " :%s/\(foo\)bar/\1jao/g
        "" }}}
    "" }}}

    "" sources to learn even more {{{
        "" http://www.derekwyatt.org/vim/
        "" http://vimeo.com/6999927
        "" plugin/comments.vim - http://www.vim.org/scripts/script.php?script_id=1528
    "" }}}

    "" Indention works in this order {{{

        " set equalprg
        " lisp
        " cindent
        " set indentexpr
    "" }}}

    "" Highlighting something (match is local to buffer) {{{

        " hi endofline ctermbg=Green
        " match endofline /$/
    " }}}

    "" select tips from http://stackoverflow.com/questions/726894/what-are-the-dark-corners-of-vim-your-mom-never-told-you-about {{{

    "" Good tips to test, from http://stackoverflow.com/questions/726894/what-are-the-dark-corners-of-vim-your-mom-never-told-you-about
        " :w !sudo tee %
        " :earlier 15m
        " :later
        "" Cased registers append..
        " :g/blah/y A
        " :e ++enc=cp1250 %:p
        " g;
        " g,
        " q:
        " :CTRL-f
        " :verbose set path (or whatever)
        " qq0dwj@q (macros can call themselves)
        " <C-Q>x[hexByteHere]
        " imap jj <esc>
        " :for i in  range(1,255) | .put='10.0.0.'.i | endfor
        " :s:^:// :
        " :s/.*/prefix & suffix/

        "" First do a global search to match lines, then run a substitute on each line.
        " :%g/ML/s/:e/:sp
    "" }}}

    "" [HL-2010-09-06 01:50] Some new nifty tricks... {{{
        "" Exit insert mode Esc alternatives.
            " CTRL-[
            " CTRL-C
        "" Backspace alternative
            " CTRL-H
        "" Begin new line (works in ex-mode too).
            " CTRL-J / CTRL-M
        "" Paste literal (not as typed) .. there are even other similar..
            " CTRL-R CTRL-R <a register>
        "" Undo inserted text
            " CTRL-U
        "" Re-Insert previously inserted text.
            " CTRL-A
        "" Friendly reminder..
            " zM
            " zR
    "" }}}

    "" Links / URLs to good help. {{{
        "" [HL-2010-09-05 05:35] ..
        " http://blog.vinceliu.com/2007/08/vim-tips-for-java-1-build-java-files.html
        " http://blog.vinceliu.com/2007/08/vim-tips-for-java-2-using-exuberant.html
        " http://blog.vinceliu.com/2007/08/vim-tips-for-java-3-use-omni-completion.html
        " http://blog.vinceliu.com/2007/08/vim-tips-for-java-4-use-tab-for.html
        " http://blog.vinceliu.com/2007/08/vim-tips-for-java-5-folding-code-blocks.html
        " http://blog.vinceliu.com/2007/08/vim-tips-for-java-6-auto-bracketing.html
    "" }}}
 
    "" Things to check out / read up on. {{{
        " 'runtimepath'
        " swet textwidth..
        " set expandtab...
        " set showfulltag "" Test this... MS IntelliSense like?
        " :h ins-completion
        " Use "[I" to find the word under teh cursor in included files, or [<Tab> to jump
        " there.
        " Write clean c ommands in a function:
        " map _col :call CleanLint()<CR>
        " func CleanLint()
        "   g/gtk_x11.c:.*enum/d
        "   g/if_perl.*conversion to.*proto/d
        " endfunct
        "
        " hi
        " (Expression register).
        "imap <C-J>d <C-R>=system('echo hi \| grep hi')<CR>
        "imap <C-J>d <C-R>=system('echo hi\nhi')<CR>
        " :dig[raph]
    "" }}}

"" }}}

"" vundle / bundle {{{
    set nocompatible               " be iMproved
    filetype off                   " required!

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    "Bundle 'JavaScript-syntax'
    Bundle 'AutoComplPop'
    Bundle 'Bogdanp/pyrepl.vim'
    Bundle 'DirDiff.vim'
    Bundle 'EasyGrep'
    Bundle 'FuzzyFinder'
    Bundle 'Gist.vim'
    Bundle 'L9'
    Bundle 'LargeFile'
    Bundle 'Syntastic'
    Bundle 'UltiSnips'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'ap/vim-css-color'
    Bundle 'chrisbra/Recover.vim'
    Bundle 'colorv.vim'
    Bundle 'drmingdrmer/xptemplate-dist'
    Bundle 'gmarik/vundle'
    Bundle 'gregsexton/VimCalc'
    Bundle 'guns/xterm-color-table.vim'
    Bundle 'hail2u/vim-css3-syntax'
    Bundle 'kablamo/VimDebug'
    Bundle 'mattn/webapi-vim'
    Bundle 'mattn/zencoding-vim'
    Bundle 'msanders/snipmate.vim'
    Bundle 'musicx/conque'
    Bundle 'Rename2'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'scrooloose/nerdtree'
    Bundle 'sjl/gundo.vim'
    Bundle 'sukima/xmledit'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-pastie'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-surround'
    Bundle 'tslime.vim'
    Bundle 'vimbuddy.vim'
    Bundle 'zarac/z-dot-js.vim'
    Bundle 'zarac/z-wsgi-is-python.vim'
    Bundle 'zarac/zxoria.vim'
    Bundle 'zarac/zxptemplate.vim'

"" }}}

"" Abbriviations {{{

    iab Ldate <C-R>=strftime("%Y-%m-%d")<CR>
    iab Ltime <C-R>=strftime("%H:%M")<CR>
    iab Ldt <C-R>=strftime("%Y-%m-%d %H:%M")<CR>
    iab Lstamp <C-R>=strftime("%Y%m%d%H%M%")<CR>
    iab Lsign [HL-<C-R>=strftime("%Y%m%d %H%M")<CR>]
    "iab Lsign <SPACE>[HL-<C-R>=strftime("%Y-%m-%d %H:%M")<CR>]
"" }}}

"" Buffer {{{

    " Allow unsaved buffers to not be seen (not attached to any window).
    set hidden
"" }}}

"" colorschemes {{{

    "" test colors..
    "" ':echo colors_name' to see current colorscheme
    " :syntax syntax/colortest.vim
    " Dark Background
    "colo desert256
    "colo xoria256
    "colo vylight
    "colo slate
    "colo herald
    " tchaba (dark)
    " liquidcarbon (dark)

    " Light Background
    "colo summerfruit256
    "colo beauty256
    "colo phpx
    "colo morning
    "
    "" Removed from stan during mergin.
    " Zenburn : Low contrast colour scheme for low light conditions
    " http://www.vim.org/scripts/script.php?script_id=415
    "
    " tchaba : A dark color scheme, 256 color terminals
    " http://www.vim.org/scripts/script.php?script_id=3272
"" }}}

"" Commands {{{

    "" Working with .mrc files.
    "command! MarcFilter %!yaz-marcdump -o marcxml /dev/stdin
    "command! MarcUnFilter %!yaz-marcdump -i marcxml -o marc /dev/stdin
    "command! ReadMarcFile %s/\%x2e\%x1e\%x1d//g | %s/\%x20\%x20\%x1f\%x61//g
    "command! UnReadMarcFile %s/\n\n/\%x2e\%x1e\%x1d/g | %s/\n/\%x20\%x20\%x1f\%x61/g
    "command! UnReadMarcFile %s//\%x20\%x20\%x1f\%x61//g

    " Create a directory (or many if needed)
    " Example usage: ":MD some/path"
    command! -nargs=1 -complete=dir MD call mkdir("<args>", "p")
"" }}}

"" Completion {{{

    set wildmenu
    set wildmode=list:longest,full
    " This seems nice, thanks; http://www.cmdln.org/2008/10/18/vim-customization-for-python/
    set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov
    "" Test this... MS IntelliSense like?
    set showfulltag
    "" Removed 'u' option for searching unloaded buffers.
    set complete=.,w,b,t,i
    "" menu > menuone .. nice to get more info (return value)
    set completeopt=menuone,preview
"" }}}

"" filetype {{{

    """ CSharp / C# / cs.vim {{{
        " Handy info: http://vim.wikia.com/wiki/Integrate_gvim_with_Visual_Studio
        " http://www.vim.org/scripts/script.php?script_id=1895
        " http://kevin-berridge.blogspot.com/2008/09/vim-c-compiling.html
    """ }}}

    """ Python {{{
        "autocmd BufRead,BufNewFile *.py set ai
        "autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class 
    """ }}}

    """ Java {{{
        au FileType java set foldmethod=syntax
        au FileType java set textwidth=80
    """ }}}

    """ * renew fuf cache {{{
        au BufNewFile * echomsg "BufNewFile !!! : )"
    """ }}}
"" }}}

"" Formatting {{{

    "" Default encoding.
    set encoding=utf-8

    set tabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent
"" }}}

"" Functions {{{

    function! FixColorscheme() " {{{

        if has("gui_running")
            "if (g:colors_name =~ "busybee")
            if (g:colors_name =~ "BusyBee")
                hi Folded        guibg=#001336 guifg=#003DAD gui=none
                hi CursorLine    guibg=#000000 ctermbg=Black cterm=none

            elseif (g:colors_name =~ "256-jungle")
                hi CursorLine    guibg=#000000 ctermbg=Black cterm=none

            "elseif (g:colors_name =~ "xoria256")
                "hi Folded        guibg=#001336 guifg=#003DAD gui=none cterm=none
                ""hi Folded         ctermbg=234  ctermfg=25    cterm=none
            endif

        elseif &t_Co == 256
            "if (g:colors_name =~ "busybee")
            if (g:colors_name =~ "BusyBee")
                hi Folded        guibg=#001336 guifg=#003DAD gui=none
                hi CursorLine    guibg=#000000 ctermbg=Black cterm=none

            elseif (g:colors_name =~ "phpx")
                hi PmenuSel      ctermbg=13 ctermfg=Black
                hi Pmenu         ctermbg=Black ctermfg=13
                hi CursorLine    ctermbg=none cterm=none
                "hi CursorLine    ctermbg=White cterm=none
            elseif (g:colors_name =~ "herald")
                hi VertSplit      ctermbg=224  ctermfg=227   cterm=none
                hi Pmenu          ctermbg=gray    ctermfg=52
                hi Search         ctermfg=black ctermbg=214 cterm=none 
                hi IncSearch      ctermfg=black ctermbg=214 cterm=none

            elseif (g:colors_name =~ "256-jungle")
                hi CursorLine    guibg=#000000 ctermbg=Black cterm=none

            "elseif (g:colors_name =~ "xoria256")
                "hi Folded       ctermbg=234  ctermfg=25    cterm=none
                "hi Comment      ctermfg=gray
                ""hi CursorLine   cterm=none
                ""hi VertSplit    ctermbg=lightblue  ctermfg=227   cterm=none
                ""hi Search       ctermfg=none ctermbg=13 cterm=none 
                ""hi IncSearch    ctermfg=0 ctermbg=214 cterm=none

            elseif (g:colors_name =~ "desert256")
                hi Folded         ctermbg=234  ctermfg=25    cterm=none
                hi CursorLine    cterm=none
            "else
                "hi CursorLine     ctermbg=0                  cterm=none
            endif

        elseif &t_Co == 16
            hi CursorLine     ctermbg=0            cterm=none
            hi Folded         ctermbg=0  ctermfg=1  cterm=none
        elseif &t_Co == 8
            hi CursorLine     ctermbg=0             cterm=none
            hi Folded         ctermbg=0  ctermfg=1  cterm=none
        endif

    endfunction " }}}
   

    " Some general tweaks for when colorschemes.
    function! FixColors() " {{{
        highlight CursorLine ctermbg=black cterm=NONE
        "highlight CursorLine ctermbg=darkgrey cterm=NONE
        highlight Comment ctermfg=Blue
        highlight Pmenu ctermfg=gray ctermbg=black cterm=NONE
        highlight PmenuSel ctermfg=green ctermbg=black cterm=NONE

        " Terminal
        highlight StatusLine ctermfg=black ctermbg=green cterm=NONE
        highlight StatusLineNC ctermfg=black ctermbg=lightblue cterm=NONE
        " GVim
        highlight StatusLine guifg=black guibg=green
        highlight StatusLineNC guifg=black guibg=lightblue

        hi CursorLine   cterm=none
        hi VertSplit    ctermbg=lightblue  ctermfg=227   cterm=none
        hi Search       ctermfg=none ctermbg=13 cterm=none 
        hi IncSearch    ctermfg=0 ctermbg=214 cterm=none
    endfunction
    " }}}

    " Thanks, http://www.vi-improved.org/vimrc.php
    function! SimpleFoldText() " {{{
        return getline(v:foldstart).' '
    endfunction " }}}

    " Working with .mrc files.
    "function! ReadMarcFile() " {{{
        "%s/\%x2e\%x1e\%x1d//g
        "%s/\%x20\%x20\%x1f\%x61//g
    "endfunction
    "" }}}

    " Function to give us file format.
    "" See: http://vim.wikia.com/wiki/Non-native_fileformat_for_your_statusline
    function! ShowFileFormatFlag(var)
        return '['.a:var.']'
    endfunction

    "function! SetPathToProperLocation()
    "let currentPath = expand('%:p:h')
    "if currentPath == '/Somepath' ||
                "\ currentPath == '/Somepath' ||
        "exe 'set path='.currentPath
    "else
        "set path=/Some/Default/Dir
    "endif
    "endfunction

    "augroup test_path_set
    "au!
    "au BufEnter *.php call SetPathToProperLocation()
    "augroup END

    "" Path to tags file.
    function! SetTagsFile()
        let cwd = expand('%:p:h')
        if cwd =~# "/home/zarac/public_html.*"
            if !exists("tags[/home/zarac/public_html/tags]")
                set tags+=/home/zarac/public_html/tags
            endif
            "elseif cwd = "/home/zarac/public_html"
            "if !exists("tags[/home/zarac/public_html/tags]")
            "set tags+="/home/zarac/public_html"
            "endif
        endif
    endfunction

    "function! SetTagsFileJavaSource()
        "if !exists("tags[/opt/java/share/]")
            "set tags+=/opt/java/share/.tags
        "endif
    "endfunction

    
"" }}}

"" GVim {{{

    "" Fix font if running GVim doesn't work, wtf? (Moved outside for now).
    if has("gui_running")
        "set guifont=DejaVu\ Sans\ Mono\ 10
        "set guifont=Monospace\ 11
        set guioptions-=T
        set guioptions-=m
        set guioptions-=R
        set guioptions-=r
        set guioptions-=L
        set guioptions-=l
        "[HL-20100308 13:48] Might not work.. not properly tested.
        if has("gui_gtk2")
            set guifont=Luxi\ Mono\ 12
        elseif has("x11")
            " Also for GTK 1
            set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
        elseif has("gui_win32")
            "set guifont=Luxi_Mono:h12:cANSI
            set guifont=Consolas:h11:cANSI
        endif
    endif
"" }}}

"" Hostname {{{

    "" *Stan* {{{
        function! HostnameStan()
        endfunction
    "" }}}

    "" *Towelie* {{{
        function! HostnameTowelie()
            "cd z:\me
            cd ~
            nmap <silent> ,~ :cd d:\me<CR>
            nmap <silent> ,en :e d:\me\documents\notes\random.ztx<CR>
            if has("gui_running")
                set columns=100
                set lines=40
            endif
            set guifont=Consolas:h10:cANSI
            "set shell=C:\\Program\\\ Files\\\ (x86)\\Git\\bin\\sh.exe
            "set shell=C:\\Program\\\ Files\ (x86)\\Git\\bin\\sh.exe
            "set shell=C:\\Program\ Files\ (x86)\\Git\\bin\\sh.exe\ -login\ -i
            "set shell=\"C:\\Program Files (x86)\\Git\\bin\\sh.exe -login -i\"
            au BufRead *.java call SetTagsFileTowelie()
            function! SetTagsFileTowelie()
                "setlocal tags+=C:\Program\\\ Files\Java\jdk1.6.0_21\src\tags
                "setlocal tags+=C:/Program\\\ Files/Java/jdk1.6.0_21/src/tags
                setlocal tags+=c:\Program\\\ Files\Java\jdk1.6.0_22\src\tags
            endfunction
        endfunction
    "" }}}

    "" *Tweek* {{{
    function! HostnameTweek()
        set shellslash
        " code
        "set path+=/
        "echomsg "HELLO TWEEK!"

        " TESTING..
        au FileType java setlocal path+="C:\Program Files (x86)\java\"
        "au BufRead *.java setlocal path+="C:\Program Files (x86)\java\"
 
        " TESTING..
        "au FileType java setlocal tags+=C:\Program\\\ Files\Java\jdk1.6.0_21\src\tags"
        "au BufRead *.java setlocal tags+=C:\Program\\\ Files\Java\jdk1.6.0_21\src\tags"

        " TESTING..
        "" Path to tags file for java on tweek
        "au FileType java call SetTagsFileJavaTweek()
        au BufRead *.java call SetTagsFileJavaTweek()
        function! SetTagsFileJavaTweek()
            "setlocal tags+=C:\Program\\\ Files\Java\jdk1.6.0_21\src\tags
            setlocal tags+=C:/Program\\\ Files/Java/jdk1.6.0_21/src/tags

            let cwd = expand('%:p:h')
            if cwd =~# ".*me/development/java/talisman.*"
                "if !exists("tags[z:/me/development/java/talisman/src/tags]")
                    setlocal tags+=z:/me/development/java/talisman/src/tags
                "endif
            endif
        endfunction

        if has('win32')
            cd d:\me
        endif
        set columns=82
    endfunction
    "" }}}

    "" *Chef* {{{
    function! HostnameChef()
        au BufRead *.java call SetTagsFileJavaChef()
        function! SetTagsFileJavaChef()
            setlocal tags+=C:/Program\\\ Files/Java/jdk1.6.0_23/src/tags
        endfunction
    endfunction
    "" }}}

    if hostname() == "STAN"
        call HostnameStan()
    endif

    if hostname() == "TOWELIE"
        call HostnameTowelie()
    endif

    if hostname() == "TWEEK"
        call HostnameTweek()
    endif

    if hostname() == "CHEF"
        call HostnameChef()
    endif

    "au BufRead *.java set tags+="C:\Program Files\Java\jdk1.6.0_21\src\.tags"
    "au BufRead *.java set tags+=taggar

    "" Easy access to windows versions of some unix tools. http://unixtools.sourceforge.net/
    "set path+=S:\\Programs\\UnixTools

    "Include AquaBrowser source files.
    "if !exists("tags[~/MediaLab/Source/tags]")
        "set tags+=~/MediaLab/Source/tags
    "endif
"" }}}

"" Mappings (Key bindings) {{{

    " Change <Leader> (default is \).
    " let mapleader = ","
    "" Using , here since i don't use the default binding anyway (:h ,).
    "" ... and i use \ as well.

    " Show the keys as they are pressed.
    set showcmd

    """ Windows {{{
        " resize horizontal splits
        nmap + <C-w>+
        "nmap <M-+> <C-W>>
        nmap - <C-w>-
        "nmap <C-J> <C-W>+
        "nmap <C-K> <C-W>-
        "nmap <M--> <C-W><
        "nmap <A-=> <C-W>-
        "nmap <A-=> <C-W>-

        " resize vertical splits
        " ToDo: Why doesn't this work!?
        " 260-261 http://github.com/mitechie/pyvim/blob/master/.vimrc
        nmap <M-,> <C-W>>
        nmap <M-.> <C-W><
        "nmap ,, <C-W>>
        "nmap ,. <C-W><
        "nmap <C-0> <C-W>>
        "nmap <C-9> <C-W><
        "
        "" Switch window easier.
        nmap <Esc><C-h> <C-w>h
        nmap <Esc><C-j> <C-w>j
        nmap <Esc><C-k> <C-w>k
        nmap <Esc><C-l> <C-w>l
    """ }}}

    """ Tabs <C-t> {{{
        "" Rebind default, CTRL-T :tag
        nmap ,T :tag<CR>
        nmap <C-t>c :tabnew<CR>
        nmap <C-t>n :tabnext<CR>
        nmap <C-t>p :tabNext<CR>
    "" }}}

    """ Setters ,s {{{
        "nmap <silent> ,scc :set cc=+1,80,90,100,150,200,250,300,350,400,450,500,550,600,650,700,850,900,950,1000<CR>
        nmap <silent> ,scc :set colorcolumn=81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100<CR>
        nmap <silent> ,scC :set colorcolumn=<CR>
        nmap <silent> ,sbd :set background=dark<CR>:set background?<CR>
        nmap <silent> ,sbl :set background=light<CR>:set background?<CR>

        "" fix ugly CursorLine and other colorscheme things
        "" TODO: Should probably be functions instead of bindings.
        map ,CF :call FixColors()<CR>
        map ,CL :highlight CursorLine ctermbg=darkgrey cterm=NONE<CR>
        map ,CCb :highlight Comment ctermfg=Blue<CR>
        map ,CCc :highlight Comment ctermfg=Cyan<CR>
        map ,CCgra :highlight Comment ctermfg=Gray<CR>
        map ,CCgre :highlight Comment ctermfg=Green<CR>
        map ,CCr :highlight Comment ctermfg=Red<CR>
        map ,CCm :highlight Comment ctermfg=Magenta<CR>
        map ,CCy :highlight Comment ctermfg=Yellow<CR>
        "" TODO: Fix, doesn't work...
        "command! -nargs=0 ZCCy hightlight Comment ctermfg=Yellow
    "" }}}

    "" Switching buffers made easier. (Defaults are mapped to next/previous row,
    "" same as j and k.)
    nmap <C-P> :bp<CR>
    nmap <C-N> :bn<CR>

    "" Edit / source ~/.vimrc easily so we can efficiently make it elite. {{{
        nmap ,vh :e ~/vimHelp.txt<CR>
        nmap ,ve :e $MYVIMRC<CR>
        nmap ,vs :source $MYVIMRC<CR>
        nmap ,vn :e ~/notes.txt<CR>
    "" }}}

    "" Diff 'd' {{{
        nmap <silent> ,dd :set diff scb fdm=diff fdc=2<CR>
        nmap <silent> ,dD :windo :set diff scb fdm=diff fdc=2<CR>
        nmap <silent> ,do :set nodiff noscb fdm=manual fdc=0<CR>
        nmap <silent> ,dO :windo :set nodiff noscb fdm=manual fdc=0<CR>
        "nmap <silent> ,dd :diffthis<CR>
        "nmap <silent> ,dD :windo :diffthis<CR>
        "nmap <silent> ,do :diffoff<CR>
        "nmap <silent> ,dO :windo :diffoff<CR>
        nmap <silent> ,du :diffupdate<CR>
    "" }}}

    "" Binary 'b' mode {{{
        nmap <silent> ,bd :set textwidth=0 wrapmargin=0 nomodeline noexpandtab<CR>:echo "Binary mode ON"<CR>
        nmap <silent> ,bo :set textwidth=78 wrapmargin=0 modeline expandtab<CR>:echo "Binary mode OFF"<CR>
    "" }}}

    "" Filters 'F' {{{
        "[HL-2010-09-05 03:49]  ooppps...
        nmap <silent> ,Fhh :%!xxd<CR>
        nmap <silent> ,FhH :%!xxd -r<CR>
        vmap <silent> ,Fhh :!xxd<CR>
        vmap <silent> ,FhH :!xxd -r<CR>

        nmap <silent> ,Fhp :%!xxd -p<CR>
        nmap <silent> ,FhP :%!xxd -p -r<CR>
        vmap <silent> ,Fhp :!xxd -p<CR>
        vmap <silent> ,FhP :!xxd -p -r<CR>
        "nmap <silent> ,Fah :%!xxd -u<CR>
        "nmap <silent> ,FaH :%!xxd -r<CR>
        "vmap <silent> ,Fah :!xxd -u<CR>
        "vmap <silent> ,FaH :!xxd -r<CR>

        "nmap <silent> ,Fh :%!xxd -p -u<CR>
        "nmap <silent> ,FH :%!xxd -p -r<CR>
        "vmap <silent> ,Fh :!xxd -p -u<CR>
        "vmap <silent> ,FH :!xxd -p -r<CR>
    "" }}}

    "" Togglers {{{
        "" Toggle smartindet checking
        nmap <silent> ,ti :set invsmartindent<CR>:set smartindent?<CR>

        "" Toggle list
        nmap <silent> ,tl :set invlist<CR>:set list?<CR>

        "" TODO: Paste on <SHIFT>+<INSERT> with set paste in insert mode (then
        " set nopaste). Not sure if it's possible. (The terminal emulator does
        " the pasting, not vim, so vim cannot handle it?)
        nmap <silent> ,pi :set paste<CR>i
        nmap <silent> ,pI :set paste<CR>I
        nmap <silent> ,po :set paste<CR>o
        nmap <silent> ,pO :set paste<CR>O
        "nmap ,ip :set paste<CR><S-O><S-INS><ESC>:set nopaste<CR>

        "" Toggle paste mode
        nmap <silent> ,tp :set invpaste<CR>:set paste?<CR>
        "imap <silent> <C-P> :set paste<CR>
        "imap <silent> <Insert> :set invpaste<CR>:set paste?<CR>

        "" Toggle spell checking
        nmap <silent> ,ts :set invspell<CR>:set spell?<CR>

        "" Set text wrapping toggles
        nmap <silent> ,tw :set invwrap<CR>:set wrap?<CR>

        "" Toggle line numbering
        nmap <silent> ,tn :set number!<CR>:set number?<CR>

        "" hightlight search
        nmap <silent> ,th :set invhls<CR>:set hls?<CR>

        "" shellslash
        nmap <silent> ,t/ :set invshellslash<CR>:set shellslash?<CR>

        "" toggle long / short statusline
        nmap <silent> ,tS :call ZToggleStatusline()<CR>

        "" toggle splitright
        nmap <silent> ,tz :set splitright!<CR>:set splitright?<CR>

        "" togle background
        "nmap <silent> ,tb call ZToggleBackground()<CR>
        " function! ZToggleBackground()
            "" echo 'hi'
        " endfunction
    "" }}}

    "" :copen / error / quickfix / Scratch list {{{
        "nmap ,en :cnext<CR>
        "nmap ,ej :cnext<CR>
        "nmap ,ep :cprev<CR>
        "nmap ,ek :cprev<CR>
        "" TODO : Perhaps replace :copwn with :cwin (to not show window if there are no matches)
        nmap ,sl :copen<CR>
        nmap ,sj :cnext<CR>
        nmap ,sk :cprevious<CR>
        nmap ,sh :cclose<CR>
    "" }}}

    "" Location list {{{
        "nmap ,ln :lnext<CR>
        nmap ,lj :lnext<CR>
        "nmap ,lp :lprevious<CR>
        nmap ,lk :lprevious<CR>
        "nmap ,lo :lopen<CR>
        nmap ,ll :lopen<CR>
        "nmap ,lc :lclose<CR>
        nmap ,lh :lclose<CR>
    "" }}}

    " Turn off highlight search
    nmap <silent> ,n :nohlsearch<CR>

    " cd to the directory containing the file in the buffer
    " all
    nmap <silent> ,cd :cd %:h<CR>
    " local
    nmap <silent> ,lcd :lcd %:h<CR>

    " Make the directory that contains the file in the current buffer.  This is
    " useful when you edit a file in a directory that doesn't (yet) exist
    nmap <silent> ,md :!mkdir -p %:p:h<CR>

    "" Run shell
    nmap <silent> ,rs :vsplit<CR>:source ~/.vim/vimsh/vimsh.vim<CR>
    nmap <silent> ,rS :split<CR>:source ~/.vim/vimsh/vimsh.vim<CR>

    "" Wipe buffer without closing window.
    nmap <silent> ,bw :bp\|bw#<CR>
    nmap <silent> ,bW :bp\|bw!#<CR>

    "" ctags ,. {{{

        " Generate tags recursively for current directory.
        nmap <silent> ,.T :!ctags -R .<CR>
        " Split down
        nmap <silent> ,.tj <C-W>s<C-]>
        " Split up
        nmap <silent> ,.tk <C-W>s<C-W>k<C-]>
        " Split left
        nmap <silent> ,.th <C-W>v<C-W>h<C-]>
        " Split right
        nmap <silent> ,.tl <C-W>v<C-]>
    "" }}}

    "" Fuzzy Finder {{{
        nmap ,fn :set nopaste<CR>:FufBuffer<CR>
        nmap ,f' :set nopaste<CR>:FufBookmarkFile<CR>
        nmap ,f" :set nopaste<CR>:FufBookmarkDir<CR>
        nmap ,fmd :set nopaste<CR>:FufBookmarkDirAdd<CR>
        nmap ,fmf :set nopaste<CR>:FufBookmarkFileAdd<CR>
        nmap ,ff :set nopaste<CR>:FufFile<CR>
        nmap ,fF :set nopaste<CR>:FufFileWithCurrentBufferDir<CR>
        "nmap ,ff :set nopaste<CR>:FufFile<CR>
        "nmap ,fF :set nopaste<CR>:FufFileWithCurrentBufferDir<CR>
        nmap ,fa :set nopaste<CR>:FufFileWithFullCwd<CR>
        nmap ,ft :set nopaste<CR>:FufTag<CR>
        nmap ,fd :set nopaste<CR>:FufDirWithFullCwd<CR>
        "nmap ,fd :set nopaste<CR>:FufDir<CR>
        "nmap ,fD :set nopaste<CR>:FufDirWithFullCwd<CR>
        "nmap ,fm :set nopaste<CR>:FufMruFile<CR>
        nmap ,fc :set nopaste<CR>:FufChangeList<CR>
        "nmap ,fc :set nopaste<CR>:FufMruCmd<CR>
        "nmap ,fl :set nopaste<CR>:FufLine<CR>
        nmap ,fr :set nopaste<CR>:FufRenewCache<CR>
        let g:fuf_keyPrevPattern = '<TAB>'
        let g:fuf_keyNextPattern = '<S-TAB>'
        "let g:fuf_keyPrevPattern = '<C-i>'
        "let g:fuf_keyNextPattern = '<C-o>'
    "" }}}

    "" Create fold of outer block.
    nmap z, va{zf
    
    "" ,i - inputting things in normal mode {{{
        "" insert new empty line below
        "" ToDo:
        " nmap <silent> ,io 
    "" }}}

    "" easier home
    nmap <silent> \h :cd ~<CR>

    "" easier opening of files at my mah-website
    nmap <silent> ,em :e ftp://m10p2661@ftphome.mah.se/public_html/

"" }}}

"" Mouse {{{

    " Enable mouse support
    set mouse=a
"" }}}

"" Movement {{{

    "" Allow backspace to delete previously entered characters.
    set backspace=2

    "" Allow h and l to wrap to next and previous lines.
    set whichwrap+=h
    set whichwrap+=l
"" }}}

"" Normal Mode {{{

    "" View $ at end of change selection.
    set cpoptions+=$

    set nrformats=hex
"" }}}

"" Plugins {{{

    "" removed while merging / started using git {{{

        " some are good, just not needed now.. and some i've barely used
        "
        " javacomplete : Omni Completion for JAVA
        " http://www.vim.org/scripts/script.php?script_id=1785
        "
        " xmledit : A filetype plugin to help edit XML, HTML, and SGML
        " documents
        " http://www.vim.org/scripts/script.php?script_id=301
        "
        " xml.vim : helps editing xml (and [x]html, sgml, xslt) files
        " http://www.vim.org/scripts/script.php?script_id=1397
        "
        " Align : Help folks to align text, eqns, declarations, tables, etc
        " http://www.vim.org/scripts/script.php?script_id=294
        "
        " AutoComplPop : Automatically opens popup menu for completions
        " http://www.vim.org/scripts/script.php?script_id=1879
        "
        " cecutil : Some utilities used by several of my scripts (window
        " positioning, mark handling)
        " http://www.vim.org/scripts/script.php?script_id=1066
        "
        " hexman.vim : Simpler Hex viewing and editing
        " http://www.vim.org/scripts/script.php?script_id=666
        "
        " paster.vim : paster.vim - A configurable Vim plugin for posting text
        " to a public pastebin
        " http://www.vim.org/scripts/script.php?script_id=2602
        "
        " phpfolding.vim : Automatic folding of PHP functions, classes,..
        " (also folds related PhpDoc)
        " http://www.vim.org/scripts/script.php?script_id=1623
        "
        " vimwiki : Personal Wiki for Vim
        " http://www.vim.org/scripts/script.php?script_id=2226
        "
        " ? plugin/align_regex.vim ? (backed up at towelie)
        " ? indent/xml.vim ? (backed up at towelie)
        " ? after/syntax/python.vim < i think that's mine (backed up at towelie)
        "
        " Color Sampler Pack : *NEW* [Jan 2010 Update] Top 100 Themes, GUI Menu
        " http://www.vim.org/scripts/script.php?script_id=625
        "
        " python_fn
        " http://www.vim.org/scripts/script.php?script_id=30
        "
        " ScrollColors : Colorsheme Scroller, Chooser, and Browser
        " http://www.vim.org/scripts/script.php?script_id=1488
        "
        " VimPdb : Integrated Python debugging within Vim
        " http://www.vim.org/scripts/script.php?script_id=2043
        "
        " LocateOpen : Open files without having to supply a path
        " http://www.vim.org/scripts/script.php?script_id=858
        "
        " multvals.vim : Array library that uses patterns as separators
        " http://www.vim.org/scripts/script.php?script_id=171
        "
        " browser.vim : a lightweight web browser opening in a split window
        " for wikipedia etc.
        " http://www.vim.org/scripts/script.php?script_id=2227
        "
        " Arduino syntax file : Syntax file for Arduino .PDE files
        " http://www.vim.org/scripts/script.php?script_id=2654
        "
        " php.vim : PHP Syntax
        " http://www.vim.org/scripts/script.php?script_id=1571
        "
        " vimsh.tar.gz : terminal/shell buffer script for python enabled [g]vim
        " http://www.vim.org/scripts/script.php?script_id=165
        "
        " python_ifold : Improved version of python_fold. Uses folding
        " expression for python code.
        " http://www.vim.org/scripts/script.php?script_id=2002
    "" }}}

    "" to check out... {{{
        " GoogleReader.vim : vimscript for googlereader
        " http://www.vim.org/scripts/script.php?script_id=2678
        "
        " Txtfmt (The Vim Highlighter) : "Rich text" highlighting in Vim! (colors, underline, bold, italic, etc...)
        " http://www.vim.org/scripts/script.php?script_id=2208
        "
        " python.vim : A set of menus/shortcuts to work with Python files
        " http://www.vim.org/scripts/script.php?script_id=30
        "
        " GoogleSuggest Complete : complete function using google suggest API. perhaps, you should input japanese w 
        " http://www.vim.org/scripts/script.php?script_id=2948
        "
        " histwin.vim : Browse the undo tree
        " http://www.vim.org/scripts/script.php?script_id=2932
    "" }}}

    "" gundo {{{
        nnoremap <F5> :GundoToggle<CR>
    "" }}}

    """ eclim / JavaComplete plugin ,.j {{{
        "nmap <silent> ,.ji :JavaImport<CR> :echo ":JavaImport"<CR>
        ""nmap <silent> ,.jim :JavaImportMissing<CR> :echo ":JavaImportMissing"<CR>
        "nmap <silent> ,.jI :JavaImportMissing<CR> :echo ":JavaImportMissing"<CR>
        "nmap <silent> ,.jl :JavaImpl<CR> :echo ":JavaImpl"<CR>
        "nmap <silent> ,.jc :Javac<CR> :echo ":Javac"<CR>
        "nmap <silent> ,.js :Java %<CR> :echo ":Java %"<CR>
        "nmap <silent> ,.jS :Javac<CR> :Java<CR> :echo ":Javac \| :Java"<CR>
        ""nmap <silent> ,.jS :Javac<CR> :Java %<CR> :echo ":Javac \| :Java %"<CR>
        "nmap <silent> ,.jds :JavaDocSearch<CR> :echo ":JavaDocSearch"<CR>
        "nmap <silent> ,.jdc :JavaDocComment<CR> :echo ":JavaDocComment"<CR>
        "" Start eclimd
        "nmap <silent> ,.je :!eclimd.bat<CR>
        "" Stop eclimd
        "nmap <silent> ,.jE :ShutdownEclim<CR>
        "" Open all projects tree
        "nmap <silent> ,.jp :ProjectsTree<CR>
    """ }}}

    """ eclim / Project plugin ,p {{{

        "nmap <silent> ,pl :ProjectList<CR>
        "nmap <silent> ,po :ProjectOpen<SPACE>
        ""nmap <silent> ,po :ProjectOpen<SPACE><Tab>
        "nmap <silent> ,pt :ProjectsTree<CR>
    """ }}}

    "" RecoverPlugin {{{
        nmap <silent> ,.r :RecoverPluginFinish<CR>
    "" }}}

    "" eclim {{{
        "" Don't use automatic logging import (and whatever else it does).
        let g:EclimLoggingDisabled = 1
    "" }}}

    "" javacomplete {{{
        au FileType java setlocal omnifunc=javacomplete#Complete
    "" }}}

    "" DirDiff {{{
        let g:DirDiffExcludes="*.swp,.git"
    "" }}}

    "" TOhtml {{{
        let use_xhtml = 1
        let html_use_css = 1

        " Only use this if you have syntax/2html.vim that supports it (" Last Change: 2008 Jul 17).
        let html_dynamic_folds = 1
        " no_foldcolumn implies hover_unfold.
        if exists("html_no_foldcolumn")
            unlet html_no_foldcolumn
        endif
        " Hover doesn't work with multi-level-folds.
        if exists("html_hover_unfold")
            unlet html_hover_unfold
        endif
    "" }}}

    "" phpfolding {{{
        "let g:DisableAutoPHPFolding = 1
    "" }}}

    "" VimCalc {{{
        "nmap <silent> ,C :Calc<CR>
    "" }}}

    "" Surround {{{
        " VS<div> " surround line
    "" }}}

    "" NerdTree {{{
        nmap <silent> ,N :NERDTreeToggle<CR>
    "" }}}
"" }}}

"" Searching {{{

    set ignorecase
    set smartcase
    set wrapscan
    set incsearch
    set hlsearch
    "" Temporarly turn off hlsearch (it gets turned on when sourcing .vimrc).
    nohlsearch

"" }}}

"" Setup / autocommands {{{
    
    filetype plugin indent on

    "" To let us set some settings only once. {{{
        if exists("isRunning")
            let firstRun = 0
        else
            let firstRun = 1
        endif
        let isRunning = 1
    " }}}

    " Reset any old auto commands to avoid duplicates.
    autocmd!
    " Thanks, http://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting
    augroup myvimrc 
        au!
	    "au BufWritePost $MYVIMMRC so $MYVIMRC
        "au BufWritePost .vimrc,_vimrc so $MYVIMRC
        au BufWritePost [._]vimrc so $MYVIMRC
    augroup END

    "augroup mycolorschemes
        "au!
        "" TODO: check which to use (from towelie)
        ""au ColorScheme * call FixColorscheme()
        "au ColorScheme * call FixColorscheme() | call FixColors()
    "augroup END

    "" Turn off compatability with Vi (this is Vim).
    set nocompatible

    "" timeout for keystrokes
    set timeoutlen=1000

    "" history entires (per history)
    set history=100

    " TODO : set system specific
    "" Share Windows cliboard, not sure if it works
    set clipboard+=unnamed

    "" Directory for swap files.
    "set directory=~/.vim/tmp

    "" Use blowfish as default encryption method.
    set cryptmethod=blowfish
"" }}}

"" Testing {{{

    "" Automatic transformation of marc files.
    " Would be nice if it could be done on BufReadPre maybe?
    au BufNewFile,BufRead *.mrc :%!yaz-marcdump -o marcxml /dev/stdin 
    au BufWrite *.mrc :%!yaz-marcdump -i marcxml -o marc /dev/stdin 

    "" C# Code completion. {{{

        "au FileType cs set omnifunc=syntaxcomplete#Complete
        "au FileType cs set foldmethod=marker
        "au FileType cs set foldmarker={,}
        "au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
        "au FileType cs set foldlevelstart=2
    "" }}}


    function! <SID>OutlineToggle() "" {{{
      let OldLine = line(".")
      let OldCol = virtcol(".")
      if (! exists ("b:outline_mode"))
        let b:outline_mode = 0
        let b:OldMarker = &foldmarker
      endif
      if (b:outline_mode == 0)
        let b:outline_mode = 1
        set foldmethod=marker
        set foldmarker={,}
        silent! exec "%s/{{{/{<</"
        silent! exec "%s/}}}/}>>/"
        set foldcolumn=4
      else
        let b:outline_mode = 0
        set foldmethod=marker
        let &foldmarker=b:OldMarker
        silent! exec "%s/{<</{{{/"
        silent! exec "%s/}>>/{{{/"
        set foldcolumn=0
      endif
      execute "normal! ".OldLine."G"
      execute "normal! ".OldCol."|"
      unlet OldLine
      unlet OldCol
      execute "normal! zv"
    endfunction "" }}}
    :command! -nargs=0 FOLD call <SID>OutlineToggle()

    "let g:SaveUndoLevels = &undolevels
    "let g:BufSizeThreshold = 1000000
    "if has("autocmd")
      "" Store preferred undo levels
      "au VimEnter * let g:SaveUndoLevels = &undolevels
      "" Don't use a swap file for big files
      "au BufReadPre * if getfsize(expand("<afile>")) >= g:BufSizeThreshold | setlocal noswapfile | endif
      "" Upon entering a buffer, set or restore the number of undo levels
      "au BufEnter * if getfsize(expand("<afile>")) < g:BufSizeThreshold | let &undolevels=g:SaveUndoLevels | hi Cursor term=reverse ctermbg=black guibg=black | else | set undolevels=-1 | hi Cursor term=underline ctermbg=red guibg=red | endif
    "endif

    "" Multi read...
    " for i in split(expand("/etc/apache2/mods-enabled/*conf"),"\n") | echo "hi".i | endfor
    "
    ""
    let g:acp_enableAtStartup = 0

    au BufEnter,BufNew,BufNewFile * set cursorline
    au BufLeave * set nocursorline
"" }}}

"" Visual {{{

    "" Allow the title of the window to be set. {{{
        set title
        "" Specify the title. ("By placing the expand expression inside a %{} pair, it is reevaluated automatically and doesn't require an autocommand around it.")
        "set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
        set titlestring=%{hostname()}\ %([%M]\ %)[\ %{getcwd()}\ ]\ %f%(\ %a%)%(\ \@\ %{v:servername}%)\ %{ShowFileFormatFlag(&fileformat)}

        "let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
        "if &term == "screen"
        "set t_ts=^[k
        "set t_fs=^[\
        "endif
        "if &term == "screen" || &term == "xterm"
        "set title
        "endif
    "" }}}

    "" No annoying beep, use visual bell
    set visualbell

    set t_Co=256
    set fillchars=fold:-
    set cursorline
    syntax on

    "" colors {{{
        "[HL-20100314 05:44] TODO : Fix this!
        if firstRun == 1
            colorscheme zxoria
            "TODO : should we use? -towelie
            "call FixColors()
        endif
        "call FixColors()
        "call FixColorscheme()

        "hi NonText      ctermfg=DarkGray
        "hi SpecialKey   ctermfg=Green
    "" }}}
 
    " Don't redraw screen when running macros etc.
    set lazyredraw
    "autocmd InsertLeave * set cursorline
    "autocmd InsertEnter * set nocursorline

    "" Diff options; ignore whitespace.
    set diffopt+=iwhite

    "" Show current mode in status-bar.
    set showmode

    "set shellslash
    "" Set the status line the way I like it
    "" t=tail f=fileAsTyped F=full
    "set stl=\ %M\ %R\ %F\ %l(%L)\ %c\ [%b\ 0x%B]
    "set statusline=\ %l(%L)\ %c\ %M\ %R\ %t\ [%b\ 0x%B]
    " IAMHERE
    " http://www.csie.ntu.edu.tw/~r95005/vimrc.html
    " %1* -> User1's highlight, %2*->User2's highlight
    " =   -> Separation point between left and right aligned items.
    " <   -> Where to truncate line if too long.  Default is at the start.
    "set statusline=%4*%<\ %1*[%F]
    "set statusline+=%4*\ %5*[%{&encoding}, " encoding
    "set statusline+=%{&fileformat}]%m " file format
    "set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
    "
    "
    """""http://dev.gentoo.org/~bass/configs/vimrc.html
    """" Nice statusbar
    """set laststatus=2
    """set statusline=
    """set statusline+=%2*%-3.3n%0*\                " buffer number
    """set statusline+=%f\                          " file name
    """set statusline+=%h%1*%m%r%w%0*               " flags
    """set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
    """set statusline+=%{&encoding},                " encoding
    """set statusline+=%{&fileformat}]              " file format
    """if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
    """    set statusline+=\ %{VimBuddy()}          " vim buddy
    """endif
    """set statusline+=%=                           " right align
    """set statusline+=%2*0x%-8B\                   " current char
    """set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
    """
    """" special statusbar for special windows
    """if has("autocmd")
    """    au FileType qf
    """                \ if &buftype == "quickfix" |
    """                \     setlocal statusline=%2*%-3.3n%0* |
    """                \     setlocal statusline+=\ \[Compiler\ Messages\] |
    """                \     setlocal statusline+=%=%2*\ %<%P |
    """                \ endif
    """
    """    fun! <SID>FixMiniBufExplorerTitle()
    """        if "-MiniBufExplorer-" == bufname("%")
    """            setlocal statusline=%2*%-3.3n%0*
    """            setlocal statusline+=\[Buffers\]
    """            setlocal statusline+=%=%2*\ %<%P
    """        endif
    """    endfun
    """
    """    au BufWinEnter *
    """                \ let oldwinnr=winnr() |
    """                \ windo call <SID>FixMiniBufExplorerTitle() |
    """                \ exec oldwinnr . " wincmd w"
    """endif
    "
    "" statusline {{{
        "" TODO : fix statusline
        "set statusline=%{getcwd()}
        "set statusline=%{expand('%:p:h')}
        "set statusline+=\ %t\ %M\ %l(%L)\ %c\ %R
        "set statusline+=%{fugitive#statusline()}
        function! ZToggleStatusline()
            if (g:statusMode == 1)
                call ZStatuslineShort()
            else
                call ZStatuslineLong()
            endif
        endfunction
        function! ZStatuslineShort()
            let g:statusMode = 0
            set statusline=\ %t\ %M\ %l(%L)\ %c\ %R
            set statusline+=%{fugitive#statusline()}
        endfunction
        function! ZStatuslineLong()
            call ZStatuslineShort()
            let g:statusMode = 1
            set statusline=%{expand('%:p:h')}
            set statusline+=\ %t\ %M\ %l(%L)\ %c\ %R
            set statusline+=%{fugitive#statusline()}
        endfunction
        if firstRun == 1
            "let g:statusMode = 0
            "call ZToggleStatusline()
            call ZStatuslineLong()
        endif
        "set statusline+=VB%{VimBuddy()}
        "set titlestring=%{hostname()}\ %([%M]\ %)[\ %{getcwd()}\ ]\ %f%(\ %a%)%(\ \@\ %{v:servername}%)\ %{ShowFileFormatFlag(&fileformat)}
        "set statusline=\ %M\ %F\ %t\ %l(%L)\ %c\ %R\ %{fugitive#statusline()}
        set laststatus=2
    "" }}}

    set scrolloff=3
    "set virtualedit=all

    "" Turn off text wrap (toggle with ,tw). prepend g to move within line (gh gj gk gl g0 g$ ...).
    set nowrap
    set linebreak
    set showbreak=… "unicode 2026 .. ctrl-vu to insert
"" }}}

"" Window {{{

    " Select right and below windows when splitting.
    set splitright
    set splitbelow
"" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " vim: set fdt=SimpleFoldText() : "
 " vim: set tw=78 ts=4 ft=vim fdm=marker fmr=\ {{{,\ }}}: "
