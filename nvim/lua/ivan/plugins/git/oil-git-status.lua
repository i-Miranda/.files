return {
  "refractalize/oil-git-status.nvim",
  dependencies = {
    "stevearc/oil.nvim",
  },
  config = true,
  show_ignored = true, -- show files that match gitignore with !!
    hl_group = {
      index = {
      ["!"] = "Ignored",
      ["?"] = "Untracked",
      [""] = "Added",
      ["C"] = "Copied",
      [""] = "Deleted",
      [""] = "Modified",
      ["R"] = "Renamed",
      ["T"] = "TypeChanged",
      ["U"] = "Unmerged",
      [" "] = "Unmodified",
    },
  },
}
-- add = { text = "" },
-- change = { text = "" },
-- delete = { text = "" },
-- topdelete = { text = "‾" },
-- changedelete = { text = "~" },
-- untracked = { text = "┆" },
