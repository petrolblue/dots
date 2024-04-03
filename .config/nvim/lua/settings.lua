local fn = vim.fn
local o = vim.o
local w = vim.wo
local b = vim.bo

function set(key, value)
  vim.opt[key] = value
end

set('showmode', false)
vim.g.t_Co = "256"

set('laststatus', 2)
set('modeline', true)
set('ruler', false)

set('so', 3)
set('siso', 3)

set('wrap', false)

set('tw', 80)
set('colorcolumn', "+1")

set('fo', "tjcrqln1")

set('lazyredraw', true)

set('nrformats', "alpha,bin,hex,octal")

set('hidden', true)
set('switchbuf', "useopen")

set('splitright', true)
set('splitbelow', true)

set('title', true)
set('titlestring', "%t - NVIM")

set('undodir', "/tmp/nvim-undodir")
set('undofile', true)

set('mouse', "a")

set('backspace', "indent,eol,start")

set('hlsearch', true)

set('updatetime', 500)

if fn.executable("rg") then
  set('grepprg', "rg --vimgrep $*")
  set('grepformat', "%f:%l:%c:%m")
end

set('rnu', false)
set('nu', false)

set('cursorline', true)

vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax enable'

set('background', "dark")
set('termguicolors', true)
set('number', true)
set('signcolumn', "number")

set('tabstop', 8)
set('shiftwidth', 2)
set('expandtab')
set('smarttab', true)

-- set('cino', "h1,l1,g1,t0,i4,+4,(0,w1,W4,E-s,N-s,m1")

set('completeopt', 'menu,preview,menuone,noinsert,longest')
vim.opt.shortmess:append('c')

-- don't show :intro message on startup
vim.opt.shortmess:append('I')

set('listchars', 'tab:-->,trail:+,nbsp:+,extends:>,precedes:<')
set('list', true)

set('spelllang', 'en_us')
set('spelloptions', 'camel')
set('spell', true)

set('pb', 10)
set('winbl', 10)

set('inccommand', 'nosplit')

vim.cmd 'au TermOpen * setlocal nonumber nornu so=0 | startinsert'
vim.cmd 'aunmenu PopUp.How-to\\ disable\\ mouse'
vim.cmd 'aunmenu PopUp.-1-'

vim.g.vim_json_warnings = 0
vim.g.c_gnu = 1

vim.g.go_highlight_array_whitespace_error = 0
vim.g.go_highlight_chan_whitespace_error = 0
vim.g.go_highlight_extra_types = 0
vim.g.go_highlight_space_tab_error = 0
vim.g.go_highlight_trailing_whitespace_error = 0

vim.g.rst_syntax_code_list = {
  ['vim'] = {'vim'},
  ['java'] = {'java'},
  ['cpp'] = {'cpp', 'c++', 'c'},
  ['html'] = {'html'},
  ['lisp'] = {'lisp'},
  ['php'] = {'php'},
  ['python'] = {'python'},
  ['perl'] = {'perl'},
  ['sh'] = {'sh'},
  ['dts'] = {'dts', 'devicetree'},
  ['bash'] = {'bash'},
  ['dosini'] = {'ini'},
}
