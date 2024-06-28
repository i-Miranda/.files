return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    local mason_nvim_dap = require("mason-nvim-dap")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- LSPs
    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",
        "cssls",
        "html",
        "jsonls",
        "lua_ls",
        "omnisharp",
        "pyright",
        "r_language_server",
        "tsserver",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    -- linters and formatters
    mason_tool_installer.setup({
      ensure_installed = {
        "black",
        "clang-format",
        "cpplint",
        "csharpier",
        "jq",
        "prettier",
        "selene",
        "semgrep",
        "sonarlint-language-server",
        "stylua",
        "xmlformatter",
      },
    })

    mason_nvim_dap.setup({
      ensure_installed = {
        "cpptools",
        "debugpy",
        "netcoredbg",
      },
      handlers = {}, -- sets up dap in the predefined matter
    })
  end,
}
