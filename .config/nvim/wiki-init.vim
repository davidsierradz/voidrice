"--------------------------------Plugins---------------------------------------" {{{
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

"----------------Basics----------------- {{{
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

" Super-powered writing things.
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'

" Small vim scripts for writing IPA and other special characters.
"Plug 'LukeSmithxyz/vimling'
"}}}

"--------------Interface---------------- {{{
" Minimal colorscheme for vim.
Plug 'davidsierradz/vim-colors-pencil'

" Smart close of buffers.
Plug 'Asheq/close-buffers.vim'

" Search your selection text with * or #.
Plug 'haya14busa/vim-asterisk'

" Make the yanked region apparent.
Plug 'machakann/vim-highlightedyank'

" Draw boxes and arrows in ascii.
Plug 'gyim/vim-boxdraw', { 'for': 'markdown' }

" Distraction-free writing in Vim.
Plug 'junegunn/goyo.vim'

" Plug 'psliwka/vim-smoothie'
"}}}

"-------------Integrations-------------- {{{
" Personal Wiki for Vim.
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" markdown preview plugin for (neo)vim.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"}}}

"-------Completions and omnifuncs------- {{{
" Snippet Engine.
Plug 'SirVer/ultisnips'

" List of snippets for Ultisnips.
Plug 'honza/vim-snippets'

" Syntax checker and linter.
Plug 'w0rp/ale'
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

set foldlevel=2

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
nnoremap <silent> <C-l> :syntax sync fromstart <bar> nohlsearch <bar> diffupdate <bar> echo<CR>

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
nnoremap <M-h> zh
"nnoremap <M-j> <C-w>j
"nnoremap <M-k> <C-w>k
nnoremap <M-l> zl

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
" nnoremap yo1 :<C-R>=GetHighlight('Comment')['guifg'] is# '#CCCCCC' ? 'hi Comment guifg=#999999' : 'hi Comment guifg=#CCCCCC'<CR><CR>

" Toggles formatoptions to add comment after <CR> or o (and O).
nnoremap yo2 :<C-R>=&formatoptions !~# "cro" ? "setlocal formatoptions+=cro" : "setlocal formatoptions-=cro"<CR><CR>

" Toggles conceallevel 0 to 3.
nnoremap yo3 :<C-R>=&conceallevel is# 0 ? "set conceallevel=3" : "set conceallevel=0"<CR><CR>

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

let g:ale_fix_on_save = 1

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
nnoremap <silent> <leader>bd :CloseBuffersMenu<CR>
"}}}
""/ Goyo {{{
"/
" Open Goyo.
nnoremap <F5> :Goyo<CR>

" Mantains set number.
let g:goyo_linenr=1

" Width.
let g:goyo_width=80
let g:goyo_height='100%'

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) is# 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

function! s:goyo_start(...)
  if v:vim_did_enter
    Goyo
  endif
endfunc

call timer_start(10, function('s:goyo_start'))
"}}}
""/ markdown-preview.nvim {{{
"/
let g:mkdp_browser = '/usr/bin/qutebrowser'
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
      \ '```': {'closer': '```'},
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
" imap <CR> <Plug>(PearTreeExpand)
imap <Esc> <Plug>(PearTreeFinishExpansion)
imap <M-Space> <Plug>(PearTreeSpace)
imap <C-g><C-g> <Plug>(PearTreeJump)
"}}}
""/ Pencil {{{
"/
" Start pencil on vimwiki buffers.
augroup pencil
    autocmd!
    autocmd filetype vimwiki call pencil#init()
                \ | call lexical#init()
                \ | setl iskeyword+=-
                \ | setl spell spl=es,en noru nu rnu cul spf=~/.config/nvim/spell/es.utf-8.add
                \ | setl dictionary+=/usr/share/dict/words,/usr/share/dict/spanish complete+=kspell
augroup END

let g:pencil#wrapModeDefault = 'soft'
let g:pencil#textwidth = 74
let g:pencil#joinspaces = 0
let g:pencil#cursorwrap = 0
let g:pencil#conceallevel = 3
let g:pencil#concealcursor = 'nc'
let g:pencil#softDetectSample = 20
let g:pencil#softDetectThreshold = 130
"}}}
""/ Ultisnips.vim {{{
"/

set runtimepath+=~/.config/nvim/snips

let g:UltiSnipsExpandTrigger        = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger   = "<M-n>"
let g:UltiSnipsJumpBackwardTrigger  = "<M-p>"
let g:UltiSnipsRemoveSelectModeMappings = 0
" let g:UltiSnipsListSnippets = "<S-Tab>"

" Expand the snippet.
imap <M-u> <Plug>(ultisnips_expand)
vmap <silent> <C-x><C-s> <Plug>(ultisnips_expand)
"}}}
""/ vimwiki {{{
"/
let g:vimwiki_list = [
      \ {'path': '~/notes/',
      \ 'links_space_char': '-',
      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0

let g:vimwiki_folding = 'custom'

let g:vimwiki_auto_header = 1

nnoremap <F4> "=strftime("%Y-%m-%d_%H:%M:%S")<CR>P
inoremap <F4> <C-R>=strftime("%Y-%m-%d_%H:%M:%S")<CR>
iab <expr> dts strftime("%Y-%m-%d_%H:%M:%S")

autocmd FileType vimwiki setlocal fdm=marker fmr={{{,}}}

let g:vimwiki_listsyms = ' .oOx'
"}}}
""/ vim-boxdraw {{{
" The cursor can go nuts.
augroup setvirtualedit
  autocmd!
  autocmd BufLeave *.md setlocal virtualedit-=all
  autocmd BufEnter *.md setlocal virtualedit+=all
augroup end
"}}}
""/ vim-cutlass {{{
"/

nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D
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

  " Surround ** with € (Right Control).
  autocmd FileType vimwiki let b:surround_8364 = "**\r**"

  " Formatters.
  autocmd FileType vimwiki setlocal formatprg=prettier\ --parser\ markdown
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
  highlight MatchParen guibg=NONE
  highlight SpellBad gui=undercurl guifg=NONE
  highlight VimwikiLink guifg=#cb4b16
  highlight CursorLine ctermbg=NONE guibg=NONE
  highlight CursorLineNr ctermbg=NONE guibg=NONE
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
colorscheme pencil
"--------------------------------End Colors------------------------------------"
"}}}
" vim: set fdm=marker fmr={{{,}}} fdl=0 :
