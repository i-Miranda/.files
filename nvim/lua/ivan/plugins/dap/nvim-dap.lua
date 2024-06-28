return {
  "mfussenegger/nvim-dap",
  event = "LspAttach",
  config = function()
    local dap = require("dap")

    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggles Breakpoint in DAP" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue debugging" })
  end,
  lazy = true,
}
