-- https://github.com/modernshell/dotfiles/nvim
-- modern.shell@gmail.com
-- ~/.config/nvim/lua/plugins/neo-tree.lua
-- neovim 0.12

vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = 'v3.x',
  },
})

require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,

  window = {
    position = 'left',
    width = 32,
    mappings = {
      ['<space>'] = 'none',
      ['l'] = 'open', 
      ['h'] = 'close_node',
      ['P'] = { 'toggle_preview', config = { use_float = true } },
    },
  },

  filesystem = {
    filtered_items = {
      visible = 
  },
})

-- Raccourcis globaux (en dehors de la fenêtre neo-tree)
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Explorateur : Afficher/Masquer' })
vim.keymap.set('n', '<leader>o', '<Cmd>Neotree focus<CR>', { desc = 'Explorateur : Donner le focus' })
vim.keymap.set('n', '<leader>ge', '<Cmd>Neotree float git_status<CR>', { desc = 'Git : Fichiers modifiés (flottant)' })
vim.keymap.set('n', '<leader>be', '<Cmd>Neotree float buffers<CR>', { desc = 'Buffers : Liste ouverte (flottant)' })
pve10nvim25:~/.config/nvim/lua/plugins$ clear
pve10nvim25:~/.config/nvim/lua/plugins$ cat neo-tree.lua
vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = 'v3.x',
  },
})

require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,

  window = {
    position = 'left',
    width = 32,
    mappings = {
      ['<space>'] = 'none', 
      ['l'] = 'open',
      ['h'] = 'close_node',
      ['P'] = { 'toggle_preview', config = { use_float = true } },
    },
  },

  filesystem = {
    filtered_items = {
      visible = false, 
      hide_dotfiles = false, 
      hide_gitignored = true,
      hide_by_name = {
        'node_modules',
        '.git',
      },
    },
    follow_current_file = {
      enabled = true,
    },
    use_libuv_file_watcher = true,
  },
})

-- Raccourcis globaux (en dehors de la fenêtre neo-tree)
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Explorateur : Afficher/Masquer' })
vim.keymap.set('n', '<leader>o', '<Cmd>Neotree focus<CR>', { desc = 'Explorateur : Donner le focus' })
vim.keymap.set('n', '<leader>ge', '<Cmd>Neotree float git_status<CR>', { desc = 'Git : Fichiers modifiés (flottant)' })
vim.keymap.set('n', '<leader>be', '<Cmd>Neotree float buffers<CR>', { desc = 'Buffers : Liste ouverte (flottant)' })
