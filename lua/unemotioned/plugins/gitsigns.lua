return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(bufnr)
      local gitsigns = package.loaded.gitsigns

      local function map(mode, lhs, rhs, opts)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = opts })
      end

      -- stylua: ignore start
      map('n', '[h', gitsigns.prev_hunk, 'prev [h]unk')
      map('n', ']h', gitsigns.next_hunk, 'next [h]unk')

      map('n', '<leader>hs', gitsigns.stage_hunk, '[s]tage hunk')
      map('n', '<leader>hr', gitsigns.reset_hunk, '[r]eset hunk')

      map('v', '<leader>hs', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, '[s]tage selected')
      map('v', '<leader>hr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, '[r]eset selected')

      map('n', '<leader>hS', gitsigns.stage_buffer, '[S]tage buffer')
      map('n', '<leader>hR', gitsigns.reset_buffer, '[R]eset buffer')
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, '[u]ndo last stage')

      map('n', '<leader>hp', gitsigns.preview_hunk, '[p]review hunk')

      map('n', '<leader>hb', function() gitsigns.blame_line({ full = true }) end, 'toggle [b]lame (pop-up)')
      map('n', '<leader>hB', gitsigns.toggle_current_line_blame, 'toggle [B]lame (in-line)')

      map('n', '<leader>hd', gitsigns.diffthis, '[d]iff this file')
      map('n', '<leader>hD', function() gitsigns.diffthis('~') end, '[D]iff against last commit')
      map('n', '<leader>hc', ':q1<CR>', 'Close diff window')

      map('n', '<leader>hq', gitsigns.setqflist, 'buffer diffs to [q]flist')
      map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, 'workspace diffs to [Q]flist')

      map('n', '<leader>ht', gitsigns.toggle_deleted, '[t]oggle deleted hunks')
      map('n', '<leader>hw', gitsigns.toggle_word_diff, 'toggle [w]ord diff')

      map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, 'select [h]unk')
      -- stylua: ignore end
    end,
  },
}
