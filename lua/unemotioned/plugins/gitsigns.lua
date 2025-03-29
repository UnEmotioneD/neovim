return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, keys, func, desc)
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map('n', ']h', gs.next_hunk, 'Next [h]unk')
      map('n', '[h', gs.prev_hunk, 'Previous [h]unk')

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk, '[s]tage hunk')
      map('n', '<leader>hr', gs.reset_hunk, '[r]eset hunk')

      map('v', '<leader>hs', function()
        gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, '[s]tage selected hunk')

      map('v', '<leader>hr', function()
        gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, '[r]eset selected hunk')

      map('n', '<leader>hS', gs.stage_buffer, '[S]tage buffer')
      map('n', '<leader>hR', gs.reset_buffer, '[R]eset buffer')
      map('n', '<leader>hu', gs.undo_stage_hunk, '[u]ndo stage hunk')

      map('n', '<leader>hp', gs.preview_hunk, '[p]review hunk')

      map('n', '<leader>hb', function()
        gs.blame_line({ full = true })
      end, '[b]lame line (detailed)')

      map('n', '<leader>hB', gs.toggle_current_line_blame, 'Toggle line [B]lame')

      map('n', '<leader>hd', gs.diffthis, '[d]iff this file')
      map('n', '<leader>hD', function()
        gs.diffthis('~')
      end, '[D]iff against last commit')

      map('n', '<leader>ht', gs.toggle_deleted, '[t]oggle deleted hunks')

      -- Text object (use 'ih' after 'c', 'd', 'y')
      map({ 'o', 'x' }, 'ih', gs.select_hunk, 'Select [h]unk')
    end,
  },
}
