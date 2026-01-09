return {
  "gbprod/substitute.nvim",
  event = "BufReadPost",
  config = function()
    require("substitute").setup({})
  end,
  keys = {
    { 's', mode = {'n'}, "<Cmd>lua require('substitute').operator()<Cr>", desc = 'Replace'},
    { 's', mode = {'x'}, "<Cmd>lua require('substitute').visual()<Cr>", desc = 'Replace'},
    { 'S', mode = {'n', 'x'}, "<Cmd>lua require('substitute').eol()<Cr>", desc = 'Replace EOL'},
    { 'ss', mode = {'n', 'x'}, "<Cmd>lua require('substitute').line()<Cr>", desc = 'Replace Line'},
  },
}
