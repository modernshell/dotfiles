vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<cr>", { desc = "Git diff" })
