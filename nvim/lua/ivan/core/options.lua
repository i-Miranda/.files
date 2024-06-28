local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs && indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignores case when searching
opt.smartcase = true -- if mixed case is used when searching, searching will be case-sensitive

-- cursor settings
opt.cursorline = true
opt.guicursor = {
  "n-c:block-blinkwait0-blinkoff20-blinkon60",
  "v:block-blinkon0",
  "i-ci:ver25-blinkwait0-blinkoff20-blinkon60",
  "r-cr:hor20",
}

-- appearance
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will always be dark
opt.signcolumn = "yes" -- show sign column so that sign text doesn't shift the line numbers

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- fold column options for nvim-ufo
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- persist undos in a file
vim.o.undofile = true

-- spellcheck
vim.opt.spelllang = "en_us,es"
vim.opt.spell = true

