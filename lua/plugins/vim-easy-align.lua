return {
  "junegunn/vim-easy-align",
  event = "BufReadPost",
  keys = {
    { "ga", mode = { "n", "x" }, "<Plug>(EasyAlign)" },
  },
}
