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
            yank_relative_cwd = function(_, item)
              local path = vim.fn.fnamemodify(item.file, ":.")
              vim.fn.setreg("+", path)
              vim.fn.setreg('"', path)
              vim.notify("Yanked: " .. path)
            end,
            yank_relative_home = function(_, item)
              local path = vim.fn.fnamemodify(item.file, ":~")
              vim.fn.setreg("+", path)
              vim.fn.setreg('"', path)
              vim.notify("Yanked: " .. path)
            end,
          },
          win = { list =
            {
              keys =
              {
                ["D"] = "diff",
                ["y"] = "yank_relative_cwd",
                ["Y"] = "yank_relative_home",
              },
            },
          },
        },
      },
    },
  },
}
