return {
  "kevinhwang91/nvim-ufo",
  event = {"BufReadPre","BufNewFile"},
  dependencies = "kevinhwang91/promise-async",
  opts = {
    filetype_exclude = {
      "help",
      "alpha",
      "dashboard",
      "nvim-tree",
      "lazy",
      "mason",
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("local_detach_ufo", { clear = true }),
      pattern = opts.filetype_exclude,
      callback = function()
        require("ufo").detach()
      end,
    })

    require("ufo").setup(opts)
  end,
}
