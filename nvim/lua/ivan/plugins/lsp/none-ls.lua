return { "nvimtools/none-ls.nvim",
  dependencies = "jayp0521/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local mason_null_ls = require("mason-null-ls")
    local null_ls = require("null-ls")

    mason_null_ls.setup({
      ensure_installed = {
        "clangd",
        "cpplint",
        "cpptools",
        "css-lsp",
        "debugpy",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "netcoredbg",
        "omnisharp",
        "pyright",
        "r-languageserver",
        "selene",
        "semgrep",
        "sonarlint-language-server",
        "typescript-language-server",
      },
    })
    -- local code_actions = null_ls.builtins.code_actions
    local diagnostics = null_ls.builtins.diagnostics
    -- local formatting = null_ls.builtins.formatting
    -- local hover = null_ls.builtins.hover
    -- local completion = null_ls.builtins.completion
    local with_diagnostics_code = function(builtin)
      return builtin.with({ diagnostics_format = "#(m) [#{c}]" })
    end
    local with_root_file = function(builtin, file)
      return builtin.with({
        condition = function(utils)
          return utils.root_has_file(file)
        end,
      })
    end

    -- register any number of sources simultaneously
    local sources = {
      -- completion.luasnip,
      with_diagnostics_code(diagnostics.semgrep),
      with_root_file(diagnostics.selene, "selene.toml"),
    }

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      debug = true,
      sources = sources,

      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(client)
                  -- only use null-ls for formatting instead of lsp server
                  return client.name == "null-ls"
                end,
                async = false,
              })
            end,
          })
        end
      end,
    })
  end,
  lazy = true,
}
