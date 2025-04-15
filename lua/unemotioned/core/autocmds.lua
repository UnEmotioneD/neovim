-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', { clear = true }),
  callback = function()
    vim.hl.on_yank({ higroup = 'IncSearch', timeout = 300 })
  end,
})

-- Prevent auto-comments on new lines
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('DisableAutoCommenting', { clear = true }),
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove('r')
    vim.opt_local.formatoptions:remove('o')
  end,
})

-- Performance
vim.o.updatetime = 200

-- Highlight word under cursor
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(attach_event)
    local client = vim.lsp.get_client_by_id(attach_event.data.client_id)

    if
      client
      and client.supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, attach_event.buf)
    then
      local highlight_group = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = attach_event.buf,
        group = highlight_group,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = attach_event.buf,
        group = highlight_group,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(detach_event)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({
            group = 'lsp-highlight',
            buffer = detach_event.buf,
          })
        end,
      })
    end
  end,
})

-- Console log macro to register lima
-- 콘솔에 출력할 값(변수 이름)을 "viw(visual inside word)"등으로 선택하고 "@l" 로 매크로를 실행
local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
local group = vim.api.nvim_create_augroup('JSLogMacro', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = { 'html', 'javascript', 'typescript' }, -- 해당 파일을 열면 자동으로 매크로가 생김
  callback = function()
    local macro = "yoconsole.log('" .. esc .. "pa: '," .. esc .. 'pa);' .. esc
    vim.fn.setreg('l', macro)
  end,
})
