return {
  "saghen/blink.cmp",
  opts = {
    completion = { list = { selection = { preselect = false, auto_insert = true } } }, 
    keymap = {
      preset = "default",
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then return cmp.accept()
          else return cmp.select_and_accept() end
        end,
        'snippet_forward',
        'fallback'
      },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    },
  },
}
