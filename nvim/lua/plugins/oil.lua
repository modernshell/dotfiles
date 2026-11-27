-- https://github.com/modernshell/dotfiles/nvim
-- modern.shell@gmail.com
-- ~/.config/nvim/lua/plugins/oil.lua
-- neovim 0.12

vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
  default_file_explorer = true,
  view_options = { show_hidden = true },
})

vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Explorer (parent folder)" })
