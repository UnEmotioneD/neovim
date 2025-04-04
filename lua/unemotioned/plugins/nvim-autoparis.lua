return {
  'windwp/nvim-autopairs',
  dependencies = {
    'hrsh7th/nvim-cmp',
  },
  event = { 'InsertEnter' },
  config = function()
    require('nvim-autopairs').setup({
      check_ts = true,
      -- do exclude
      ts_config = {
        lua = { 'string' },
        javascript = { 'template_string' },
        java = false,
      },
    })

    local cmp = require('cmp')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
