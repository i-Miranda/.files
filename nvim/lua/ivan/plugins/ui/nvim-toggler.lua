return {
  "nguyenvukhang/nvim-toggler",
  event = {"BufReadPre","BufNewFile"},
  config = function()
    -- init.lua
    require("nvim-toggler").setup({
      -- your own inverses
      inverses = {
          ["true"] = "false",
          ["if"] = "else",
          ["+"] = "-",
          ["*"] = "/",
          ["=="] = "!=",
          ["<"] = ">",
          ["&&"] = "||",
      },
      -- removes the default <leader>i keymap
      remove_default_keybinds = true,
      -- removes the default set of inverses
      remove_default_inverses = true,
    })
    vim.keymap.set({ "n", "v" }, "<leader>ci", require("nvim-toggler").toggle, { desc = "Invert word" })
    vim.keymap.set({ "n", "v" }, "<leader>cc", "~", { desc = "Toggle character case (~)" })
  end,
}
