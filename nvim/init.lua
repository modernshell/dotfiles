
-- https://github.com/modernshell/dotfiles/nvim
-- ~/.config/nvim/init.lua
-- neovim 0.12

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")

local dir = vim.fn.stdpath("config") .. "/lua/plugins"
local mods = {}
for name, type in vim.fs.dir(dir) do
  if type == "file" and name:match("%.lua$") then
    table.insert(mods, (name:gsub("%.lua$", "")))
  end
end
table.sort(mods)

for _, mod in ipairs(mods) do
  local ok, err = pcall(require, "plugins." .. mod)
  if not ok then
    vim.notify("Plugin '" .. mod .. "' : " .. tostring(err), vim.log.levels.ERROR)
  end
end
