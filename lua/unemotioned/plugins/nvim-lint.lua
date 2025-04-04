return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      c = { 'cpplint' },
      cpp = { 'cpplint' },
      python = { 'ruff' },
      markdown = { 'markdownlint' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    -- ignore "Could not find config file. eslint_d" error for javascript files
    ---@return vim.Diagnostic | nil
    lint.linters.eslint_d = require('lint.util').wrap(lint.linters.eslint_d, function(diagnostic)
      if diagnostic.message:find('Error: Could not find config file') then
        return nil
      end
      return diagnostic
    end)

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
