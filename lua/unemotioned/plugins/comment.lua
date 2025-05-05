return {
  'numToStr/Comment.nvim',
  dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
  config = function()
    -- For commenting html, jsx, tsx, svelte files and etc ...
    local ts_context_commentstring = require('ts_context_commentstring.integrations.comment_nvim')
    require('Comment').setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
