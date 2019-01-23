
"USING VUNDLE
" set the runtime path to include Vundle and initialize
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Jedi-vim  python autocomplete
Plugin 'davidhalter/jedi-vim'

"shows structure
Plugin 'majutsushi/tagbar'

"for tab completion
Plugin 'ervandew/supertab'

"Search files
Plugin 'ctrlpvim/ctrlp.vim'

"shows past used results and shows methods of python, javascipt, html, css
Plugin 'Shougo/neocomplete.vim'

"vim side nerdtree"
"Plugin 'Shougo/vimfiler.vim'

Plugin 'scrooloose/nerdcommenter'


"syntax checker
Plugin 'vim-syntastic/syntastic'

"javascript
Plugin 'ternjs/tern_for_vim'


Plugin 'rentalcustard/exuberant-ctags'
"douplicates jedi
Plugin 'valloric/youcompleteme'

"to merge between tabs
Plugin 'vim-scripts/Tabmerge'

Plugin 'vim-scripts/AutoComplPop'

Plugin 'godlygeek/tabular'

"Plugin 'arrufat/vala.vim'

"to buggy right now 
"Plugin 'artur-shaik/vim-javacomplete2'

"not ready yet at the time
"Plugin 'Shougo/neopairs.vim'

"close pairs html
Plugin 'alvan/vim-closetag'
call vundle#end()            " required
filetype plugin indent on    " required
"END OF USING VUNDLE

filetype plugin indent on
syntax on

let mapleader=" "
set number
set showcmd
set cursorline
set wildmenu
filetype indent on
set incsearch
set hlsearch
set clipboard=unnamedplus
autocmd VimLeave * call system("xsel -ib", getreg('+'))
set nowrap
set pastetoggle=<F2>

set tabstop=2
set shiftwidth=2
"nnoremap <F5> :UndotreeToggle<cr>

"fixes pasting problem
"function! ToggleSideEffects()
    "if mapcheck("dd", "n") == ""
        noremap dd "_dd
        noremap D "_D
        noremap d "_d
        noremap X "_X
        noremap x "_x
        noremap u "_u
        noremap r "_r
        noremap c d
    "else
        "unmap dd
        "unmap D
        "unmap d
        "unmap X
        "unmap x
        "echo 'side effects on'
    "endif
"endfunction
"nnoremap ,, :call ToggleSideEffects()<CR>

" }}
"jedi-vim
"let g:jedi#auto_initialization = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = "1"
"let g:jedi#goto_command = "<leader>g"
"let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_definitions_command = "<leader>g" "where function is defined
let g:jedi#documentation_command = "<leader>d"
let g:jedi#usages_command = "<leader>a" "where else is the function used
"let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r" "helps rename variables and functions
let g:jedi#smart_auto_mappings = 0
"autocmd FileType python setlocal completeopt-=preview
"END OF JEDI


"SUPERTAB
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'
"END OF SUPERTAB

"CONTROL P USAGE
"scroll up or down using c-k, c-v
"create new file using c-y
"mark files using c-z and c-o to open then
"c-r for regex mode
"c-t in new tap, c-x or c-v for split mode

"NEOCOMPLETE OPTIONS
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"END OF NEOCOMPLETE


"NERDTREE
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "end if only nerdtree is open by itself
"shortcut to open nerdtree
""END OF NERDTREE

"COMMENTOR
"<leader>ci swap comment/text
"<leader>cy yank and comment

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_wq = 0
"USE :SyntasticInfo
"END OF Syntastic

"Undo tree
map <C-u> :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
"END OF UNDOTREE

"javacomplete
"set runtimepath^=~/path/to/vim-javacomplete2/
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
"nmap <F5> <Plug>(JavaComplete-Imports-Add)
"imap <F5> <Plug>(JavaComplete-Imports-Add)
"nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
"nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
"nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
"nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
"nmap <leader>jii <Plug>(JavaComplete-Imports-Add)
"imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
"imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
"imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
"imap <C-j>ii <Plug>(JavaComplete-Imports-Add)
"nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
"nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
"nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
"nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
"nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
"nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
"nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
"nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)
"imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
"imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
"imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

"vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
"vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
"vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
""end of javacompete

"vim closetags

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
"let g:closetag_close_shortcut = '>'
"END OF VIM CLOSETAGS


"tab merge + for tabs
map <C-h> :Tabmerge left<CR>
map <C-j> :Tabmerge top<CR>
map <C-k> :Tabmerge down<CR>
map <C-l> :Tabmerge right<CR>

"allows movement between tabs
" create new tabs  {{
nnoremap <leader>t :tabnew<Enter>
" Close all except current tab
nnoremap <leader>\ :tabonly<Enter>
nnoremap <F1> :buffers<CR>:buffer<Space>
" Navigating tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
"Previous and next window
nnoremap <leader>h gT
nnoremap <leader>j gT
nnoremap <leader>l gt
nnoremap <leader>k gt

"move between tab splits
map <leader>J <C-W>j
map <leader>K <C-W>k
map <leader>H <C-W>h
map <leader>L <C-W>l


"end of tab merge and tabs

"vim filer
"let g:vimfiler_as_default_explorer = 1
"call vimfiler#custom#profile('default', 'context', {
"            \ 'explorer' : 1,
            "\ 'winwidth' : 30,
            "\ 'winminwidth' : 30,
            "\ 'toggle' : 1,
            "\ 'columns' : 'type',
            "\ 'auto_expand': 1,
            "\ 'direction' : 'rightbelow',
            "\ 'parent': 0,
            "\ 'explorer_columns' : 'type',
            "\ 'status' : 1,
            "\ 'safe' : 0,
            "\ 'split' : 1,
            "\ 'hidden': 1,
            "\ 'no_quit' : 1,
            "\ 'force_hide' : 0,
            "\ })
""vim filer

nmap <F8> :Neoformat<CR>
nmap <leader>o :TagbarToggle<CR>
"nmap <leader>p :vimfiler<CR>
"
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")
