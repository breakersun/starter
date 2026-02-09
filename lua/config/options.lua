-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local is_windows = vim.fn.has("win32") == 1
local is_linux = vim.fn.has("unix") == 1

if is_windows then 
  if vim.fn.executable("pwsh") == 1 then
    vim.o.shell = "pwsh"
  else
    vim.o.shell = "powershell"
  end
end

 vim.o.shellcmdflag =
   "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
 vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'
 vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'
 vim.o.shellquote = ""
 vim.o.shellxquote = ""

vim.opt.relativenumber = false

vim.g.autoformat = false

-- for better diff-view
vim.opt.diffopt="internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"

vim.opt.clipboard = "unnamedplus"
local function is_wsl()
  local version_file = io.open("/proc/version", "rb")
  if version_file ~= nil and string.find(version_file:read("*a"), "microsoft") then
    version_file:close()
    return true
  end
  return false
end
-- WSL Clipboard support
if is_wsl() then
  -- This is NeoVim's recommended way to solve clipboard sharing if you use WSL
  -- See: https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
  vim.g.clipboard = {
    name = "wsl-clip",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

vim.opt.conceallevel = 0

vim.diagnostic.disable()
