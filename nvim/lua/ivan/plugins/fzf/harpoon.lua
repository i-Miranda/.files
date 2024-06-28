return {
  "theprimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>ha", function()
      require("harpoon.mark").add_file()
    end, { desc = "Mark file with harpoon" })

    keymap.set("n", "<leader>hh", function()
      require("harpoon.ui").toggle_quick_menu()
    end, { desc = "Open harpoon menu" })

    keymap.set("n", "<leader>h1", function()
      require("harpoon.ui").nav_file(1)
    end, { desc = "Open harpoon file 1" })
    keymap.set("n", "<leader>h2", function()
      require("harpoon.ui").nav_file(2)
    end, { desc = "Open harpoon file 2" })
    keymap.set("n", "<leader>h3", function()
      require("harpoon.ui").nav_file(3)
    end, { desc = "Open harpoon file 3" })
    keymap.set("n", "<leader>h4", function()
      require("harpoon.ui").nav_file(4)
    end, { desc = "Open harpoon file 4" })
  end,
}
