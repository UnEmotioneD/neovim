vim.g.mapleader = ' ' -- leader key to SPACE

local map = vim.keymap.set -- for conciseness

-----------------------
--- General Keymaps ---
-----------------------

map('n', ';', ':', { desc = 'Command mode w/ semi-colon' })

map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half down and center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half up and center' })

map('n', 'H', ':bp<CR>', { desc = 'Buffer Previous' })
map('n', 'L', ':bn<CR>', { desc = 'Buffer Next' })

map('n', 'J', 'mzJ`z:delm z<CR>', { desc = 'Join lines without moving cursor' })

map('x', 'J', ":move '>+1<CR>gv=gv", { desc = 'Move Block Down' })
map('x', 'K', ":move '<-2<CR>gv=gv", { desc = 'Move Block Up' })

map('v', 'p', '"_dP', { desc = 'Paste over selection without overriding reg' })

map('n', 'Y', 'y$', { desc = 'Yank to End of Line' })

map('n', 'x', '"_x', { desc = 'Delete char without yanking' })

map('n', '<Esc>', ':nohl<CR>', { desc = 'Clear hlsearch', silent = true })

-- 리눅스에서 '입력' 모드 일때 Esc를 누르면 IM(Input Method)를 영어로 전환
--  키보드가 한글 일때는 '일반' 모드에서 움직일 수 없기 때문에 유용
--  'fcitx5'를 이용할때 사용 가능
if vim.uv.os_uname().sysname == 'Linux' then
  map('i', '<Esc>', function()
    vim.fn.system('fcitx5-remote -c')
    return '<Esc>'
  end, { expr = true })
end

map('n', 'gco', 'o<Esc>Vcx<Esc>:normal gcc<CR>fxa<BS>', { desc = 'Add Comment Below' })
map('n', 'gcO', 'O<Esc>Vcx<Esc>:normal gcc<CR>fxa<BS>', { desc = 'Add Comment Above' })

map('n', '<leader>ch', ':checkhealth<CR>', { desc = '[c]heck [h]ealth ' })

map('n', '<leader>tc', ':setlocal spell! spell?<CR>', { desc = '[t]oggle [c]heck spell' })

map('n', '<leader>dm', ':delm!<CR>', { desc = '[d]elete all [m]arks' })

map('n', '<leader>sv', '<C-w>v', { desc = '[s]plit [v]ertically' })
map('n', '<leader>sh', '<C-w>s', { desc = '[s]plit [h]orizontally' })
map('n', '<leader>se', '<C-w>=', { desc = '[s]plits into [e]qual size' })
map('n', '<leader>sx', '<C-w>x', { desc = '[s]plits [s]wap sides' })

----------------------
--- Plugin Keymaps ---
----------------------

-- auto-session
map('n', '<leader>wr', ':SessionRestore<CR>', { desc = 'Session [s]ave' })
map('n', '<leader>ws', ':SessionSave<CR>', { desc = 'Session [r]estore' })
map('n', '<leader>wf', ':SessionSearch<CR>', { desc = 'Session [f]ind' })
map('n', '<leader>wp', ':SessionPurgeOrphaned<CR>', { desc = 'Session [p]urge' })

-- conform
map({ 'n', 'v' }, '<leader>p', function()
  require('conform').format()
end, { desc = 'Format' })

map('n', '<leader>cl', function()
  vim.fn.system('rm ~/.local/state/nvim/conform.log')
  vim.cmd('echo "Conform log removed"')
end, { desc = '[c]onform [l]og clear' })

map('n', '<leader>ci', ':ConformInfo<CR>', { desc = '[c]onform [i]nfo' })

-- flash
map('n', '<leader><CR>', function()
  require('flash').jump()
end, { desc = 'Flash' })

map('o', '<leader><CR>', function()
  require('flash').remote()
end, { desc = 'Remote Flash' })

-- gitsings
map('n', '<leader>hc', ':q1<CR>', { desc = 'Diff [c]lose' })

-- haproon ---
-- stylua: ignore start
map('n', '<leader><leader>h', function() require('harpoon'):list():add() vim.cmd('echo "File harpooned"') end, { desc = '[f]ile' })
map('n', '<leader><leader>e', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, { desc = '[e]dit' })

map('n', '<C-7>', function() require('harpoon'):list():select(1) end, {desc = 'Harpoon to 1'})
map('n', '<C-8>', function() require('harpoon'):list():select(2) end, {desc = 'Harpoon to 2'})
map('n', '<C-9>', function() require('harpoon'):list():select(3) end, {desc = 'Harpoon to 3'})
map('n', '<C-0>', function() require('harpoon'):list():select(4) end, {desc = 'Harpoon to 4'})

map('n', '<C-S-n>', function() require('harpoon'):list():next() end, { desc = 'next on harpoon list' })
map('n', '<C-S-p>', function() require('harpoon'):list():prev() end, { desc = 'prev on harpoon list' })
-- stylua: ignore end

-- lazy
map('n', '<leader>L', ':Lazy<CR>', { desc = '[L]azy', silent = true })

-- lazygit
map('n', '<leader>hg', ':LazyGit<CR>', { desc = 'Lazy[g]it' })

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
map('n', '<leader>lo', ':LiveServerStart<CR>', { desc = '[l]ive server [o]pen' })
map('n', '<leader>lc', ':LiveServerStop<CR>', { desc = '[l]ive server [c]lose' })
map('n', '<leader>lt', ':LiveServerToggle<CR>', { desc = '[l]ive server [t]oggle' })

-- mason
map('n', '<leader>M', ':Mason<CR>', { desc = '[M]ason', silent = true })

-- maximizer
map('n', '<leader>sm', function()
  require('maximizer').toggle()
end, { desc = '[s]plit to [m]ax/restore', silent = true, noremap = true })

-- nvim-hlslens
local function hlslens_key(key)
  return string.format(":execute('normal! ' .. v:count1 .. '%szz')<CR>:lua require('hlslens').start()<CR>", key)
end
map('n', 'n', hlslens_key('n'), { desc = 'Next hlsearch', noremap = true, silent = true })
map('n', 'N', hlslens_key('N'), { desc = 'Prev hlsearch', noremap = true, silent = true })

-- nvim-tree
map('n', '<leader>ee', ':NvimTreeToggle<CR>', { desc = '[e]xplorer toggle' })
map('n', '<leader>ef', function()
  local view = require('nvim-tree.view')
  if view.is_visible() then
    view.close()
  end
  vim.cmd('NvimTreeFindFile')
end, { desc = '[e]xplorer current [f]ile' })
map('n', '<leader>ec', ':NvimTreeCollapse<CR>', { desc = '[e]explorer [c]ollapse' })
map('n', '<leader>er', ':NvimTreeRefresh<CR>', { desc = '[e]xplorer [r]efresh' })

-- oil
map('n', '-', ':Oil<CR>', { desc = 'Open parent directory', silent = true })

-- quicker
map('n', '<leader>qq', function()
  require('quicker').toggle()
end, { desc = 'Quicker' })

-- quicker
map('n', '<leader>qq', function()
  require('quicker').toggle()
end, { desc = '[q]uickfix list toggle' })

map('n', '<leader>ql', function()
  require('quicker').toggle({ loclist = true })
end, { desc = '[q]uickfix [l]ocalist' })

-- snacks.picker
map('n', '<leader>gb', function()
  require('snacks').picker.git_branches()
end, { desc = '[g]it [b]ranches' })

map('n', '<leader>gd', function()
  require('snacks').picker.git_diff()
end, { desc = '[g]it [d]iff (Hunks)' })

map('n', '<leader>gf', function()
  require('snacks').picker.git_log_file()
end, { desc = '[g]it [l]og [f]iles' })

map('n', '<leader>gl', function()
  require('snacks').picker.git_log()
end, { desc = '[g]it [l]og' })

map('n', '<leader>gL', function()
  require('snacks').picker.git_log_line()
end, { desc = '[g]it log [l]ine' })

map('n', '<leader>gs', function()
  require('snacks').picker.git_status()
end, { desc = '[g]it [s]tatus' })

map('n', '<leader>gS', function()
  require('snacks').picker.git_stash()
end, { desc = '[g]it [s]tash' })

map('n', '<leader>fI', function()
  require('snacks').picker.icons()
end, { desc = '[f]ind [I]cons' })

-- telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = '[f]ind [f]iles' })
map('n', '<leader>fw', ':Telescope live_grep<CR>', { desc = '[f]ind [w]ords' })
map('n', '<leader>fc', ':Telescope grep_string<CR>', { desc = '[f]ind string under [c]ursor' })
map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(
    require('telescope.themes').get_dropdown({ previewer = false })
  )
end, { desc = 'Fuzzy search buffer' })

map('n', '<leader>fn', function()
  require('telescope.builtin').find_files({
    cwd = vim.fn.stdpath('config'),
    prompt_title = 'Neovim Settings',
  })
end, { desc = '[f]ind [n]eovim files' })

map('n', '<leader>fk', ':Telescope keymaps<CR>', { desc = '[f]ind [k]keymaps' })

map('n', '<leader>ft', ':TodoTelescope<CR>', { desc = '[f]ind [t]odos' })

-- todo-comments
map('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

map('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

-- trouble
map('n', '<leader>xd', ':Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble [d]ocument diagnostics' })
map('n', '<leader>xl', ':Trouble loclist toggle<CR>', { desc = 'Open trouble [l]ocation list' })
map('n', '<leader>xt', ':Trouble todo toggle<CR>', { desc = 'Open [t]odos in trouble' })
map('n', '<leader>xq', ':Trouble quickfix toggle<CR>', { desc = 'Open trouble [q]uickfix list' })
map('n', '<leader>xw', ':Trouble diagnostics toggle<CR>', { desc = 'Open trouble [w]orkspace diagnostics' })

-- undotree
map('n', '<leader>u', function()
  require('undotree').toggle()
end, { desc = 'Undotree' })

-- zen-mode
map('n', '<leader>z', ':ZenMode<CR>', { desc = 'Zen-mode', silent = true })

----------------------
--- Disable Keymaps --
----------------------

map({ 'n', 'x' }, 'Q', '<Nop>', { noremap = true }) -- Ex mode (old command interface)
map('n', 'q:', '<Nop>', { noremap = true }) -- Command-line window

-- Disable default nvim keymap since it is done by lsp with telescope
map('n', 'gO', '<Nop>', { noremap = true }) -- symbol
map({ 'n', 'x' }, 'gra', '<Nop>', { noremap = true }) -- code action
map('n', 'gri', '<Nop>', { noremap = true }) -- implementation
map('n', 'grr', '<Nop>', { noremap = true }) -- reference
map('n', 'grn', '<Nop>', { noremap = true }) -- rename

-- Completely delete keymaps to not show it from telescoe keymaps
local del = vim.keymap.del

del('n', 'Q')
del('x', 'Q')
del('n', 'q:')
del('n', 'gO')
del('n', 'gra')
del('x', 'gra')
del('n', 'gri')
del('n', 'grr')
del('n', 'grn')
