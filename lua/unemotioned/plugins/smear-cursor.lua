return {
  'sphamba/smear-cursor.nvim',
  opts = {
    smear_between_buffers = true,
    -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    smear_between_neighbor_lines = true,
    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,
    -- Smears will blend better on all backgrounds.
    legacy_computing_symbols_support = true,
    -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
    smear_insert_mode = false,
  },
  -- Enable if not kitty
  enabled = vim.env.TERM ~= 'xterm-kitty',
}
