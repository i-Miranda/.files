return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local frappe = require("catppuccin.palettes").get_palette("frappe")

    require("catppuccin").setup({
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "frappe",
        dark = "frappe",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "frappe",
        percentage = 2, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {},
      custom_highlights = {
        LineNr = { fg = frappe.mauve },
        TabLine = { fg = frappe.mauve, bg = "none" },
        TabLineSel = { bold = true, fg = frappe.green, bg = frappe.bg },
        TabLineSeparator = { bg = "none" },
        TabLineSeparatorSel = { fg = frappe.green, bg = "none" },
        GitsignsCurrentLineBlame = { italic = true, fg = frappe.sapphire },
        GitsignsAdd = { fg = frappe.green },
        GitsignsDelete = { fg = frappe.red },
        GitsignsChange = { fg = frappe.yellow },
      },
      default_integrations = true,
      integrations = {
        alpha = true,
        cmp = true,
        dap = true,
        dap_ui = true,
        fidget = true,
        flash = true,
        gitsigns = true,
        harpoon = true,
        mason = true,
        mini = {
          enabled = false,
          indentscope_color = "",
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        notify = false,
        nvimtree = false,
        telescope = {
          enabled = true,
        },
        treesitter = true,
        ufo = true,
        which_key = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })

    -- setup must be called before loading
    vim.cmd.colorscheme("catppuccin")
  end,
}
