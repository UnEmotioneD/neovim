vim.g.mapleader = ' ' -- leader key to SPACE

local map = vim.keymap.set -- for conciseness

-----------------------
--- General Keymaps ---
-----------------------

map('n', ';', ':', { desc = 'Command mode w/ semi-colon' })

map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half down and center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half up and center' })

map('n', 'H', '<cmd>bp<cr>', { desc = 'Buffer Previous' })
map('n', 'L', '<cmd>bn<cr>', { desc = 'Buffer Next' })

map('n', 'J', 'mzJ`z<cmd>delm z<cr>', { desc = 'Join lines without moving cursor' })

map('x', 'J', "<cmd>m '>+1<cr>gv=gv", { desc = 'Move Block Down' })
map('x', 'K', "<cmd>m '<-2<cr>gv=gv", { desc = 'Move Block Up' })

map('v', 'p', '"_dP', { desc = 'Paste over selection without overriding reg' })

map('n', 'Y', 'y$', { desc = 'Yank to End of Line' })

map('n', 'x', '"_x', { desc = 'Delete char without yanking' })

map('n', '<esc>', '<cmd>nohl<cr>', { desc = 'Clear hlsearch', silent = true })

-- 리눅스에서 '입력' 모드 일때 Esc를 누르면 IM(Input Method)를 영어로 전환
--  키보드가 한글 일때는 '일반' 모드에서 움직일 수 없기 때문에 유용
--  'fcitx5'를 이용할때 사용 가능
if vim.uv.os_uname().sysname == 'Linux' then
  map('i', '<esc>', function()
    vim.fn.system('fcitx5-remote -c')
    return '<esc>'
  end, { expr = true })
end

map('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
map('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

map('n', '<leader>ch', '<cmd>checkhealth<cr>', { desc = '[c]heck [h]ealth ' })

map('n', '<leader>cs', '<cmd>setlocal spell! spell?<cr>', { desc = '[c]heck [s]pell toggle' })

map('n', '<leader>dm', '<cmd>delm!<cr>', { desc = '[d]elete all [m]arks' })

map('n', '<leader>sv', '<C-w>v', { desc = '[s]plit [v]ertically' })
map('n', '<leader>sh', '<C-w>s', { desc = '[s]plit [h]orizontally' })
map('n', '<leader>se', '<C-w>=', { desc = '[s]plits into [e]qual size' })
map('n', '<leader>sx', '<C-w>x', { desc = '[s]plits [s]wap sides' })

map('n', '<leader>nh', function()
  vim.fn.setreg('/', '')
  vim.cmd('noh')
  vim.cmd('echo "Search register cleared"')
end, { desc = '[n]o [h]ighlight' })

----------------------
--- Plugin Keymaps ---
----------------------

-- auto-session
map('n', '<leader>wr', '<cmd>SessionRestore<cr>', { desc = 'Session [s]ave' })
map('n', '<leader>ws', '<cmd>SessionSave<cr>', { desc = 'Session [r]estore' })
map('n', '<leader>wf', '<cmd>SessionSearch<cr>', { desc = 'Session [f]ind' })
map('n', '<leader>wp', '<cmd>SessionPurgeOrphaned<cr>', { desc = 'Session [p]urge' })

-- conform
map({ 'n', 'v' }, '<leader>p', function()
  require('conform').format()
  vim.cmd('echo "File formatted"')
end, { desc = 'Format(in range)' })

map('n', '<leader>cc', function()
  vim.fn.system('rm ~/.local/state/nvim/conform.log')
  vim.cmd('echo "Conform log removed"')
end, { desc = '[c]onform log [c]lear' })

map('n', '<leader>ci', '<cmd>ConformInfo<cr>', { desc = '[c]onform [i]nfo' })

-- flash
map('n', '<leader><cr>', function()
  require('flash').jump()
end, { desc = '[f]lash' })

-- gitsings
map('n', '<leader>hc', '<cmd>q1<cr>', { desc = 'Diff [c]lose' })

-- haproon ---
-- stylua: ignore start
local add = function() require('harpoon'):list():add() vim.cmd('echo "File harpooned"') end
local edit = function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end
local sel1 = function() require('harpoon'):list():select(1) end
local sel2 = function() require('harpoon'):list():select(2) end
local sel3 = function() require('harpoon'):list():select(3) end
local sel4 = function() require('harpoon'):list():select(4) end

local addDesc = { desc = 'Harpoon File' }
local editDesc = { desc = 'Harpoon Menu' }
local sel1Desc = { desc = 'Harpoon to 1' }
local sel2Desc = { desc = 'Harpoon to 2' }
local sel3Desc = { desc = 'Harpoon to 3' }
local sel4Desc = { desc = 'Harpoon to 4' }

map('n', '<C-S-n>', function() require('harpoon'):list():next() end, { desc = 'next on harpoon list' })
map('n', '<C-S-p>', function() require('harpoon'):list():prev() end, { desc = 'prev on harpoon list' })
-- stylua: ignore end

if vim.loop.os_uname().sysname == 'Darwin' then
  map('n', '<leader><leader>u', add, addDesc)
  map('n', '<leader><leader>i', edit, editDesc)
  map('n', '<leader><leader>j', sel1, sel1Desc)
  map('n', '<leader><leader>k', sel2, sel2Desc)
  map('n', '<leader><leader>l', sel3, sel3Desc)
  map('n', '<leader><leader>;', sel4, sel4Desc)
else
  map('n', '<M-u>', add, addDesc)
  map('n', '<M-i>', edit, editDesc)
  map('n', '<M-j>', sel1, sel1Desc)
  map('n', '<M-k>', sel2, sel2Desc)
  map('n', '<M-l>', sel3, sel3Desc)
  map('n', '<M-;>', sel4, sel4Desc)
end

-- lazy
map('n', '<leader>L', '<cmd>Lazy<cr>', { desc = '[L]azy', silent = true })

-- lazygit
map('n', '<leader>hg', '<cmd>LazyGit<cr>', { desc = 'Lazy[g]it' })

-- nvim-lspconfig
local isTextOn = true
map('n', '<leader>vt', function()
  if isTextOn == true then
    vim.diagnostic.config({
      virtual_lines = { current_line = true },
    })
    vim.cmd('echo "Line diagnostics on"')
  else
    vim.diagnostic.config({
      virtual_lines = false,
    })
    vim.cmd('echo "Text diagnostics on"')
  end
  vim.diagnostic.config({ virtual_text = not isTextOn })
  isTextOn = not isTextOn
end, { desc = '[v]irtual diagnostic [t]oggle' })

map('n', '<leader>vi', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end, { desc = '[i]nlay hints toggle' })

-- live-server
map('n', '<leader>lo', '<cmd>LiveServerStart<cr>', { desc = '[l]ive server [o]pen' })
map('n', '<leader>lc', '<cmd>LiveServerStop<cr>', { desc = '[l]ive server [c]lose' })
map('n', '<leader>lt', '<cmd>LiveServerToggle<cr>', { desc = '[l]ive server [t]oggle' })

-- mason
map('n', '<leader>M', '<cmd>Mason<cr>', { desc = '[M]ason', silent = true })

-- maximizer
map('n', '<leader>sm', function()
  require('maximizer').toggle()
end, { desc = '[s]plit to [m]ax/restore', silent = true, noremap = true })

-- nvim-hlslens
local function hlslens_key(key)
  return string.format("<cmd>execute('normal! ' .. v:count1 .. '%szz')<cr><cmd>lua require('hlslens').start()<cr>", key)
end
map('n', 'n', hlslens_key('n'), { desc = 'Next hlsearch', noremap = true, silent = true })
map('n', 'N', hlslens_key('N'), { desc = 'Prev hlsearch', noremap = true, silent = true })

-- nvim-tree
map('n', '<leader>ee', '<cmd>NvimTreeToggle<cr>', { desc = '[e]xplorer toggle' })
map('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<cr>', { desc = '[e]xplorer on current [f]ile' })
map('n', '<leader>ec', '<cmd>NvimTreeCollapse<cr>', { desc = '[e]explorer [c]ollapse' })
map('n', '<leader>ek', '<cmd>NvimTreeCollapseKeepBuffers<cr>', { desc = '[e]explorer collapse [k]eep buffer' })
map('n', '<leader>er', '<cmd>NvimTreeRefresh<cr>', { desc = '[e]xplorer [r]efresh' })

-- oil
map('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory', silent = true })

-- quicker
map('n', '<leader>qq', function()
  require('quicker').toggle()
end, { desc = '[q]uickfix list toggle' })

map('n', '<leader>ql', function()
  require('quicker').toggle({ loclist = true })
end, { desc = '[q]uickfix [l]ocalist' })

-- telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = '[f]ind [f]iles' })
map('n', '<leader>fw', '<cmd>Telescope live_grep<cr>', { desc = '[f]ind [w]ords' })
map('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = '[f]ind string under [c]ursor' })
map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ winblend = 0, previewer = false }))
end, { desc = '[/] Fuzzy search current buffer' })

map('n', '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', { desc = '[f]ind buffer [s]ymbols' })
map('n', '<leader>fS', '<cmd>Telescope lsp_workspace_symbols<cr>', { desc = '[f]ind workspace [S]ymbols' })

map('n', '<leader>fn', function()
  require('telescope.builtin').find_files({
    cwd = vim.fn.stdpath('config'),
    prompt_title = 'Neovim Settings',
  })
end, { desc = '[f]ind [n]eovim files' })

map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = '[f]ind [k]keymaps' })

map('n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = '[f]ind [t]odos' })

-- todo-comments
map('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })
map('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

-- trouble
map('n', '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Open trouble [d]ocument diagnostics' })
map('n', '<leader>xl', '<cmd>Trouble loclist toggle<cr>', { desc = 'Open trouble [l]ocation list' })
map('n', '<leader>xt', '<cmd>Trouble todo toggle<cr>', { desc = 'Open [t]odos in trouble' })
map('n', '<leader>xq', '<cmd>Trouble quickfix toggle<cr>', { desc = 'Open trouble [q]uickfix list' })
map('n', '<leader>xw', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Open trouble [w]orkspace diagnostics' })

-- undotree
map('n', '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", { desc = '[u]ndo-tree toggle' })

-- zen-mode
map('n', '<leader>zz', '<cmd>ZenMode<cr>', { desc = '[z]en [z]en', silent = true })

----------------------
--- Disable Keymaps --
----------------------

map({ 'n', 'x' }, 'Q', '<Nop>', { noremap = true, silent = true }) -- Ex mode (old command interface)
map('n', 'q:', '<Nop>', { noremap = true, silent = true }) -- Command-line window

-- Disable default nvim keymap since it is done by lsp with telescope
map('n', 'gO', '<Nop>', { noremap = true, silent = true }) -- symbol
map({ 'n', 'x' }, 'gra', '<Nop>', { noremap = true, silent = true }) -- code action
map('n', 'gri', '<Nop>', { noremap = true, silent = true }) -- implementation
map('n', 'grr', '<Nop>', { noremap = true, silent = true }) -- reference
map('n', 'grn', '<Nop>', { noremap = true, silent = true }) -- rename

-- Completely delete keymaps to not show it from telescoe keymaps
vim.keymap.del('n', 'Q')
vim.keymap.del('x', 'Q')
vim.keymap.del('n', 'q:')
vim.keymap.del('n', 'gO')
vim.keymap.del('n', 'gra')
vim.keymap.del('x', 'gra')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'grn')
