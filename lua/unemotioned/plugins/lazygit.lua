return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  config = function()
    require('telescope').load_extension('lazygit')
  end,
}
