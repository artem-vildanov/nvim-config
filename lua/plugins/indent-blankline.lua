return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup({
      -- indent = { char = "│" },
      indent = { char = "·" }
    })
  end
}
