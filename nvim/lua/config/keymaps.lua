-- https://github.com/modernshell/dotfiles/nvim
-- modern.shell@gmail.com
-- ~/.config/nvim/config/keymaps.lua
-- neovim 0.12

-- main sortcuts
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search" })
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
