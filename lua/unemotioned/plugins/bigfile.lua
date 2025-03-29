return {
  'LunarVim/bigfile.nvim',
  event = 'BufReadPre',
  opts = {
    -- size of the file in MiB, the plugin round file sizes to the closest MiB
    filesize = 2,
  },
  config = function(_, opts)
    require('bigfile').setup(opts)
  end,
}
