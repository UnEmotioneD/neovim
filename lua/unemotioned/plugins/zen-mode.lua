return {
  'folke/zen-mode.nvim',
  opts = {
    window = { width = 90 },
    plugins = {
      gitsigns = { enabled = false },
      tmux = { enabled = false },
    },
    on_open = function(win)
      if vim.bo.filetype == 'lua' then
        vim.api.nvim_win_set_width(win, 130)
        vim.opt.colorcolumn = '119'
      elseif vim.bo.filetype == 'python' then
        vim.api.nvim_win_set_width(win, 98)
        vim.opt.colorcolumn = '87'
      end
    end,
    on_close = function()
      if vim.bo.filetype == 'lua' then
        vim.opt.colorcolumn = '0'
      elseif vim.bo.filetype == 'python' then
        vim.opt.colorcolumn = '0'
      end
    end,
  },
}
