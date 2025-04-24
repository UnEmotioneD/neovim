return {
  'ThePrimeagen/harpoon',
  event = 'VeryLazy',
  branch = 'harpoon2',
  config = function()
    local harpoon = require('harpoon')
    local list = require('harpoon'):list()
    local extensions = require('harpoon.extensions')

    harpoon.setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    })

    vim.keymap.set('n', '<Tab>h', function()
      list:add()
    end, { desc = '[h]arpoon file' })
    vim.keymap.set('n', '<Tab>e', function()
      harpoon.ui:toggle_quick_menu(list)
    end, { desc = 'Harpoon Edit' })

    vim.keymap.set('n', '<Tab>j', function()
      list:select(1)
    end, { desc = 'Harpoon to 1' })
    vim.keymap.set('n', '<Tab>k', function()
      list:select(2)
    end, { desc = 'Harpoon to 2' })
    vim.keymap.set('n', '<Tab>l', function()
      list:select(3)
    end, { desc = 'Harpoon to 3' })
    vim.keymap.set('n', '<Tab>;', function()
      list:select(4)
    end, { desc = 'Harpoon to 4' })

    vim.keymap.set('n', '<C-n>', function()
      list:next()
    end, { desc = 'Next on harpoon list', noremap = true })
    vim.keymap.set('n', '<C-p>', function()
      list:prev()
    end, { desc = 'Prev on harpoon list', noremap = true })

    harpoon:extend(extensions.builtins.highlight_current_file())

    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set('n', '<C-h>', function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-v>', function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set('n', '<C-t>', function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })
  end,
}
