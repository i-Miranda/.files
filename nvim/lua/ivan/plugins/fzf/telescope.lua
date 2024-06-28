return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local actions_state = require("telescope.actions.state")
    -- local MiniFiles = require("mini.files")
    local oil = require("oil")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
          n = {
            o = function(prompt_bufnr)
              local entry = actions_state.get_selected_entry()
              actions.close(prompt_bufnr)
            -- opens the file in MiniFiles
              -- MiniFiles.open(entry.path)
              -- opens the file in oil
              oil.open(entry.path)
            end,
          },
        },
      },
      extensions = {
        file_browser = {
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            i = {
              -- your custom insert mode mappings
            },
            n = {
              o = function(prompt_bufnr)
                local entry = actions_state.get_selected_entry()
                actions.close(prompt_bufnr)
              -- opens the file in MiniFiles
                -- MiniFiles.open(entry.path)
              -- opens the file in oil
              oil.open(entry.path)
              end,
            },
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")

    -- set keymaps
    local keymap = vim.keymap.set -- for conciseness

    keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files" })
    keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string" })
    keymap("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find word under cursor" })
    keymap(
      "n",
      "<leader>fo",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { desc = "Open TFB at buffer's directory" }
    )
    keymap("n", "<leader>fO", "<cmd>Telescope file_browser<CR>", { desc = "Open TFB at 'root' directory" })
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find open buffers" })
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help tags" })
    keymap("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Find buffer diagnostics" })
  end,
}
