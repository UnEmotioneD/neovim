return {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    ---@type 'editable' | 'name' | 'false'
    constrain_cursor = 'name',
    keymaps = {
      ['g?'] = { 'actions.show_help', mode = 'n' },
      ['<CR>'] = 'actions.select',
      ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
      ['<C-h>'] = false,
      ['<C-t>'] = { 'actions.select', opts = { tab = true } },
      ['<leader>p'] = 'actions.preview',
      ['<C-c>'] = { 'actions.close', mode = 'n' },
      ['<C-l>'] = false,
      ['-'] = { 'actions.parent', mode = 'n' },
      ['_'] = { 'actions.open_cwd', mode = 'n' },
      ['`'] = { 'actions.cd', mode = 'n' },
      ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
      ['gs'] = { 'actions.change_sort', mode = 'n' },
      ['gx'] = 'actions.open_external',
      ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
      ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
    },
    -- Set to false to disable all of the above keymaps
    use_default_keymaps = true,

    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git' or name == '.DS_Store'
      end,
    },
  },
}
