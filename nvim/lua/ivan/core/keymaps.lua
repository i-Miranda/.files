local api = vim.api
local g = vim.g

-- set leader key to space
g.mapleader = " "

-- General Keymaps -------------------

-- use jj to exit insert mode
api.nvim_set_keymap("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- clear search highlights
api.nvim_set_keymap("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
api.nvim_set_keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
api.nvim_set_keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
api.nvim_set_keymap("n", "<leader><Bslash>","<C-w>v", { desc = "Split window vertically" })
api.nvim_set_keymap("n", "<leader>l", "<C-w>|", { desc = "Max out the window width" })
api.nvim_set_keymap("n", "<leader>_", "<C-w>s", { desc = "Split window horizontally" })
api.nvim_set_keymap("n", "<leader>k", "<C-w>_", { desc = "Max out the window height" })
api.nvim_set_keymap("n", "<leader><space>", "<C-w>=", { desc = "Make splits equal size" })
api.nvim_set_keymap("n", "<leader>q", "<cmd>close<CR>", { desc = "Close current split" })

api.nvim_set_keymap("n", "<leader>bb", "<cmd>vnew<CR>", { desc = "Open new vertical split buffer" })
api.nvim_set_keymap("n", "<leader>bq", "<cmd>bun<CR>", { desc = "Close current buffer" })
api.nvim_set_keymap("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Go to next buffer" })
api.nvim_set_keymap("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Go to previous buffer" })
api.nvim_set_keymap("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete current buffer" })

api.nvim_set_keymap("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
api.nvim_set_keymap("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" })
api.nvim_set_keymap("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Go to next tab" })
api.nvim_set_keymap("n", "<leader>tp", "<cmd>tabprev<CR>", { desc = "Go to previous tab" })
