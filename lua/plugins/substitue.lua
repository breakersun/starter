return {
  "gbprod/substitute.nvim",
  event = "BufReadPost",
  config = function()
    require("substitute").setup({})
  end,
  keys = {
    { 's',  mode = {'n'}, function() require('substitute').operator() end, desc  = 'Replace'},
    { 's',  mode = {'x'}, function() require('substitute').visual() end,   desc  = 'Replace'},
    { 'S',  mode = {'n', 'x'}, function() require('substitute').eol() end, desc  = 'Replace EOL'},
    { 'ss', mode = {'n', 'x'}, function() require('substitute').line() end, desc = 'Replace Line'},
  },
}
