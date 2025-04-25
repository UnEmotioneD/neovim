return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-symbols.nvim',
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        path_display = { 'smart' },
        mappings = {
          i = {
            ['<C-h>'] = actions.select_horizontal,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<C-w>'] = actions.which_key,
            ['<C-x>'] = nil, -- disable default keymap to open in horizontal split
          },
        },
        -- files or directories to not search
        file_ignore_patterns = {
          '.DS_Store', -- for macOS
          '%.git/',
          'build/',
          -- For python
          'venv/',
          '__pycache__/',
          -- For java project
          '.class',
          '.prefs',
        },
      },
      pickers = {
        find_files = {
          hidden = false,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    })

    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
  end,
}
