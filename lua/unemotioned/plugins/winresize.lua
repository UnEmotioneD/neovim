return {
  'pogyomo/winresize.nvim',
  config = function()
    local resize = function(win, amt, dir)
      return function()
        require('winresize').resize(win, amt, dir)
      end
    end

    -- Does not resize the focused window if the window is at the center of more then 3 splits
    --  it will resize the window next to it

    vim.keymap.set(
      'n',
      '<C-S-h>',
      resize(0, 5, 'left'), -- 0 means current window
      { desc = 'Resize Window to Left', noremap = true, silent = true }
    )

    vim.keymap.set(
      'n',
      '<C-S-j>',
      resize(0, 3, 'down'), -- Smaller increment because vertical resize is more dramatic
      { desc = 'Resize Window to Bottom', noremap = true, silent = true }
    )

    vim.keymap.set('n', '<C-S-k>', resize(0, 3, 'up'), { desc = 'Resize Window to Top', noremap = true, silent = true })

    vim.keymap.set(
      'n',
      '<C-S-l>',
      resize(0, 5, 'right'),
      { desc = 'Resize Window to Right', noremap = true, silent = true }
    )
  end,
}
