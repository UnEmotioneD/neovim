return {
  'abecodes/tabout.nvim',
  lazy = false,
  event = 'InsertCharPre', -- for better compatibility
  priority = 1000,
  dependencies = 'hrsh7th/nvim-cmp',
  opts = {
    tabkey = '<Tab>',
    backwards_tabkey = '<S-Tab>',
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
    default_shift_tab = '<C-d>', -- reverse shift default action,
    enable_backwards = true,
    completion = false, -- if the tabkey is used in a completion pum
    tabouts = {
      { open = "'", close = "'" },
      { open = '"', close = '"' },
      { open = '`', close = '`' },
      { open = '(', close = ')' },
      { open = '[', close = ']' },
      { open = '{', close = '}' },
      { open = '<', close = '>' },
    },
    ignore_beginning = true, -- if the cursor is at the beginning of a filled element it will rather tab out than shift the content
    exclude = {}, -- filetypes to ignore
  },
}
