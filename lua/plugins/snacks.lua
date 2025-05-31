return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      enabled = true,
    },
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          layout = {
            layout = {
              position = "right",
            },
          },
          actions = {
            diff = {
              action = function(picker)
                picker:close()
                local sel = picker:selected()
                if #sel > 0 and sel then
                  Snacks.notify.info(sel[1].file)
                  vim.cmd("tabnew " .. sel[1].file)
                  vim.cmd("vert diffs " .. sel[2].file)
                  Snacks.notify.info("Diffing " .. sel[1].file .. " against " .. sel[2].file)
                  return
                end
                Snacks.notify.info("Select two entries for the diff")
              end,
            },
          },
          win = { list = { keys = { ["D"] = "diff", }, }, },
        },
      },
    },
  },
}
