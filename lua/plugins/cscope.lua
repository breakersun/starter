return {
  -- please install global manually: scoop install global
  "dhananjaylatkar/cscope_maps.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    disable_maps = false, -- "true" disables default keymaps
    skip_input_prompt = false, -- "true" doesn't ask for input
    prefix = "<leader>C", -- prefix to trigger maps
    cscope = {
      db_file = "./cscope.out", -- DB or table of DBs
      exec = "gtags-cscope", -- "cscope" or "gtags-cscope"
      picker = "snacks", -- "quickfix", "location", "telescope", "fzf-lua", "mini-pick" or "snacks"
      picker_opts = {
        window_size = 5, -- any positive integer
        window_pos = "bottom", -- "bottom", "right", "left" or "top"
      },
    },
  },
}
