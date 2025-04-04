return {
  'jiaoshijie/undotree',
  opts = {
    float_diff = true, -- `true` disables layout option
    ---@type string | "left_bottom" | "left_left_bottom"
    layout = 'left_bottom',
    ---@type string | "left" | "right" | "bottom"
    position = 'left',
    ignore_filetype = {
      'undotree',
      'undotreeDiff',
      'qf',
      'TelescopePrompt',
      'spectre_panel',
      'tsplayground',
    },
    window = {
      winblend = 0,
    },
    keymaps = {
      ['j'] = 'move_next',
      ['k'] = 'move_prev',
      ['gj'] = 'move2parent',
      ['J'] = 'move_change_next',
      ['K'] = 'move_change_prev',
      ['<CR>'] = 'action_enter',
      ['p'] = 'enter_diffbuf',
      ['q'] = 'quit',
    },
  },
}
