-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- smart dd: when dd a empty line, then don't touch registers
local smart_dd = function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end
vim.keymap.set("n", "dd", smart_dd, { noremap = true, expr = true })

vim.keymap.set('x', '/', '<C-\\><C-n>`</\\%V', { desc = 'Search forward within visual selection' })
vim.keymap.set('x', '?', '<C-\\><C-n>`>?\\%V', { desc = 'Search backward within visual selection' })
vim.keymap.set('n', '<Space>qq', '<Cmd>q<cr>', { desc = 'Simple Quit' })
vim.keymap.set('n', '<Space>qQ', '<Cmd>qa<cr>', { desc = 'Quit All' })
vim.keymap.set('n', '<Space>ch', '<Cmd>ClangdSwitchSourceHeader<cr>', { desc = 'Swap Header/Impl File'})

vim.keymap.set('n', 'gp', '`[v`]')

-- remove alt-j/k in case of glazewm or i3wm
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")
vim.keymap.set("n", "<leader>mj", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<leader>mk", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<leader>mj", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<leader>mk", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
