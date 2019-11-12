"--------------------------------Plugins---------------------------------------" {{{
" Specify a directory for plugins
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
"----------------Basics----------------- {{{
" Using this until the unlisted netrw buffer bug is solved.
Plug 'justinmk/vim-dirvish'

" Allows you to configure % to match more than just single characters.
Plug 'andymass/vim-matchup'
let g:loaded_matchit = 1

" Jump anywhere in current screen.
Plug 'easymotion/vim-easymotion'

" Visualize your Vim undo tree.
Plug 'simnalamburt/vim-mundo'

" Automatic closing of quotes, parenthesis, brackets
" also expands spaces and enters.
Plug 'tmsvg/pear-tree'

" Change or add pair of chars surrouding an object.
Plug 'tpope/vim-surround'

" Enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" Pairs of handy bracket mappings.
Plug 'tpope/vim-unimpaired'

" Readline style insertion.
Plug 'tpope/vim-rsi'

" Replace operator for Vim
Plug 'svermeulen/vim-subversive'

" Vim plugin that maintains a yank history to cycle between when pasting.
Plug 'svermeulen/vim-yoink'

" Plugin that adds a 'cut' operation separate from 'delete'.
Plug 'svermeulen/vim-cutlass'

" Toggle comments.
Plug 'tpope/vim-commentary'

" Set the 'path' option for miscellaneous file types.
Plug 'kkoomen/gfi.vim'
"}}}

"--------------Interface---------------- {{{
" Minimal colorscheme for vim.
Plug 'davidsierradz/vim-colors-plain'
Plug 'davidsierradz/vim-colors-off'

" Smart close of buffers.
Plug 'Asheq/close-buffers.vim'

" Search your selection text with * or #.
Plug 'haya14busa/vim-asterisk'

" Make the yanked region apparent.
Plug 'machakann/vim-highlightedyank'

" Lightline (statusbar) plugins.
Plug 'itchyny/lightline.vim'
Plug 'davidsierradz/lightline-gruvbox.vim'
Plug 'maximbaz/lightline-trailing-whitespace'
Plug 'maximbaz/lightline-ale'
"}}}

"-------------Integrations-------------- {{{
" FZF.
Plug 'junegunn/fzf.vim'

" Editorconfig.
Plug 'editorconfig/editorconfig-vim'

" Plug 'jreybert/vimagit'

Plug 'vifm/vifm.vim'

Plug 'tpope/vim-fugitive'

Plug 'rbong/vim-flog'

Plug 'lambdalisue/suda.vim'
"}}}

"-------Completions and omnifuncs------- {{{
" " Autocompletion framework.
" Plug 'ncm2/ncm2'
" " ncm2 requires nvim-yarp
" Plug 'roxma/nvim-yarp'
" " Some completions
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'fgrsnau/ncm2-otherbuf', { 'branch': 'ncm2' }

" Snippet Engine.
Plug 'SirVer/ultisnips'

" List of snippets for Ultisnips.
Plug 'honza/vim-snippets'

" Syntax checker and linter.
Plug 'w0rp/ale'

" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"}}}

"------Syntax files and Languages------- {{{
" Yet Another JavaScript Syntax for Vim.
Plug 'pangloss/vim-javascript'

" React JSX syntax highlighting and indenting for vim.
Plug 'maxmellon/vim-jsx-pretty'

Plug 'PotatoesMaster/i3-vim-syntax'

Plug 'kovetskiy/sxhkd-vim'
"}}}

" Initialize plugin system
call plug#end()
"--------------------------------End Plugins-----------------------------------"
"}}}


"--------------------------------General---------------------------------------"{{{
" Basics.
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8

" Settings for tabs and space indents.
set tabstop=2
set shiftwidth=2
let &softtabstop =&shiftwidth
set expandtab

" Leave hidden buffers open.
set hidden

" Command-Line options.
set wildignorecase
set wildmode=longest,list,full

" Ignore case for completion in insert mode.
set infercase

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Raise a dialog instead of failing a command.
set confirm

" Make ~ an operator.
set tildeop

" Only save folds with :mksession.
set viewoptions=folds

" Round indenting with < and > to shiftwidth.
set shiftround

" Select with the mouse.
set mouse=a

" Sync clipboard with +.
set clipboard+=unnamedplus

" Remove tags from completions.
set complete=.,w,b,u

" Set the title for current terminal instance.
set title

" Set <Space> as leader key.
let mapleader = " "

set foldlevel=3

set laststatus=2
"set statusline=
"" Relative file path
"set statusline=%f
"" Separator
"set statusline+=\ 
"" Filetype of the file
"set statusline+=%y
"" Separator
"set statusline+=\ 
"" Format of the file Unix or DOS
"set statusline+=[%{&ff}
"" Separator
"set statusline+=\ 
""file encoding
"set statusline+=%{strlen(&fenc)?&fenc:'none'}]
"" Separator
"set statusline+=\ 
"" Help, Modified and Read Only flags
"set statusline+=%h%m%r%w%q
"" Separation point between left and right items
"set statusline+=%=
"" Space Separator
"set statusline+=\ 
"" Foldlevel
"set statusline+=%{strlen(&foldlevel)?&foldlevel:''}
"" Space Separator
"set statusline+=\ 
"" Column number and Virtual Column number
"set statusline+=%P
"" Space Separator
"set statusline+=\ 
"" Current line count, max and percentage
"set statusline+=%([%l-%c%V]%)
"" ALE Errors
"set statusline+=%{LinterStatus()}

" Allow local .nvimrc files.
set exrc
set secure

" Enable persistent undo so that undo history persists across vim sessions.
set undofile

" Allow vim to automatically put VISUAL selection in the * buffer (?).
set guioptions=a

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'
"--------------------------------End General-----------------------------------"
"}}}


"--------------------------------Visuals---------------------------------------"{{{
" Show matched brace for a brief time.
set showmatch

" Scroll options.
set scrolloff=0
set sidescrolloff=0

" Enable true color support
set termguicolors

" Live substitution
set inccommand=nosplit

" Break words if the wrap option is set.
set linebreak

" Indent a wrapped line.
set breakindent

" Disable two spaces in join commands.
set nojoinspaces

" Special chars.
set listchars=tab:→\ ,eol:₋,extends:⟩,precedes:⟨,trail:·,space:·

" Dont show current mode in command line.
set noshowmode

" Disable text wrap.
set nowrap
"--------------------------------End Visuals-----------------------------------"
"}}}


"--------------------------------Search----------------------------------------"{{{
" Search options
set ignorecase
set smartcase

" Use global in substitution per default.
set gdefault
"--------------------------------End Search------------------------------------"
"}}}


"--------------------------------Splits----------------------------------------"{{{
" Splitting to the right by default.
set splitright
"--------------------------------End Splits------------------------------------"
"}}}


"--------------------------------General Mappings------------------------------"{{{
" Use j and k in wrap lines unless preceded by a count.
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Toggle paste mode with F2 in insert mode.
set pastetoggle=<F2>

" Use <Alt-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-l> :syntax sync fromstart <bar> nohlsearch <bar> diffupdate <bar> call lightline#enable() <bar> echo<CR>

" Reloads a buffer.
nnoremap <leader>r :e!<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab.
nnoremap <leader>bq :bp <BAR> bd #<CR>

" Close the current buffer and move to the previous one and close the window
" This replicates the idea of closing a tab.
nnoremap <leader>bw :call DeleteWindowIfNotLast()<CR>

" Remap go to last file with backspace.
nnoremap <BS> <C-^>

"Better window navigation.
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <C-A-j> gT
nnoremap <C-A-k> gt

tnoremap <M-h> <C-\><C-N><C-w>h
tnoremap <M-j> <C-\><C-N><C-w>j
tnoremap <M-k> <C-\><C-N><C-w>k
tnoremap <M-l> <C-\><C-N><C-w>l
tnoremap <M-`> <C-\><C-N>
tnoremap <C-A-j> <C-\><C-N>gT
tnoremap <C-A-k> <C-\><C-N>gt

inoremap <M-h> <C-\><C-N><C-w>h
inoremap <M-j> <C-\><C-N><C-w>j
inoremap <M-k> <C-\><C-N><C-w>k
inoremap <M-l> <C-\><C-N><C-w>l
inoremap <M-`> <C-\><C-N>
inoremap <C-A-j> <C-\><C-N>gT
inoremap <C-A-k> <C-\><C-N>gt

" Y yanks from current cursor position to end of line, more logical.
nnoremap Y y$

" Disable Ex mode.
nnoremap Q <nop>

" Change pwd to current file path.
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Change à (Alt-`) to -> in insert mode.
inoremap <M-1> ->

" Change <Alt-1> to => in insert mode.
inoremap <M-2> =>

" Use <AltGr-Q>(right shift) to save current file.
nnoremap ä :w<CR>
nnoremap <M-w> :w<CR>

" Transpose two chars in insert mode <Alt-s>.
inoremap <M-s> <ESC>Xpa

" Select text inside line.
nnoremap vv ^vg_

" Select from current cursor position to before EOL.
nnoremap <M-v> vg_

" Go to start or end of non-blank line chars.
noremap H ^
noremap L g_
vnoremap L g_

" Swap join lines behaviour.
nnoremap <silent> gJ mzJ`zldiw:delmarks z<cr>

" Toggle highlighting the search string.
nnoremap <silent> <F1> :set hlsearch!<cr>

" Execute a macro in visual mode.
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Copy the unnamed register to the z register.
nnoremap <silent> <leader>z :let @z=@"<CR>

" Re-select visual block after indenting.
vnoremap < <gv
vnoremap > >gv

" Copy the % register (current file path) to + register (clipboard).
nnoremap <leader>% :let @+=@%<CR>

" map _ to - see :help -.
nnoremap _ -

" Yank non-blank current line.
nnoremap <A-y> mz^yg_`z:delmarks z<cr>

" Cut non-blank current line.
nmap <A-x> mz^xg_`z:delmarks z<cr>

" Split a line.
nnoremap <silent> K i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w:delmarks w<cr>

" Keep the cursor in place while joining lines.
nnoremap <silent> J mzJ`z:delmarks z<cr>

" Expand spaces from (|) to ( | ).
" inoremap <M-Space> <Space><Space><Left>

" (|) -> (|.
inoremap <M-BS> <Right><BS>

" Echo syntax group of word under cursor.
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" See https://vi.stackexchange.com/questions/3738/toggle-bold-highlighting-for-comments-in-term-gui
" nnoremap yo1 :<C-R>=GetHighlight('Comment')['guifg'] is# '#CCCCCC' ? 'hi Comment guifg=#777777' : 'hi Comment guifg=#CCCCCC'<CR><CR>

" Toggles formatoptions to add comment after <CR> or o (and O).
nnoremap yo2 :<C-R>=&formatoptions !~# "cro" ? "setlocal formatoptions+=cro" : "setlocal formatoptions-=cro"<CR><CR>

" Choose one block in a 3-way merge resolution.
if &diff
  syntax off
  nnoremap <leader>1 :diffget LOCAL<CR>
  nnoremap <leader>2 :diffget BASE<CR>
  nnoremap <leader>3 :diffget REMOTE<CR>
endif

" Use U as redo.
nnoremap U <c-r>

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap <F12> mzgggqG`z:delmarks z<cr>
"--------------------------------End General Mappings--------------------------"
"}}}


"--------------------------------Plugins Configuration-------------------------"{{{
""/ ale.vim {{{
"/
" Don't use the sign column/gutter for ALE.
let g:ale_set_signs = 1
set signcolumn=no

" Lint always in Normal Mode.
let g:ale_lint_on_text_changed = 'normal'

" Set ALE's 200ms delay to zero.
let g:ale_lint_delay = 0

" Set gorgeous colors for marked lines to sane, readable combinations
" working with any colorscheme.
au VimEnter,BufEnter,ColorScheme *
      \ exec "hi! ALEInfoLine guifg=".(&background is# 'light'?'#808000':'#ffff00')." guibg=".(&background is# 'light'?'#ffff00':'#555500') |
      \ exec "hi! ALEWarningLine guifg=".(&background is# 'light'?'#808000':'#ffff00')." guibg=".(&background is# 'light'?'#ffff00':'#555500') |
      \ exec "hi! ALEErrorLine guifg=".(&background is# 'light'?'#ff0000':'#ff0000')." guibg=".(&background is# 'light'?'#ffcccc':'#550000') |
      \ exec "hi! link ALEInfo ALEInfoLine" |
      \ exec "hi! link ALEWarning ALEWarningLine" |
      \ exec "hi! link ALEError ALEErrorLine"

let g:ale_echo_msg_format = "%s - %linter%"

"let g:ale_set_quickfix = 1

let g:ale_linters = {
      \ 'markdown': ['markdownlint'],
      \ 'vimwiki': ['markdownlint'],
      \ 'javascript': ['eslint'],
      \ 'css': ['stylelint'],
      \}

let g:ale_linter_aliases = {'vimwiki': 'markdown'}

let g:ale_fixers = {
      \ 'css': ['prettier'],
      \ 'scss': ['prettier'],
      \ 'html': ['prettier'],
      \ 'yaml': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'json': ['prettier'],
      \ 'typescript': ['prettier'],
      \ 'markdown': ['prettier'],
      \ 'vimwiki': ['prettier']
      \ }

let g:ale_fix_on_save = 0

let g:ale_markdown_mdl_options = '--config ~/notes/.markdownlintrc'

"let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all --no-semi'

" Navigate ALE errors.
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

let g:ale_linters_explicit = 1
"}}}
""/ close-buffers.vim {{{
"/
" Call close-buffers.vim plugin to list an options menu.
nnoremap <silent> <leader>bd :Bwipeout menu<CR>
"}}}
""/ editorconfig/editorconfig-vim {{{
"/
" Don't output 'cursorcolumn'.
let g:EditorConfig_max_line_indicator = "none"
"}}}
""/ fzf.vim {{{
"/
let $FZF_DEFAULT_COMMAND = 'rg --smart-case --files-with-matches --color never --no-heading --no-ignore-vcs --hidden ""'

let $FZF_PREVIEW_COMMAND = 'cat {}'

function! s:goto_def(lines) abort
  silent! exe 'e +BTags '.a:lines[0]
  call timer_start(10, {-> execute('startinsert') })
endfunction

function! s:goto_line(lines) abort
  silent! exe 'e '.a:lines[0]
  call timer_start(10, {-> feedkeys(':') })
endfunction

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-g': function('s:goto_def'),
  \ 'ctrl-f': function('s:goto_line')
  \  }

" Show preview window with '?'.
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>,
    \ fzf#vim#with_preview('right:50%:hidden', '?'),
    \ <bang>0)

" Show preview window with '?'
command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \ '--color-path 400 --color-line-number 400 --color-match 400 --hidden --path-to-ignore ~/.ignore --skip-vcs-ignores',
    \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
    \ <bang>0)

" rg --smart-case --files-with-matches --color never --no-heading --no-ignore --hidden ""
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
    \   <bang>0)

command! -bang -nargs=* Rgg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --no-ignore '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

" FZF mappings.
nnoremap <A-t> :Rg<CR><C-\><C-n>0i
nnoremap <A-S-t> :Rgg<CR><C-\><C-n>0i
nnoremap <A-e> :History<CR><C-\><C-n>0i
nnoremap <A-c> :Snippets<CR><C-\><C-n>0i
nnoremap <A-b> :Buffers<CR><C-\><C-n>0i
nnoremap <Space><Space> :Buffers<CR><C-\><C-n>0i
nnoremap <C-p> :Files<CR><C-\><C-n>0i

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" Terminal buffer options for fzf

autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

if has('nvim') && exists('&winblend') && &termguicolors
  " set winblend=10

  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') is# -1
    let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'
  endif

  function! FloatingFZF()
    let opts = { 'relative': 'editor',
               \ 'row': 0,
               \ 'col': 0,
               \ 'width': &columns,
               \ 'height': &lines }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
else
  " FZF position.
  let g:fzf_layout = { 'window': '-tabnew' }
endif
"}}}
""/ gfi.vim {{{
"/
" Open files in splits.
function! GFI_split(type) abort
  let g:gfi_open_file_command = a:type
  call gfi#goto_file()
  let g:gfi_open_file_command = 'edit'
endf

nnoremap gvf :call GFI_split('vsplit')<CR>
nnoremap gsf :call GFI_split('split')<CR>
nnoremap gtf :call GFI_split('tabnew')<CR>
"}}}
""/ lightline.vim {{{
"/
let g:lightline = {
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['readonly', 'relativefilename', 'modified'],
      \   ],
      \   'right': [
      \     ['trailing'],
      \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
      \     ['virtuallineinfo', 'percentage'],
      \     ['foldlevel', 'fileformat', 'fileencoding', 'filetype']
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [
      \     ['readonly', 'relativefilename', 'modified'],
      \   ],
      \   'right': []
      \ },
      \ 'component': {
      \   'relativefilename': '%f',
      \   'percentage': '%p%%',
      \   'virtuallineinfo': '%l-%c%V',
      \ },
      \ 'component_function': {
      \   'foldlevel': 'FoldLevel'
      \ },
      \ 'component_expand': {
      \   'trailing': 'lightline#trailing_whitespace#component',
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \   'trailing': 'warning',
      \ },
      \ }
function! FoldLevel()
  return &foldlevel && strlen(&foldlevel) !=# '0' ? &foldlevel : ''
endfunction
let g:lightline#trailing_whitespace#indicator='•'
"}}}
""/ markdown-preview.nvim {{{
"/
" let g:mkdp_browser = '/usr/bin/qutebrowser'
"}}}
""/ ncm2 {{{
"/
" enable ncm2 for all buffer
"function! s:ncm2_start(...)
"  if v:vim_did_enter
"      call ncm2#enable_for_buffer()
"  endif
"  autocmd BufEnter * call ncm2#enable_for_buffer()
"endfunc

"call timer_start(500, function('s:ncm2_start'))

"" note that must keep noinsert in completeopt, the others is optional
""set completeopt=noinsert,menuone,noselect

""set completeopt=menuone

"au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
"au User Ncm2PopupClose set completeopt=menuone

"" supress the annoying 'match x of y', 'The only match' and 'Pattern not
"" found' messages
"set shortmess+=c

"" use a sorter that's more friendly for fuzzy match
"let g:ncm2#sorter = 'abbrfuzzy'
"let g:ncm2#matcher = 'substrfuzzy'

"" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
"inoremap <c-c> <ESC>

"" Conflicts with delimitMate_expand_cr.
"" When the <Enter> key is pressed while the popup menu is visible, it only
"" hides the menu. Use this mapping to close the menu and also start a new
"" line.
"imap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<Plug>(PearTreeExpand)")

"" Use <TAB> to select the popup menu:
"inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

"" Open the popup menu completion.
"imap <C-Space> <c-r>=ncm2#force_trigger()<cr>

"" Only complete files with . or /
"call ncm2#override_source('bufpath', {'complete_length': -1})
"call ncm2#override_source('rootpath', {'complete_length': -1})

"" Disable current working directory completion.
"call ncm2#override_source('cwdpath', {'complete_length': -1, 'enable': 0})
"}}}
""/ pear-tree {{{
"/
let g:pear_tree_pairs = {
      \ '(': {'closer': ')'},
      \ '[': {'closer': ']'},
      \ '{': {'closer': '}'},
      \ "'": {'closer': "'"},
      \ '"': {'closer': '"'},
      \ '`': {'closer': '`'},
      \ '"""': {'closer': '"""'},
      \ "'''": {'closer': "'''"},
      \ '<!--': {'closer': '-->'},
      \ }

let g:pear_tree_repeatable_expand = 0
let g:pear_tree_map_special_keys = 0
let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_smart_backspace = 0

imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)
imap <Esc> <Plug>(PearTreeFinishExpansion)
imap <M-Space> <Plug>(PearTreeSpace)
imap <C-g><C-g> <Plug>(PearTreeJump)
"}}}
""/ Ultisnips.vim {{{
"/

set runtimepath+=~/.config/nvim/snips

let g:UltiSnipsExpandTrigger        = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger   = "<M-n>"
let g:UltiSnipsJumpBackwardTrigger  = "<M-p>"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsListSnippets = "<S-Tab>"

" Expand the snippet.
imap <M-u> <Plug>(ultisnips_expand)
vmap <silent> <C-x><C-s> <Plug>(ultisnips_expand)
"}}}
""/ vimling {{{
"/
"nm <leader>d :call ToggleDeadKeys()<CR>
"imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
"nm <leader>i :call ToggleIPA()<CR>
"imap <leader>i <esc>:call ToggleIPA()<CR>a
"nm <leader>q :call ToggleProse()<CR>
"}}}
""/ vim-asterisk {{{
"/
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

" Enable keepCursor feature.
let g:asterisk#keeppos = 1
"}}}
""/ vim-boxdraw {{{
" The cursor can go nuts.
" augroup setvirtualedit
"   autocmd!
"   autocmd BufLeave *.md setlocal virtualedit-=all
"   autocmd BufEnter *.md setlocal virtualedit+=all
" augroup end
"}}}
""/ vim-cutlass {{{
"/

nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D
"}}}
""/ vim-dirvish {{{
"/

" Put dirs first.
let g:dirvish_mode = ':sort | sort ,^.*[^/]$, r'

" Doesnt work with g:dirvish_mode dirs first.
let g:dirvish_relative_paths = 1

" Set <leader>cd to change directories in dirvish buffers.
augroup dirvish_events
  autocmd!
  autocmd FileType dirvish
        \ nnoremap <buffer> <leader>cd :cd %<CR>:pwd<CR>
  " Unmap <C-P> to use FZF :Files
  autocmd FileType dirvish
        \ silent! unmap <buffer> <C-p>
  autocmd FileType dirvish
        \ nnoremap <nowait><buffer><silent> <M-n> <C-\><C-n>k:call feedkeys("p")<CR>
  autocmd FileType dirvish
        \ setlocal cursorline
augroup END
"}}}
""/ vim-easymotion {{{
"/
" Disable default mappings.
let g:EasyMotion_do_mapping=0

" One char search.
nmap <C-Space> <Plug>(easymotion-s)
vmap <C-Space> <Plug>(easymotion-s)
omap <C-Space> <Plug>(easymotion-s)
nmap å <Plug>(easymotion-s)
vmap å <Plug>(easymotion-s)
omap å <Plug>(easymotion-s)

let g:EasyMotion_smartcase = 1

let g:EasyMotion_use_upper = 1

let g:EasyMotion_keys = 'ASDGHKLQWERTYUIOPZXCVBNMFJ;'

" Search last motion used and disable highlight.
let g:EasyMotion_move_highlight = 0
nmap <leader>; <Plug>(easymotion-next)
nmap <leader>, <Plug>(easymotion-prev)
"}}}
""/ vim-highlightedyank {{{
"/
highlight link HighlightedyankRegion ErrorMsg
"}}}
""/ vim-matchup {{{
"/

" let g:matchup_matchparen_enabled = 0

" To enable the delete surrounding (ds%) and change surrounding (cs%) maps.
let g:matchup_surround_enabled = 1

let g:matchup_matchparen_status_offscreen = 0

"let g:matchup_matchparen_deferred = 1
"let g:matchup_matchparen_hi_surround_always = 1

nmap <silent> <F7> <plug>(matchup-hi-surround)
"}}}
""/ vim-mundo {{{
"/
" Start plugin.
nnoremap <leader>u :MundoToggle<CR>

" Put preview window below current window.
let g:mundo_preview_bottom = 1

" Automatically close the Mundo windows when reverting.
let g:gundo_close_on_revert = 1

" let g:mundo_auto_preview = 0
"}}}
""/ vim-rsi {{{
"/
" Disable <M-*> mappings.
let g:rsi_no_meta = 1
"}}}
""/ vim-subversive {{{
"/

nmap s <plug>(SubversiveSubstitute)
xmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)
"}}}
""/ vim-unimpaired {{{
"/
" Go previous or next buffer with <Alt-{j,k}>.
" nmap <M-j> <Plug>unimpairedBPrevious
" nmap <M-k> <Plug>unimpairedBNext
"}}}
""/ vim-yoink {{{
"/

nmap <leader>n <plug>(YoinkPostPasteSwapBack)
nmap <leader>p <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

let g:yoinkMoveCursorToEndOfPaste=1
let g:yoinkSavePersistently=1
let g:yoinkIncludeDeleteOperations=1
"}}}
"--------------------------------End Plugins Configuration---------------------"
"}}}


"--------------------------------User Commands---------------------------------"{{{
" :W sudo saves the file.
command! W w !sudo tee % > /dev/null

" :TabMessage command
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
"--------------------------------End User Commands-----------------------------"
"}}}


"--------------------------------Auto Commands---------------------------------"{{{
augroup initvim
  au!
  " Return to last edit position when opening files (You want this!).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif

  " Update the auto read of a file after 4 seconds.
  autocmd CursorHold * silent! checktime

  " Set folding method
  autocmd FileType json setlocal foldmethod=syntax

  " Formatters.
  autocmd FileType javascript setlocal formatprg=prettier\ --parser\ babel
  autocmd FileType json setlocal formatprg=prettier\ --parser\ json
  autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
  autocmd FileType html setlocal formatprg=prettier\ --parser\ html
  autocmd FileType scss setlocal formatprg=prettier\ --parser\ scss
  autocmd FileType css setlocal formatprg=prettier\ --parser\ css
  autocmd FileType yaml setlocal formatprg=prettier\ --parser\ yaml

  autocmd FilterWritePost * if &diff | syntax off | else | syntax on | endif
  autocmd DiffUpdated * if &diff | syntax off | else | syntax on | endif

  autocmd filetype markdown setl iskeyword+=-
        \ | setl spell spl=es,en noru nu rnu cul wrap spf=~/.config/nvim/spell/es.utf-8.add
        \ | setl dictionary+=/usr/share/dict/words,/usr/share/dict/spanish complete+=kspell

  " autocmd TermEnter * setlocal scrolloff=0
  " autocmd TermLeave * setlocal scrolloff=1
augroup END
"--------------------------------End Auto Commands-----------------------------"
"}}}


"--------------------------------Functions-------------------------------------"{{{
" Function to pipe an Ex command to a buffer in a new tab.
" Usage :TabMessage command
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use 'new' instead of 'tabnew' below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction

" Function to execute a recorded macro over a selected text.
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! DeleteWindowIfNotLast()
  if (winnr('$') > 1 && len(getbufinfo({'buflisted':1})) > 1)
    execute ":bp\<BAR>bd#\<BAR>q"
    return 1
  endif

  echo "Only one window or buffer."
  return 0
endfunction

" Function: display errors from Ale in statusline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total is# 0 ? '' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

" Return some highlight group as a dictionary.
function! GetHighlight(group)
  let output = execute('hi ' . a:group)
  let list = split(output, '\s\+')
  let dict = {}
  for item in list
    if match(item, '=') > 0
      let splited = split(item, '=')
      let dict[splited[0]] = splited[1]
    endif
  endfor
  return dict
endfunction
"--------------------------------End Functions---------------------------------"
"}}}


"--------------------------------Colors----------------------------------------"{{{
" Custom Highlight groups.
function! MyHighlights() abort
  highlight MatchParen guibg=NONE gui=bold
  highlight ErrorMsg gui=reverse guifg=#dc322f guibg=#fdf6e3
  " highlight CursorLine guibg=NONE
  if exists('g:loaded_lightline')
    runtime plugin/lightline-gruvbox.vim
    call lightline#colorscheme()
  endif
  if &background is# 'light'
    nnoremap yo1 :<C-R>=GetHighlight("Comment")["guifg"] is# "#CCCCCC" ? "hi Comment guifg=#777777" : "hi Comment guifg=#CCCCCC"<CR><CR>
  else
    nnoremap yo1 :<C-R>=GetHighlight("Comment")["guifg"] is# "#777777" ? "hi Comment guifg=#333333" : "hi Comment guifg=#777777"<CR><CR>
  endif
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END

set background=light
colorscheme off
let g:lightline.colorscheme = 'gruvbox'
set nohlsearch
"--------------------------------End Colors------------------------------------"
"}}}
" vim: set fdm=marker fmr={{{,}}} fdl=0 :
