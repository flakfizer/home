set nocompatible
filetype plugin on

"==============================================================================
" BUNDLES
"==============================================================================
" {{{

" To bootstrap: 
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle "vundle"

" General
" Note: DirDiff needs to be commented out for BundleInstall if already installed
Bundle 'DirDiff.vim'
" {{{
let g:DirDiffExcludes = "moc_*,*.o,ui_*.h,*.moc,qrc_*.cpp,Makefile*"
let g:DirDiffSort = 1
let g:DirDiffWindowSize = 12 " }}}
Bundle 'EnhCommentify.vim'
" {{{
let g:EnhCommentifyRespectIndent    = 'Yes'
let g:EnhCommentifyPretty           = 'Yes' " }}}
Bundle 'snipMate'
Bundle 'vimwiki'
" {{{
let g:vimwiki_camel_case = 0
let g:vimwiki_browsers=['firefox'] " }}}

Bundle 'https://github.com/scrooloose/nerdtree.git'

" Tool integration
Bundle "ack.vim"
Bundle 'fugitive.vim'
Bundle 'git-commit'
" {{{
let g:git_diff_spawn_mode = 1 " horizontal split
" let g:git_diff_spawn_mode = 2 " vertical split " }}}

" Program language-specific
Bundle 'OmniCppComplete'
" {{{
let OmniCpp_ShowPrototypeInAbbr=1 " }}}

" Syntax
Bundle 'confluencewiki.vim'
Bundle 'django.vim'
Bundle 'Windows-PowerShell-Syntax-Plugin'

" Colors
Bundle 'Ambient-Color-Scheme'
Bundle 'badwolf'
Bundle 'darkspectrum'
Bundle 'https://github.com/tristen/superman.git'
Bundle 'jellybeans.vim'
Bundle 'Liquid-Carbon'
Bundle 'Lucius'
Bundle 'molokai'
Bundle 'Mustang2'
Bundle 'peaksea'
Bundle 'Solarized'
" {{{
let g:solarized_termcolors=256 " }}}

" }}}

"==============================================================================
" APPEARANCE
"==============================================================================
" {{{

" color du jour
colorscheme Mustang
syntax on
let mapleader = ','

" }}}

"==============================================================================
" OPTIONS
"==============================================================================
" {{{

set backspace=indent,eol,start
set completeopt=menuone,menu
set formatoptions+=roc
set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
set guioptions-=m " no gui menubar
set guioptions-=T " no gui toolbar
set history=800
set hlsearch
set ignorecase
set listchars+=precedes:<,extends:>,tab:>-
set ruler
set scrolloff=3
set showcmd
set showmatch
set smartcase
set switchbuf=useopen
set t_Co=256 " 256 color terminal
set undodir=/tmp
set undofile
set visualbell
set wildmenu
set wildmode=list:longest

" }}}

"==============================================================================
" CUSTOM FILE EXTENSION TO FILE TYPE MAPPINGS
"==============================================================================
" {{{

autocmd BufNewFile,BufRead, *.1sc,*.bt set ft=c " 010 Editor scripts and templates
autocmd BufNewFile,BufRead, *.i,*.gcov set ft=cpp
autocmd BufNewFile,BufRead, *.json set ft=javascript
autocmd BufNewFile,BufRead, *.pro,*.pri set expandtab ft=conf ts=4 sw=4
autocmd BufNewFile,BufRead, *.proto set ft=proto
autocmd BufNewFile,BufRead, *.ps1 set filetype=ps1 " powershell
autocmd BufNewFile,BufRead, *.qml set ft=qml
autocmd BufNewFile,BufRead, *.vcproj,*.proj,*.wixproj,*.wxs set ft=xml 
autocmd BufNewFile,BufRead, *tags,*Tags set ft=tags
autocmd BufNewFile,BufRead, *valgrind* set ft=valgrind

" }}}

"==============================================================================
" FILE-TYPE SPECIFIC OPTIONS
"==============================================================================
" {{{

"autocmd Filetype c,cpp :2match Error /\%101c/
autocmd Filetype c,cpp setlocal expandtab cindent ts=4 sw=4
autocmd Filetype javascript setlocal expandtab cindent ts=4 sw=4
autocmd Filetype mail setlocal wrap wrapmargin=75
autocmd Filetype python setlocal expandtab tabstop=4 sts=4 shiftwidth=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class, makeprg=./%
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype sh setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype txt setlocal wrap wrapmargin=75
autocmd Filetype vim setlocal expandtab tabstop=4 shiftwidth=4 smartindent
autocmd Filetype xml compiler xmllint
autocmd Filetype xml setlocal errorformat+=%E%f:%l:\ %m
autocmd Filetype xml setlocal makeprg=xmllint\ --noout\ --schema\ ~/pdls/PDD_CDD.xsd\ % errorformat=%f:%l:%m
autocmd Filetype xml,html,xslt setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype xsd setlocal tabstop=1
let g:xml_syntax_folding=1

" set cinoptions+=g0,:0

" Read-only pdf through pdftotext
autocmd BufReadPre *.pdf silent setlocal ro
autocmd BufReadPre *.pdf syntax off
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78

" Read-only Word doc through antiword
autocmd BufReadPre *.doc setlocal ro 
autocmd BufReadPre *.doc syntax off
autocmd BufReadPost *.doc %!antiword "%"

" Read-only odt/odp through odt2txt
autocmd BufReadPre *.odt,*.odp silent setlocal ro
autocmd BufReadPre *.odt,*.odp syntax off
autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"

" Try to detect the filetype of files being diffed from svn
autocmd BufRead    *.svn-base execute 'doautocmd filetypedetect BufRead ' . expand('%:r')
autocmd BufNewFile *.svn-base execute 'doautocmd filetypedetect BufNewFile ' . expand('%:r')

" Read-only rtf through unrtf
" autocmd BufReadPre *.rtf silent set ro
" autocmd BufReadPost *.rtf silent %!unrtf --text

if &term == "xterm"
    set t_kb=  "ctr-v + BS
    fixdel
endif

" }}}

"==============================================================================
" CUSTOM KEY MAPPINGS
"==============================================================================
" {{{

map Y y$

" Change working directory to desktop
cmap cdd cd /desktop

" Change working directory to the directory containing the current file
cmap cdf exec("cd " . substitute(expand("%:h"), " ", "\\\\ ", "g"))

" Show current function
map <silent> <Leader>f :call ShowCurrentCFunctionVariation()<CR>

" set diffopt+=context:10000000,vertical
set diffopt+=context:10000000,vertical,iwhite
" maximize window if in diff mode
if &diff
    au GuiEnter * simalt ~x
    " Diff key bindings
    nmap <F7> [czz
    nmap <F8> ]czz
    nmap <F2> do
    nmap <F3> dp
    nmap <F1> :qa<CR>
    color jellybeans " least bad terminal color for diffing
else
    nmap <F7> :cp \| normal zz <CR>
    nmap <F8> :cn \| normal zz <CR>
endif

" Searching helper
nmap <F10> nzz
nmap <F9> Nzz

" Diff navigation
nmap <F7> [czz
nmap <F8> ]czz
nmap <F2> do
nmap <F3> dp

" Quick spell check toggle
nmap <Leader>s :set spell! <CR>

" Quick list toggle
nmap <Leader>l :set list! <CR>

" C-N turns off highlighting
map <silent> <C-N> :noh<CR>

" Ctrl-up/down navigates the Quickfix list
map <C-Up> :cp\|normal zz<CR>
map <C-Down> :cn\|normal zz<CR>

" Toggle between cpp source and header files
map <silent> <Leader>h :call SourceHeaderToggle()<CR>

" Open browser to URL under cursor
map <silent> <Leader>w :call OpenUrlUnderCursor()<CR>

" Open 010Editor to file under cursor
map <silent> <Leader>F :call AnalyzeFileUnderCursor()<CR>

" Visual mode: search highlighted text
vmap * y/<C-R>"<CR>

" Do a * search w/o moving the cursor
nmap <silent> <Leader>* :set hlsearch \| let @/="\\<" . expand("<cword>") . "\\>"<CR>

" }}}

"==============================================================================
" CUSTOM COMMANDS
"==============================================================================
" {{{

" Work with binary file
command! -nargs=0 Hex :set ft=xxd | %!xxd

" Online documentation shortcuts 
map <silent> <Leader>d :call OnlineDocSearch(expand("<cword>"))<CR>
command! -nargs=* Doc :call OnlineDocSearch(<f-args>)

" Refresh tags
command! -nargs=0 RefreshTags :call RefreshTags()

" watch-like functionality
command! -nargs=? Tail :call UnixWatchTail(<f-args>)

" Run an external command and capture its output in a scratch buffer
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>, "<bang>")


" Run Python script
autocmd Filetype python map <F5> :w \| Shell python % <CR>

" Make :W behave like :w
command! W :w

set cscopequickfix=s-,c-,d-,i-,t-,e-
" set path+=/cygdrive/c/Program\ Files/Microsoft\ SDKs/Windows/v6.0A/Include
" set path+=/cygdrive/c/Program\ Files\ (x86)/Microsoft\ Visual\ Studio\ 9.0/VC/include

command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')

" }}}

"==============================================================================
" PLATFORM-SPECIFIC OPTIONS
"==============================================================================
" {{{

if has('win32') || has('win64')
    " Windows
    set grepprg=findstr\ /N\ /R\ $*\ *
    let g:browser = "C:\\Program Files (x86)\\Mozilla Firefox\\firefox.exe"
    set backupdir=C:\Windows\Temp
    set directory=C:\Windows\Temp
endif

if has('unix')
    " Unix-y (Cygwin, Linux, OS X terminal)
    set backupdir=/tmp
    set directory=/tmp
    let g:browser = "firefox.exe -new-tab" " Requires symlink on path
endif

if has('win32unix') 
    " Cygwin
endif

" }}}

"==============================================================================
" CUSTOM FUNCTIONS
"==============================================================================
" {{{

function! OnlineDocSearch(keyword, ...) " {{{

    let language = exists("a:1") ? tolower(a:1) : &ft

    " Google feeling lucky is a good default: http://www.google.com/search?q=SEARCH&btnI=Im+Feeling+Lucky
    let templates = {
                    \ 'cpp'  : 'http://www.google.com/search?q=msdn+%&btnI=Im+Feeling+Lucky',
                    \ 'c'  : 'http://www.google.com/search?q=msdn+%&btnI=Im+Feeling+Lucky',
                    \ 'perl' : 'http://perldoc.perl.org/functions/%.html ',   
                    \ 'php'  : 'http://www.php.net/%',
                    \ 'ruby' : 'http://www.ruby-doc.org/core/classes/%.html',
                    \ 'stl'  : 'http://www.sgi.com/tech/stl/%.html'
                    \}

    let urlTemplate = get(templates, language)
    if urlTemplate == "0"
        echo "Not configured for filetype \"" . language . "\""
        echo "Supported filetypes: " . string(keys(templates))
        return
    endif

    let url = substitute(urlTemplate, "%", a:keyword, "g")
    let cmd = "silent ! " . g:browser . " \"" . url . "\" &"
    execute cmd
endfunction " }}}

function! SourceHeaderToggle() " {{{
    let sourceExtns     = ['cpp', 'c', 'cc', 'c++']
    let headerExtns     = ['h', 'hpp']

    let ext         = expand("%:e")
    let fileRoot    = expand("%:r")
    let fileName    = expand("%:t:r")

    " Check to see if the current file is a source or header file
    if index(headerExtns, ext) != -1
        let extensions = sourceExtns
    elseif index(sourceExtns, ext) != -1
        let extensions = headerExtns
    else
        " Not a recognized file extension
        echo "File extension \"" . ext "\" is not recognized."
        echo "Recognized header extensions: " . string(headerExtns)
        echo "Recognized source extensions: " . string(sourceExtns)
        return
    end

    " Check to see if there's a match in the current buffer list
    for extension in extensions
        let newFileName = fileName . "\." . extension
        let newFileNamePattern = "[\\/]" . newFileName . "$"
        let buf = bufname(newFileNamePattern)
        if strlen(buf) > 0
            exec("b " . newFileNamePattern)
            return
        end
    endfor

    " Check the directory of the current file for a match
    for extension in extensions
        let newFileName = fileRoot . "\." . extension
        if filereadable(newFileName)
            exec("e " . newFileName)
            return
        end
    endfor

    " Try adding/removing _p to the root to pick up Qt source headers like foo_p.h
    " This could use some refactoring
    let privateHeaderPrefix = "_p"
    for extension in extensions
        let newFileName = fileRoot . privateHeaderPrefix . "\." . extension
        if filereadable(newFileName)
            exec("e " . newFileName)
            return
        end
    endfor

    if fileRoot =~ privateHeaderPrefix
        let modifiedFileRoot = substitute(fileRoot, privateHeaderPrefix, "", "g")
        for extension in extensions
            let newFileName = modifiedFileRoot . "\." . extension
            if filereadable(newFileName)
                exec("e " . newFileName)
                return
            end
        endfor
    endif

    echo "No matching header/source file found."
endfunction " }}}

function! AnalyzeFileUnderCursor() " {{{
    let file = expand("<cWORD>")

    " sanity check
    if (file !~ '[A-Za-z]:\\')
        echo "\"" . file . "\" does not appear to be a valid file name"
        return
    endif

    let analyzer = '/c/Program Files (x86)/010 Editor v3/010Editor.exe'
    let cmd = "silent ! \"" . analyzer . "\" \"" . file . "\" &"
    echo cmd
    execute cmd
endfunction " }}}

function! OpenUrlUnderCursor() " {{{
    let url = expand("<cWORD>")

    " strip off ending period, if exists
    echo strpart(url, strlen(url)-1)
    if (strpart(url, strlen(url)-1) == ".")
        let url = strpart(url, 0, strlen(url)-1)
    endif

    " sanity check
    if !(url =~ "http" || url =~ "www" || url =~ "ftp")
        echo "\"" . url . "\" does not appear to be a valid URL"
        return
    endif
    let cmd = "silent ! " . g:browser . " " . url . "&"
    echo cmd
    execute cmd
endfunction " }}}

function! ShowCurrentCFunction() " {{{
    " This function attempts to print out the name/signature of the current C/C++
    " function that the cursor is in.  It assumes that the function's opening
    " bracket appears as the first character its line.
    let line = line('.')
    while line != 0
        let lineText = getline(line)

        " If current line begins with {
        if lineText =~ "^{"
            " functionLine is initialized with the first line
            " containing parts of the function
            let functionLine = line - 1
            let functionName = []

            " Walk backwards, capturing each line until a blank, comment, or
            " closing bracket
            while functionLine != 0
              let functionLineStr = getline(functionLine)
              if functionLineStr =~ "^\s*$"
                 \ || functionLineStr =~ "^\s*//"
                 \ || functionLineStr =~ "*/"
                 \ || functionLineStr =~ "^}"
                 break   
              endif

              let functionName += [functionLineStr]
              let functionLine -= 1
            endwhile

            let functionName = reverse(functionName)

            " Print out function name
            " echo "================================================================================"
            " echo "CURRENT FUNCTION:\n"
            for line in functionName
                echo line
            endfor

            return
        endif

        let line -= 1
    endwhile

    " Fall through - couldn't find a line starting with {
    echo "Unable to determine current function"
endfunction " }}}

function! ShowCurrentCFunctionVariation() " {{{
    " This function attempts to print out the name/signature of the current C/C++
    " function that the cursor is in.  This version assumes function definitions
    " of the form:
    " void myfunc() {
    " }
    let line = line('.')
    while line != 0
        let lineText = getline(line)

        " If current line ends with { and has text in the first column
        if lineText =~ "^[a-zA-z0-9_].*{\s*$"
            " functionLine is initialized with the first line
            " containing parts of the function
            let functionLine = line
            let functionName = []

            " Walk backwards, capturing each line until a blank, comment, or
            " closing bracket
            while functionLine != 0
              let functionLineStr = getline(functionLine)
              if functionLineStr =~ "^\s*$"
                 \ || functionLineStr =~ "^\s*//"
                 \ || functionLineStr =~ "*/"
                 \ || functionLineStr =~ "^}"
                 break   
              endif

              let functionName += [functionLineStr]
              let functionLine -= 1
            endwhile

            let functionName = reverse(functionName)

            " Print out function name
            " echo "================================================================================"
            " echo "CURRENT FUNCTION:\n"
            for line in functionName
                echo line
            endfor

            return
        endif

        let line -= 1
    endwhile

    " Fall through - couldn't find a line matching the function
    echo "Unable to determine current function"
endfunction " }}}
    
function! RefreshTags() " {{{
    " This function starts at the pwd and walks up the directory heirarchy,
    " stopping when it finds a 'tags' file.  It then cds to this directory, runs
    " !ctags -R, and cds back.  The previous cwd is captured so as not to upset 
    " the workings of 'cd -'
    let tagFile = findfile("tags", ".;")
    if strlen(tagFile) <=  0
        echo "Error: Unable to find tags file in pwd ancestry"
    else
        " capture old pwd (so as not to change 'cd -')
        let oldPrevCwd = ""
        try
            exec "cd -"
            let oldPrevCwd = getcwd()
            exec "cd -"
        catch
        endtry

        let idx = strridx(tagFile, "/")
        
        if idx >= 0
            let tagDir = tagFile[0:idx]
        else
            let tagDir = "./"
            let tagFile = "./" . tagFile
        endif

        exec "cd " . tagDir

        exec "silent !ctags -R"
        exec "cd -"

        if strlen(oldPrevCwd) > 0
            exec "cd " . oldPrevCwd
            exec "cd -"
        endif

        echo "Refreshed tags file " . tagFile
    endif
endfunction " }}}

function! AddDoxygenFunctionComment() " {{{
"==============================================================================
" This function expects the current line to be the start of a function 
" signature, and adds Doxygen style comments
python << EOF

import sys
import vim
import string
import re

def addDoxygenComment():
    cursorLine = vim.current.window.cursor[0]
    currentLineText = vim.current.buffer[cursorLine-1]

    functionRegExp = re.compile("(?P<leadingSpace>\s*)"         # leading space
                                "(?:virtual\s*)?"               # optional virtual 
                                "(?P<returnType>(?:const)?\s*[\w=&]+\s*[*&]?)?"  # return type
                                "\s+"                           # > 0 spaces
                                "(?P<name>[\w=+&|~]+)"           # function name (don't forget about operatorXX)
                                "\("                            # open paren
                                   "(?:"                        # start of uncaptured group
                                   "\s*(?:const)?\s*[a-zA-Z_:<>]+\s*[*&]?" # arg type
                                   "\s+(?P<argName>\w+)\s*"                 # arg name
                                   "(?: = \S+)?"                 # default arg specification
                                   "\s*,?)*?"                        # optional "," and end of group
                                "\).*")                          # close paren
                                
    # TODO this won't work - have to iterate through the string to capture all function matches

    beginningRegExp = re.compile("(?P<leadingSpace>\s*)"         # leading space
                                "(?:virtual\s*)?"               # optional virtual 
                                "(?:static\s*)?"               # optional static
                                "(?P<returnType>(?:const)?\s*[\w=<>&]+\s*[*&]?)?"  # return type
                                "\s+"                           # > 0 spaces
                                "(?P<name>[\w=+&|~]+)"           # function name (don't forget about operatorXX)
                                "\(")                            # open paren
    matchObj = beginningRegExp.match(currentLineText)
    if matchObj is None:
        print "This line does not appear to be the beginning of a function declaration"
        return

    leadingSpace = matchObj.group('leadingSpace')
    returnType = matchObj.group('returnType')
    print "leadingSpace: \"%s\"" % leadingSpace
    print returnType

    argRegExp = re.compile("(?:"                        # start of uncaptured group
                           "\s*(?:const\s?)?[a-zA-Z_:<>]+\s*[*&]?" # arg type
                           "\s*(?P<argName>\w+)\s*"                 # arg name
                           "(?: = \S+)?"                 # default arg specification
                           "\s*,?)")                       # optional "," and end of group

    # iterate through remainder of string
    while matchObj is not None:
        matchObj = argRegExp.match(currentLineText, matchObj.end()+1)
        if matchObj is not None:
            print "argName: " + matchObj.group('argName')
    
    result = \
    """    /// @brief TODO
           /// @pre TODO
           /// @post TODO
           /// @return TODO
    """

addDoxygenComment()
    
EOF
endfunction " }}}

function! UnixWatchTail(...) " {{{
    " Emulates 'watch tail' of current file by re-opening file and moving to end
    if exists("a:1")
        let seconds = a:1
    else
        let seconds = 2
    endif

    try
    while 1
        let time = strftime("%c")
        silent e | normal G
            echo printf("Every %ds: :e | normal G\t\t%0s", seconds, time)
        redraw
        execute "sleep " . seconds
    endwhile
    catch
        echo "Error: Unable to re-open (:e) file"
    endtry
endfunction " }}}

function! s:ExecuteInShell(command, bang) " {{{
    " Runs a command in captures the output in a scratch buffer
    " From: https://svn.mageekbox.net/repositories/vim/trunk/.vimrc
    " Linked from VimTip: http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
    let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))
    if (_ != '')
        let s:_ = _
        let bufnr = bufnr('%')
        let winnr = bufwinnr('^' . _ . '$')
        silent! execute  winnr < 0 ? 'new ' . fnameescape(_) : winnr . 'wincmd w'
        " setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
        setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile
        silent! :%d
        let message = 'Execute ' . _ . '...'
        call append(0, message)
        echo message
        " silent! 2d | resize 1 | redraw
        silent! 2d | redraw
        silent! execute 'silent! %!'. _
        " silent! execute 'resize ' . line('$')
        silent! execute 'syntax on'
        silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
        " silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
        silent! execute 'nnoremap <silent> <buffer> <CR> :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
        " nnoremap <silent> <buffer> <C-W>_ :execute 'resize ' . line('$')<CR>
        silent! syntax on
    endif
endfunction " }}}

" }}}
"
"==============================================================================
" LOCAL VIMRC
"==============================================================================
" Use local vimrc if available {
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" vim: foldmethod=marker
