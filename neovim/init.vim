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
  call dein#add('Bling/vim-airline')

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

" --- Cofig suggested by CoC:

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" change signcolumn highlight
highlight SignColumn ctermbg=None

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" change highlight for floats
highlight NormalFloat ctermbg=Black ctermfg=White

" change highlights for warnings
highlight CocWarningSign ctermbg=Yellow ctermfg=Black
highlight CocWarningFloat ctermbg=Black ctermfg=Yellow
highlight CocWarningHighlight ctermfg=Yellow cterm=underline

" change highlights for errors
highlight CocErrorSign ctermbg=Red ctermfg=Black
highlight CocErrorFloat ctermbg=Black ctermfg=LightRed
highlight CocErrorHighlight ctermfg=Red cterm=underline

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <silent><space>q  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" --- End of config suggested by CoC

" --- Rest

command! -nargs=0 CocFormat :call CocAction('format')

nmap <silent> <space>t :CocList tasks<CR>
