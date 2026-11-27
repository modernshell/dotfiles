-- https://github.com/modernshell/dotfiles/nvim
-- ~/.config/nvim/config/options.lua
-- neovim 0.12

local o = vim.opt
o.number = true
o.relativenumber = false
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true
o.ignorecase = true
o.smartcase = true
o.termguicolors = false   -- true si le terminal gère le truecolor
o.signcolumn = "yes"
o.undofile = true
o.scrolloff = 8
o.splitright = true
o.splitbelow = true
o.updatetime = 250
o.completeopt = { "menu", "menuone", "noselect", "popup" }

vim.filetype.add({
  extension = { sh = "bash" },
  pattern = { [".*/etc/profile%.d/.*%.sh"] = "bash" },
})

vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" },
  severity_sort = true,
  float = { border = "single" },
})
