local utils = require('utils')
local g = vim.g
local o = vim.o
local w = vim.wo
local b = vim.bo
local cmd = vim.cmd

-- Fundamental {{{
-- NOTE: I'm not sure about this, remove if not necessary
cmd('autocmd!') -- Remove ALL autocommands for the current group.
cmd('syntax on')
cmd('filetype plugin indent on')
-- cmd('scriptencoding utf-8') -- FIX:
w.number = true
w.relativenumber = true
w.signcolumn = 'yes:1'
o.fileencodings = 'utf-8,sjis,euc-jp,latin'
o.encoding = 'utf-8'
o.title = true
o.autoindent = true
o.backup = false
o.hlsearch = true
o.incsearch = true
o.smartcase = true
o.showcmd = true
o.cmdheight = 1
o.laststatus = 3
o.scrolloff = 3

-- incremental substitution (neovim)
if vim.fn.has("nvim") == 1 then
  o.inccommand = 'split'
end

-- Suppress appending <PasteStart> and <PasteEnd> when pasting
-- xterm-bracketed-paste
-- set t_BE= -- NOTE: I don't know how to set this
o.ruler = false
o.showmatch = false
o.lazyredraw = true
o.ignorecase = true -- NOTE: I'm not sure about this or smartcase
o.backspace = "start,eol,indent"
o.path = o.path .. "**" -- or w.path, IDK
o.wildignore = o.wildignore .. "*/node_modules/*"

-- Turn off paste mode when leaving insert
cmd('autocmd InsertLeave * set nopaste')

-- Add asterisks in block comments
b.formatoptions = b.formatoptions .. "r"
--}}}


-- File types {{{
-----------------------------------------------------------------------
cmd([[
au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.tsx setf typescriptreact
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
au BufNewFile,BufRead *.flow set filetype=javascript
au BufNewFile,BufRead *.fish set filetype=fish
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
]])
-- }}}

-- run prettier before save
-- cmd([[
-- autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html :silent !prettier -w %
-- ]])

-- Syntax theme "{{{
-----------------------------------------------------------------------
-- true color
if vim.fn.exists("&termguicolors") == 1 and vim.fn.exists("&winblend") then
  cmd('syntax enable')
  o.termguicolors = true
  o.wildoptions = 'pum'
  w.winblend = 0
  o.pumblend = 5
  o.background = 'dark'
  -- Use NeoSolarized
  -- vim.g.neosolarized_termtrans = 1
  -- require('colors')
  -- cmd('colorscheme NeoSolarized')
end
-- }}}

-- Settings {{{
-- ---------------------------------------------------------------------
o.omnifunc = 'syntaxcomplete#Complete'
o.errorbells = false
o.belloff = 'all'
o.confirm = true
-- o.guifont= 'firaCode'
o.guifont = 'FiraCode Nerd Font'
vim.go.t_Co = "256"
-- vim.go.t_ut = ""
o.clipboard = 'unnamedplus'
o.mouse = 'a'
o.autoread = true
b.swapfile = false
o.showmode = true
w.linebreak = true
o.autochdir = true -- NOTE: When this option is on, some plugins may not work.
o.hidden = true
w.colorcolumn = '80'
-- cmd('highlight ColorColumn ctermbg=DarkBlue')
o.wildmode = 'full'
o.wildmenu = true
g.wildmenu = true
-- o.statusline = '%F'
o.updatetime = 500
w.foldenable = true
o.foldlevelstart = 99 -- NOTE: -1, 0, 1, 99
-- w.foldnestmax = 10
w.foldmethod = 'indent' -- manual, indent, syntax, marker, expr, diff
w.conceallevel = 0
-- python3 path: chage if it's necessary, -- NOTE: I'm not sure about this
g.python3_host_prog = '/usr/bin/python3'
-- cmd('autocmd FileType javascript set filetype=javascriptreact')
cmd('autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact')
cmd([[
au FocusGained,BufEnter * :silent! !
hi CursorLine cterm=NONE ctermbg=232
autocmd InsertEnter * highlight  CursorLine ctermbg=17 ctermfg=None
autocmd InsertLeave * highlight  CursorLine ctermbg=232
]])

-- o.smarttab = true
-- b.smartindent = true
o.tabstop = 2
b.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
b.shiftwidth = 2
o.autoindent = true
b.autoindent = true
o.expandtab = true
b.expandtab = true
-- o.nrformats = "alpha,bin,hex"

-- vim.cmd[[colorscheme aurora]]
-- hide tildes (only vim), this doesn't work for nvim-tree
w.fillchars = 'eob: '
-- or put this after colorscheme (vim & nvim), works for nvim-tree
vim.cmd('hi NonText guifg=bg')
-- }}}

-- Highlights {{{
-----------------------------------------------------------------------
w.cursorline = true

cmd([[
if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif
]])

utils.create_augroup({
  { 'WinEnter', '*', 'set', 'cul' },
  { 'WinLeave', '*', 'set', 'nocul' }
}, 'BgHighlight')

-- change the split bar color to yellow
cmd('highlight VertSplit guifg=#32afff')
-- }}}

-- format files when using :wq and not using sync in lsp formatting
vim.cmd [[cabbrev wq execute "Format sync" <bar> wq]]

-- emoji shortcuts {{{
-- ---------------------------------------------------------------------
cmd([[
ab :check: ✅
ab :empty: 🔳
ab :cross: ❌
ab :pin: 📌
ab :right: ➡
ab :left: ⬅
ab :up: ⬆
ab :down: ⬇
ab :point_right: 👉
ab :point_left: 👈
ab :point_up: 👆
ab :point_down: 👇
ab :bulb: 💡
ab :bomb: 💣
ab :book: 📖
ab :link: 🔗
ab :wrench: 🔧
ab :telephone: 📞
ab :email: 📧
ab :computer: 💻
ab :rocket: 🚀
ab :palette: 🎨
ab :crown: 👑
ab :robot: 🤖
ab :poop: 💩
ab :ghost: 👻
ab :wine_glass: 🍷
ab :mobile_phone: 📱
ab :red_heart: ❤️
ab :skull: 💀
ab :alien: 👽
ab :degree: \u02DA
ab :filled: 🔲
ab :gift: 🎁
ab :warning: ⚠️
ab :no: 🚫
ab :biohazard: ☣️
ab :radioactive: ☢️
ab :key: 🔑
ab :shield: 🛡️
ab :beetle: 🐞
ab :kite: 🪁
ab :fire: 🔥
ab :diamond: 💎
ab :notebook: 📔
ab :locked: 🔒
ab :unlocked: 🔓
ab :8ball: 🎱
ab :100: 💯
ab :joker: 🃏
ab :bell: 🔔
ab :balloon: 🎈
ab :bullseye: 🎯
ab :medal: 🥇
ab :trophy: 🏆
ab :anchor: ⚓
ab :moai: 🗿
ab :pencil: ✏️
ab :pen: 🖊️
ab :note: 📝
ab :love_letter: 💌
ab :hourglass: ⏳
ab :watch: ⌚
ab :clock: ⏰
ab :stopwatch: ⏱️
ab :calendar: 📅
ab :clipboard: 📋
ab :money: 💰
ab :separator_lb: 
ab :separator_rb: 
ab :separator_lt: 
ab :separator_rt: 
ab :separator_lst: ◀
ab :separator_rst: ▶
ab :separator_ltt: ❮
ab :separator_rtt: ❯
ab :aries: ♈
ab :taurus: ♉
ab :gemini: ♊
ab :cancer: ♋
ab :leo: ♌
ab :virgo: ♍
ab :libra: ♎
ab :scorpio: ♏
ab :sagittarius: ♐
ab :capricorn: ♑
ab :aquarius: ♒
ab :pisces: ♓
]])
-- }}}
