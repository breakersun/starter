return {
  "saghen/blink.cmp",
  opts = {
    completion = { list = { selection = { preselect = false, auto_insert = true } } }, 
    keymap = {
      preset      = "enter",
      ["<Tab>"] = {
          function(cmp)
              return cmp.select_next()
          end,
          "snippet_forward",
          "fallback",
      },
      ["<S-Tab>"] = {
          function(cmp)
              return cmp.select_prev()
          end,
          "snippet_backward",
          "fallback",
      },
    },
  },
}
