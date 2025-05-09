return {
  'unblevable/quick-scope',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    vim.g.qs_filetype_blacklist = {
      'NvimTree',
      'alpha',
      'harpoon',
      'lazy',
      'mason',
      'oil',
      'qf',
      'trouble',
    }
  end,
}
