return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "catppuccin/nvim",
  },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local C = require("catppuccin.palettes").get_palette()
    local O = require("catppuccin").options
    local catppuccin = {}
    local transparent_bg = O.transparent_background and "NONE" or C.mantle

    catppuccin.normal = {
      a = { bg = C.blue, fg = C.mantle, gui = "bold" },
      b = { bg = C.surface0, fg = C.blue },
      c = { bg = transparent_bg, fg = C.text },
    }
    catppuccin.insert = {
      a = { bg = C.green, fg = C.base, gui = "bold" },
      b = { bg = C.surface0, fg = C.green },
    }
    catppuccin.terminal = {
      a = { bg = C.green, fg = C.base, gui = "bold" },
      b = { bg = C.surface0, fg = C.green },
    }
    catppuccin.command = {
      a = { bg = C.peach, fg = C.base, gui = "bold" },
      b = { bg = C.surface0, fg = C.peach },
    }
    catppuccin.visual = {
      a = { bg = C.mauve, fg = C.base, gui = "bold" },
      b = { bg = C.surface0, fg = C.mauve },
    }
    catppuccin.replace = {
      a = { bg = C.red, fg = C.base, gui = "bold" },
      b = { bg = C.surface0, fg = C.red },
    }
    catppuccin.inactive = {
      a = { bg = transparent_bg, fg = C.blue },
      b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
      c = { bg = transparent_bg, fg = C.overlay0 },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = catppuccin,
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "filename", "branch" },
        lualine_c = {
          "%=", --[[ add your center components here in place of this comment ]]
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_y = { "fileformat","filetype", "progress"},
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
    })
  end,
}
