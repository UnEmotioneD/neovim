return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      c = { 'cpplint' },
      cpp = { 'cpplint' },
      python = { 'ruff' },
      markdown = { 'markdownlint' },
    }

    -- ignore "Could not find config file. eslint_d" error for javascript files
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
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
