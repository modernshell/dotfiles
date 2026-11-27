-- https://github.com/modernshell/dotfiles/nvim
-- modern.shell@gmail.com
-- ~/.config/nvim/lua/plugins/lualine.lua
-- neovim 0.12

vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    component_separators = { left = "│", right = "│" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { statusline = { "dashboard", "alpha" } },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } }, -- 1 = relative path
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
