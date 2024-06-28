return {
  "arnamak/stay-centered.nvim",
  event = {"BufReadPre" , "BufNewFile"},
  config = function()
    require("stay-centered").setup()
  end
}
