-- https://github.com/modernshell/dotfiles/nvim
-- modern.shell@gmail.com
-- ~/.config/nvim/lua/plugins/telescope.lua
-- neovim 0.12

-- Run the fzf-native build after install/update.
-- This autocmd must be registered BEFORE vim.pack.add().
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd(name) end
      vim.system({ 'make' }, { cwd = ev.data.path }):wait()
    end
  end,
})

vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  { src = 'https://github.com/nvim-telescope/telescope.nvim', version = '0.1.x' },
})

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    prompt_prefix = '  ',
    selection_caret = ' ',
    sorting_strategy = 'ascending',
    layout_config = { prompt_position = 'top', width = 0.9, height = 0.85 },
    file_ignore_patterns = { '^.git/', 'node_modules/', '%.lock' },
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['<Esc>'] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      theme = "dropdown",
    },
    buffers = {
      sort_mru = true,
      mappings = { i = { ['<C-d>'] = actions.delete_buffer } },
    },
  },
  extensions = {
    fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true },
    ['ui-select'] = { require('telescope.themes').get_dropdown() },
  },
})

pcall(telescope.load_extension, 'fzf')
pcall(telescope.load_extension, 'ui-select')

local builtin = require('telescope.builtin')
local map = vim.keymap.set
map('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
map('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
map('n', '<leader>fd', builtin.diagnostics, { desc = 'Diagnostics' })
map('n', '<leader>fw', builtin.grep_string, { desc = 'Grep word under cursor' })
map('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Search in buffer' })
map('n', '<leader>fc', function()
  builtin.find_files({ cwd = vim.fn.stdpath('config') })
end, { desc = 'Neovim config files' })
