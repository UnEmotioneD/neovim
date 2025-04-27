vim.g.mapleader = ' ' -- leader key to SPACE

local map = vim.keymap.set -- for conciseness

-----------------------
--- General Keymaps ---
-----------------------

map('n', ';', ':', { desc = 'Command mode w/ semi-colon' })

map('n', 'H', ':bp<CR>', { desc = 'Buffer Previous' })
map('n', 'L', ':bn<CR>', { desc = 'Buffer Next' })

map('v', 'p', '"_dP', { desc = 'Paste over selection without overriding reg' })

map('n', 'Y', 'y$', { desc = 'Yank to End of Line' })

map('n', 'x', '"_x', { desc = 'Delete char without yanking' })

map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half down and center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half up and center' })

-- stylua: ignore
map( 'n', 'J', ":let p=getpos('.')<BAR>join<BAR>call setpos('.', p)<CR>",
  { desc = 'Join lines (keep cursor position)', silent = true })

map('v', 'J', ":move '>+1<CR>gv=gv", { desc = 'Move line down and reindent', silent = true })
map('v', 'K', ":move '<-2<CR>gv=gv", { desc = 'Move line up and reindent', silent = true })

map('v', '<', '<gv', { desc = 'Outdent (keep selected)', silent = true })
map('v', '>', '>gv', { desc = 'Indent (keep selected)', silent = true })

map('n', '<Esc>', ':noh<CR>', { desc = 'Clear hlsearch', silent = true })

-- 리눅스에서 '입력' 모드 일때 Esc를 누르면 IM(Input Method)를 영어로 전환
--  키보드가 한글 일때는 '일반' 모드에서 움직일 수 없기 때문에 유용
--  'fcitx5'를 이용할때 사용 가능
if vim.uv.os_uname().sysname == 'Linux' then
  map('i', '<Esc>', function()
    vim.fn.system('fcitx5-remote -c')
    return '<Esc>'
  end, { expr = true })
end

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

-- barbecue
map('n', '<leader>b', function()
  require('barbecue.ui').toggle()
end, { desc = '[b]arbecue' })

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

-- lazy
map('n', '<leader>L', ':Lazy<CR>', { desc = '[L]azy', silent = true })

-- lazygit
map('n', '<leader>hg', ':LazyGit<CR>', { desc = 'Lazy[g]it' })

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
map('n', '<leader>ec', ':NvimTreeCollapse<CR>', { desc = '[e]explorer [c]ollapse' })
map('n', '<leader>er', ':NvimTreeRefresh<CR>', { desc = '[e]xplorer [r]efresh' })

-- oil
map('n', '-', ':Oil<CR>', { desc = 'Open parent directory', silent = true })

-- quicker
map('n', '<leader>q', function()
  if vim.tbl_isempty(vim.fn.getqflist()) then
    vim.notify('Quickfix list empty', vim.log.levels.INFO)
    return
  else
    require('quicker').toggle()
  end
end, { desc = '[q]uicker' })

-- snacks.picker
map('n', '<leader>gb', function()
  require('snacks').picker.git_branches()
end, { desc = '[g]it [b]ranches' })

map('n', '<leader>gd', function()
  require('snacks').picker.git_diff()
end, { desc = '[g]it [d]iff (Hunks)' })

map('n', '<leader>gf', function()
  require('snacks').picker.git_log_file()
end, { desc = '[g]it log [f]iles' })

map('n', '<leader>gl', function()
  require('snacks').picker.git_log()
end, { desc = '[g]it [l]og' })

map('n', '<leader>gL', function()
  require('snacks').picker.git_log_line()
end, { desc = '[g]it log [L]ine' })

map('n', '<leader>gs', function()
  require('snacks').picker.git_status()
end, { desc = '[g]it [s]tatus' })

map('n', '<leader>gS', function()
  require('snacks').picker.git_stash()
end, { desc = '[g]it [S]tash' })

map('n', '<leader>fI', function()
  require('snacks').picker.icons()
end, { desc = '[f]ind [I]cons' })

-- telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = '[f]ind [f]iles' })
map('n', '<leader>fn', function()
  require('telescope.builtin').find_files({
    cwd = vim.fn.stdpath('config'),
    prompt_title = 'Nvim Config Files',
  })
end, { desc = '[f]ind [n]vim config files' })
map('n', '<leader>fc', ':Telescope grep_string<CR>', { desc = '[f]ind string under [c]ursor' })
map('n', '<leader>fw', ':Telescope live_grep<CR>', { desc = '[f]ind [w]ords' })

map('n', '<leader>fC', ':Telescope colorscheme enable_preview=true<CR>', { desc = '[f]ind [C]olorscheme' })
map('n', '<leader>fk', ':Telescope keymaps<CR>', { desc = '[f]ind [k]keymaps' })
map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(
    require('telescope.themes').get_dropdown({ previewer = false })
  )
end, { desc = 'Fuzzy search buffer' })
map('n', '<leader>fr', ':Telescope resume<CR>', { desc = 'Telescope [r]esume' })

map('n', '<leader>gC', ':Telescope git_commits<CR>', { desc = '[g]it every [C]ommits' })
map('n', '<leader>gc', ':Telescope git_bcommits<CR>', { desc = '[g]it current buffer [c]ommits' })
map('n', '<leader>gl', ':Telescope git_bcommits_range<CR>', { desc = '[g]it current [l]ine commits' })
map('n', '<leader>gb', ':Telescope git_branches<CR>', { desc = '[g]it [b]ranches' })
map('n', '<leader>gs', ':Telescope git_status<CR>', { desc = '[g]it [s]tatus' })

map('n', '<leader>ft', ':Telescope treesitter<CR>', { desc = '[f]ind [t]reesitter' })

-- Telescope-symbols
map('n', '<leader>fe', function()
  require('telescope.builtin').symbols({ sources = { 'emoji', 'gitmoji', 'kaomoji', 'latex', 'math' } })
end, { desc = '[f]ind [e]moji' })

-- todo-comments
map('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

map('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

map('n', '<leader>ft', ':TodoTelescope<CR>', { desc = '[f]ind [t]odos' })

-- trouble
map('n', '<leader>xd', ':Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble [d]ocument diagnostics' })
map('n', '<leader>xl', ':Trouble loclist toggle<CR>', { desc = 'Open trouble [l]ocation list' })
map('n', '<leader>xt', ':Trouble todo toggle<CR>', { desc = 'Open [t]odos in trouble' })
map('n', '<leader>xq', ':Trouble quickfix toggle<CR>', { desc = 'Open trouble [q]uickfix list' })
map('n', '<leader>xw', ':Trouble diagnostics toggle<CR>', { desc = 'Open trouble [w]orkspace diagnostics' })

-- undotree
map('n', '<leader>u', function()
  require('undotree').toggle()
end, { desc = '[u]ndotree' })

-- zen-mode
map('n', '<leader>z', ':ZenMode<CR>', { desc = '[z]en-mode', silent = true })

----------------------
--- Disable Keymaps --
----------------------

map({ 'n', 'x' }, 'Q', '<Nop>') -- Ex mode (old command interface)
map('n', 'q:', '<Nop>') -- Command-line window

-- Disable default nvim keymap since it is done by lsp with telescope
map('n', 'gO', '<Nop>') -- symbol
map('n', 'gri', '<Nop>') -- implementation
map('n', 'grr', '<Nop>') -- reference
map('n', 'grn', '<Nop>') -- rename

-- Completely delete keymaps to not show it from telescoe keymaps
local del = vim.keymap.del

del('n', 'Q')
del('x', 'Q')
del('n', 'q:')
del('n', 'gO')
del('n', 'gri')
del('n', 'grr')
del('n', 'grn')
