local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "ivan.plugins.fzf" },
  { import = "ivan.plugins.lsp" },
  { import = "ivan.plugins.dap" },
  { import = "ivan.plugins.git" },
  { import = "ivan.plugins.languageSpecific" },
  { import = "ivan.plugins.ui" },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
