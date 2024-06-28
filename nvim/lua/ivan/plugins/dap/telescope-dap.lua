return {
  "nvim-telescope/telescope-dap.nvim",
  event = "LspAttach",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = true,
}
