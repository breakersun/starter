return {
  "gbprod/substitute.nvim",
  event = "BufReadPost",
  config = function()
    require("substitute").setup({})
  end,
  keys = {
    { "<leader>r", mode = { "n", "x" }, "<cmd>lua require('substitute').operator()<cr>" },
  },
}
