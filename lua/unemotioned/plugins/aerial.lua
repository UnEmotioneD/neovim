return {
  'stevearc/aerial.nvim',
  config = function()
    require('aerial').setup({
      layout = {
        width = 40,
        ---@type 'prefer_right' | 'prefer_left' | 'right' | 'left' | 'float'
        default_direction = 'left',
        placement = 'window',
        resize_to_content = true,
      },
      ---@type 'window' | 'global'
      attach_mode = 'window',
      disable_max_lines = 1024,
      disable_max_size = 2 * 1024 * 1024, -- 2MB
      highlight_on_hover = true,
      autojump = true,
      show_guides = true,
      on_attach = function(bufnr)
        vim.keymap.set('n', '[a', ':AerialPrev<CR>', { desc = 'Aerial prev', buffer = bufnr })
        vim.keymap.set('n', ']a', ':AerialNext<CR>', { desc = 'Aerial next', buffer = bufnr })
        vim.keymap.set('n', '<leader>a', ':AerialToggle!<CR>', { desc = '[a]erial', buffer = bufnr })
      end,
    })

    require('telescope').setup({
      extensions = {
        aerial = {
          col1_width = 4,
          col2_width = 30,
          -- How to format the symbols
          format_symbol = function(symbol_path, filetype)
            if filetype == 'json' or filetype == 'yaml' then
              return table.concat(symbol_path, '.')
            else
              return symbol_path[#symbol_path]
            end
          end,
          ---@type string 'symbols' | 'lines'
          show_columns = 'both',
        },
      },
    })
    require('telescope').load_extension('aerial')
  end,
}
