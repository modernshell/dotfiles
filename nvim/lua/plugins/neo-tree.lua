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
  popup_border_style = 'rounded', -- Bordures arrondies pour les fenêtres flottantes (renommage, création...)
  enable_git_status = true,
  enable_diagnostics = true,

  window = {
    position = 'left',
    width = 32,
    mappings = {
      ['<space>'] = 'none', -- Libère la touche Espace si c'est votre <leader>
      ['l'] = 'open',        -- Ouvre un fichier ou déplie un dossier avec 'l' (navigation style Vim)
      ['h'] = 'close_node',  -- Replie un dossier avec 'h'
      ['P'] = { 'toggle_preview', config = { use_float = true } }, -- Aperçu rapide d'un fichier sans l'ouvrir
    },
  },

  filesystem = {
    filtered_items = {
      visible = false,       -- Masque par défaut les fichiers cachés
      hide_dotfiles = false, -- Affiche les fichiers commençant par un point (.env, .gitignore...)
      hide_gitignored = true,
      hide_by_name = {
        'node_modules',
        '.git',
      },
    },
    follow_current_file = {
      enabled = true,
    },
    use_libuv_file_watcher = true, -- Rafraîchit automatiquement l'arborescence si un fichier change sur le disque
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
  popup_border_style = 'rounded', -- Bordures arrondies pour les fenêtres flottantes (renommage, création...)
  enable_git_status = true,
  enable_diagnostics = true,

  window = {
    position = 'left',
    width = 32,
    mappings = {
      ['<space>'] = 'none', -- Libère la touche Espace si c'est votre <leader>
      ['l'] = 'open',        -- Ouvre un fichier ou déplie un dossier avec 'l' (navigation style Vim)
      ['h'] = 'close_node',  -- Replie un dossier avec 'h'
      ['P'] = { 'toggle_preview', config = { use_float = true } }, -- Aperçu rapide d'un fichier sans l'ouvrir
    },
  },

  filesystem = {
    filtered_items = {
      visible = false,       -- Masque par défaut les fichiers cachés
      hide_dotfiles = false, -- Affiche les fichiers commençant par un point (.env, .gitignore...)
      hide_gitignored = true,
      hide_by_name = {
        'node_modules',
        '.git',
      },
    },
    follow_current_file = {
      enabled = true,
    },
    use_libuv_file_watcher = true, -- Rafraîchit automatiquement l'arborescence si un fichier change sur le disque
  },
})

-- Raccourcis globaux (en dehors de la fenêtre neo-tree)
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Explorateur : Afficher/Masquer' })
vim.keymap.set('n', '<leader>o', '<Cmd>Neotree focus<CR>', { desc = 'Explorateur : Donner le focus' })
vim.keymap.set('n', '<leader>ge', '<Cmd>Neotree float git_status<CR>', { desc = 'Git : Fichiers modifiés (flottant)' })
vim.keymap.set('n', '<leader>be', '<Cmd>Neotree float buffers<CR>', { desc = 'Buffers : Liste ouverte (flottant)' })
