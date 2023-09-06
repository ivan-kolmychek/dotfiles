"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " UI for dein, just a nice-to-have
  call dein#add('wsdjeg/dein-ui.vim')

  " Add or remove your plugins here:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  "call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Global-ish tools
  " -------------------------

  " trailing whitespace
  call dein#add('ntpeters/vim-better-whitespace')

  " fzf
  call dein#add('junegunn/fzf', { 'build': './install --bin' })
  call dein#add('junegunn/fzf.vim')

  " highlight hidden symbols
  call dein#add('vim-scripts/spacehi.vim')
  call dein#add('vim-scripts/cream-showinvisibles')

  " cool statusbar
  call dein#add('vim-airline/vim-airline')

  " git wrapper
  " it also configures vim to look for ctags in .git/tags
  call dein#add('tpope/vim-fugitive')

  " git marks on sidebar
  call dein#add('airblade/vim-gitgutter')

  " task runner
  call dein#add('skywind3000/asynctasks.vim')
  call dein#add('skywind3000/asyncrun.vim')

  " bookmarks
  call dein#add('MattesGroeger/vim-bookmarks')

  " terminal (floating/advanced/etc)
  call dein#add('akinsho/toggleterm.nvim')

  " highlight color codes
  call dein#add('chrisbra/colorizer')

  " Telescope and related stuff
  " -------------------------
  " NOTE: has optional dependencies:
  " - ripgrep
  " - fd
  " -------------------------

  call dein#add('nvim-lua/plenary.nvim')
  call dein#add('nvim-telescope/telescope.nvim')

  call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})

  " Conqueror of Completion + addons
  " -------------------------

  " autocompletion & language servers support
  call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})

  " Json
  "call dein#add('neoclide/coc-json', { 'build': 'yarn install --frozen-lockfile' })

  " Elixir
  "call dein#add('amiralies/coc-elixir', { 'build': 'yarn install --frozen-lockfile' })

  " Yaml
  "call dein#add('neoclide/coc-yaml', { 'build': 'yarn install --frozen-lockfile' })

  " Language specific plugins below
  " -------------------------

  " slim templating engine
  " call dein#add('slim-template/vim-slim')

  " elixir syntax highlight
  call dein#add('elixir-lang/vim-elixir')

  " typescript syntax highlight
  call dein#add('leafgarland/typescript-vim')
  call dein#add('ianks/vim-tsx')

  " javascript syntax highlight
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')

  " graphql
  call dein#add('jparise/vim-graphql')

  " elm syntax highlight and such
  call dein#add('elmcast/elm-vim')

  " gleam
  call dein#add('gleam-lang/gleam.vim')

  " rusty object notation
  call dein#add('ron-rs/ron.vim')

  " Required:
  " -------------------------
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" for statusbar to appear
" " https://github.com/bling/vim-airline/wiki/FAQ#vim-airline-doesnt-appear-until-i-create-a-new-split
set laststatus=2

" 256-colors
set t_Co=256

" force dark background
set background=dark

" line numbers
set number

" Ignore ruby deps in ctrlp
"set wildignore+=*/vendor/*

" set CtrlP mode to Mixed by-default
"let g:ctrlp_cmd = 'CtrlPMixed'
"let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_user_command = 'find %s -type f -maxdepth 8'
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:airline_section_b = ""
let g:airline_section_y = ""

" map CtrlP clear cache
"map <c-I> :CtrlPClearCache <CR>

let mapleader = ","
let maplocalleader = " "

" use Rubocop for syntastic
"let g:syntastic_ruby_checkers          = ['rubocop', 'mri']

" identation and tabs handling
" based on http://stackoverflow.com/a/1878984
set tabstop=2       " The width of a TAB is set to N.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of N.
set shiftwidth=2    " Indents will have a width of N
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set copyindent

" replace the paste-yank with just paste
vnoremap p "_dP

" Allow using mouse for navigation and selection
set mouse=a

" Add hotkey to drop search highlight
nnoremap <leader><space> :nohlsearch<cr>

" Integrate with system clipboard
set clipboard=unnamedplus

" correctly highlight comments in jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

" change how inlay hints
highlight CocInlayHint ctermbg=NONE ctermfg=gray

" Show 80 chars indicator
highlight ColorColumn ctermbg=black
set colorcolumn=80

" Required for operations modifying multiple buffers like rename.
" Suggested by CoC
set hidden

" auto-wrap the errors in the quickfix window
autocmd FileType qf setlocal wrap

" open quickfix window
nnoremap <leader>- :copen<CR>

" --- fzf config

" Map fzf open file to Ctrl-p
nnoremap <silent> <C-p> :call fzf#vim#files(".", 0)<CR>

" Map fzf open buffers to Ctrl-l
nnoremap <silent> <C-l> :call fzf#vim#buffers(0)<CR>

" Make sure fzf uses ag and respects gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" --- Asyncrun and Asynctask config

" make asyncrun open quickfix window
let g:asyncrun_open = 0

let g:asynctasks_extra_config = [
    \ '~/.config/nvim/tasks.ini',
    \ ]

function! s:toggleterm_runner(opts)
lua << EOF
  local opts = vim.fn.eval("a:opts");
  local Terminal = require("toggleterm.terminal").Terminal
  local term = Terminal:new({
    cmd = "echo " .. opts.cmd .. ";" .. opts.cmd,
    dir = opts.cwd,
    direction = "float",
    hidden = false,
    close_on_exit = false,
    on_open = function(t)
      vim.cmd("startinsert!");
    end
  });
  term:toggle();
EOF
endfunction

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.toggleterm_custom = function('s:toggleterm_runner')

let g:asynctasks_term_pos = "toggleterm_custom"

" --- end of asyncrun/asynctask config

" --- Cofig suggested by CoC (Last updated 2023-03-19):


" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" --- End of config suggested by CoC

" --- Rest

command! -nargs=0 CocFormat :call CocAction('format')

nmap <silent> <space>t :CocList tasks<CR>

" use Space-Q to get code actions
nmap <silent><space>q  <Plug>(coc-codeaction)

" Use K to show documentation in preview window
nnoremap <silent><space>h :CocCommand document.toggleInlayHint<CR>
