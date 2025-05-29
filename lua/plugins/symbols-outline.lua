return {
  "simrat39/symbols-outline.nvim",
  event = "BufReadPost",
  config = function()
    local status_ok, symbols_outline = pcall(require, "symbols-outline")
    if not status_ok then
      return
    end

    symbols_outline.setup()
  end,

  keys = {
    {
      "<leader>co",
      mode = { "n", "x" },
      "<cmd>SymbolsOutline<cr>",
      desc = "Outline Symbols",
    },
  },
}
