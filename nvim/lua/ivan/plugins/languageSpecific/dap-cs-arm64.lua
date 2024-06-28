local jit = require("jit")
local M = {}
if jit.arch == "arm64" then
  M = {
    "M4urici0GM/dap-cs", -- this is a fork of "Cliffback/netcoredbg-macOS-arm64.nvim" with some added functionality
    dependencies = "mfussenegger/nvim-dap",
    event = "BufRead *.cs",
    config = function()
      local dap = require("dap")
      local dapcs = require("netcoredbg-macOS-arm64")

      dapcs.setup(dap)
    end,
    lazy = true,
  }
end
return M
