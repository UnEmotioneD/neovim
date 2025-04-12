return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=NETBLOCK
    dashboard.section.header.val = {
      '                                                  ',
      '                                                  ',
      '                                                  ',
      '                                                  ',
      '                                                  ',
      '                                                  ',
      '                                                  ',
      '                                                  ',
      '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
      '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
      '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
      '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
      '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
      '                                                  ',
    }

    dashboard.section.buttons.val = {
      dashboard.button('e', '  > Open Explorer', ':NvimTreeToggle<cr>'),
      dashboard.button('f', '󰱼  > Find File', ':Telescope find_files<cr>'),
      dashboard.button('w', '  > Find Word', ':Telescope live_grep<cr>'),
      dashboard.button('k', '  > Find Keymap', ':Telescope keymaps<cr>'),
      dashboard.button('r', '󰁯  > Restore Session', ':SessionRestore<cr>'),
      dashboard.button('g', '  > Open LazyGit', ':LazyGit<cr>'),
      dashboard.button('q', '  > Quit NVIM', ':qa<cr>'),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
