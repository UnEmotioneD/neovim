vim.g.mapleader = ' ' -- leader key to Space

local map = vim.keymap.set

-----------------------
--- general keymaps ---
-----------------------

map('n', ';', ':', { desc = 'Command mode w/ semi-colon' })

map('n', '<Esc>', ':nohl<CR>', { desc = 'Clear hlsearch', silent = true }) -- Only clears highlight
map('n', '<leader>nh', function()
  vim.fn.setreg('/', '')
  vim.cmd([[
    noh
    echo "Search register cleared"
  ]])
end, { desc = '[n]o [h]ighlight' })

map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

map('n', 'Y', 'y$', { desc = 'Yank to eol' })

map('n', 'x', '"_x', { desc = 'Delete char without yanking' })

map('v', 'p', 'pgvy', { desc = 'Paste over selection without overriding reg' })

-- 리눅스에서 '입력' 모드 일때 Esc를 누르면 IM(Input Method)를 영어로 전환
--  키보드가 한글 일때는 '일반' 모드에서 움직일 수 없기 때문에 유용
--  'fcitx5'를 이용할때 사용 가능
if vim.loop.os_uname().sysname == 'Linux' then
  map('i', '<Esc>', function()
    vim.fn.system('fcitx5-remote -c')
    return '<Esc>'
  end, { expr = true })
end

map('n', '<leader>sv', '<C-w>v', { desc = '[s]plit [v]ertically' })
map('n', '<leader>sh', '<C-w>s', { desc = '[s]plit [h]orizontally' })
map('n', '<leader>se', '<C-w>=', { desc = '[s]plits into [e]qual size' })
map('n', '<leader>sx', '<C-w>x', { desc = '[s]plits [s]wap sides' })

map('n', '<leader>to', ':tabnew<CR>', { desc = '[t]ab [o]pen new tab' })
map('n', '<leader>tf', ':tabnew %<CR>', { desc = '[t]ab [f]ile (open current buffer in new tab)' })
map('n', '<leader>tx', ':tabclose<CR>', { desc = '[t]ab [x] close current tab' })
map('n', '<leader>tn', ':tabn<CR>', { desc = '[t]ab [n]ext tab' })
map('n', '<leader>tp', ':tabp<CR>', { desc = '[t]ab [p]revious tab' })

map('n', 'H', ':bp<CR>', { desc = 'Buffer Previous' })
map('n', 'L', ':bn<CR>', { desc = 'Buffer Next' })

map('n', '<leader>cs', ':setlocal spell! spell?<CR>', { desc = '[c]heck [s]pell toggle' })

-- disable Ex Mode
map('n', 'Q', '<Nop>', { noremap = true, silent = true })

----------------------
--- plugin keymaps ---
----------------------

-- alpha
map('n', '<leader>A', ':Alpha<CR>', { desc = '[A]lpha', silent = true })

-- auto-session
map('n', '<leader>wr', ':SessionRestore<CR>', { desc = 'Session [s]ave' })
map('n', '<leader>ws', ':SessionSave<CR>', { desc = 'Session [r]estore' })

-- conform
map({ 'n', 'v' }, '<leader>p', function()
  require('conform').format()
end, { desc = 'Format(in range)' })

map('n', '<leader>cc', function()
  vim.fn.system('rm /home/unemotioned/.local/state/nvim/conform.log')
  vim.cmd('echo "Conform log removed"')
end, { desc = '[c]onform log [c]lear' })

map('n', '<leader>ci', ':ConformInfo<CR>', { desc = '[c]onform [i]nfo' })

-- flash
map('n', '<CR>', function()
  require('flash').jump()
end, { desc = '[f]lash' })

-- gitsings
map('n', '<leader>hc', ':q1<CR>', { desc = 'Diff [c]lose' })

-- haproon ---
-- stylua: ignore start
local add = function() require('harpoon'):list():add() vim.cmd('echo "File harpooned"') end
local edit = function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end
local sel1 = function() require('harpoon'):list():select(1) end
local sel2 =function() require('harpoon'):list():select(2) end
local sel3 =function() require('harpoon'):list():select(3) end
local sel4 =function() require('harpoon'):list():select(4) end

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
  -- for macOS harpoon with leader key
  map('n', '<leader><leader>h', add, addDesc)
  map('n', '<leader><leader>e', edit, editDesc)
  map('n', '<leader>1', sel1, sel1Desc)
  map('n', '<leader>2', sel2, sel2Desc)
  map('n', '<leader>3', sel3, sel3Desc)
  map('n', '<leader>4', sel4, sel4Desc)
else
  map('n', '<M-u>', add, addDesc)
  map('n', '<M-i>', edit, editDesc)
  map('n', '<M-j>', sel1, sel1Desc)
  map('n', '<M-k>', sel2, sel2Desc)
  map('n', '<M-l>', sel3, sel3Desc)
  map('n', '<M-;>', sel4, sel4Desc)
end

-- lazy
map('n', '<leader>L', ':Lazy<CR>', { desc = '[L]azy', silent = true })

-- lazygit
map('n', '<leader>hg', ':LazyGit<CR>', { desc = 'Lazy[g]it' })

-- lsp-config
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

-- live-server
map('n', '<leader>lo', ':LiveServerStart<CR>', { desc = '[l]ive server [o]pen' })
map('n', '<leader>lc', ':LiveServerStop<CR>', { desc = '[l]ive server [c]lose' })
map('n', '<leader>lt', ':LiveServerToggle<CR>', { desc = '[l]ive server [t]oggle' })

-- mason
map('n', '<leader>M', ':Mason<CR>', { desc = '[M]ason', silent = true })

-- maximizer
map('n', '<leader>sm', ':lua require("maximizer").toggle()<CR>', { desc = '[s]plit to [m]ax/min', silent = true, noremap = true })

-- nvimtree
map('n', '<leader>ee', ':NvimTreeToggle<CR>', { desc = '[e]xplorer toggle' })
map('n', '<leader>ef', ':NvimTreeFindFileToggle<CR>', { desc = '[e]xplorer on current [f]ile' })
map('n', '<leader>ec', ':NvimTreeCollapse<CR>', { desc = '[e]explorer [c]ollapse' })
map('n', '<leader>er', ':NvimTreeRefresh<CR>', { desc = '[e]xplorer [r]efresh' })

-- nvim-hlslens
local function hlslens_key(key)
  return string.format(":execute('normal! ' .. v:count1 .. '%szz')<CR>:lua require('hlslens').start()<CR>", key)
end
map('n', 'n', hlslens_key('n'), { desc = 'Next hlsearch', noremap = true, silent = true })
map('n', 'N', hlslens_key('N'), { desc = 'Prev hlsearch', noremap = true, silent = true })

-- oil
map('n', '-', ':Oil<CR>', { desc = 'Open parent directory', silent = true })

-- telescope
map('n', '<leader>fb', ':Telescope buffers<CR>', { desc = '[f]ind [b]uffers' })
map('n', '<leader>fc', ':Telescope grep_string<CR>', { desc = '[f]ind string under [c]ursor in cwd' })
map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = '[f]ind [f]iles' })
map('n', '<leader>fk', ':Telescope keymaps<CR>', { desc = '[f]ind [k]keymaps' })
map('n', '<leader>fn', function()
  require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config'), prompt_title = 'Find Nvim Config' })
end, { desc = '[f]ind [n]eovim files' })
map('n', '<leader>fo', ':Telescope oldfiles<CR>', { desc = '[f]ind [o]old files' })
map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>', { desc = '[f]ind [s]symbols' })
map('n', '<leader>ft', ':TodoTelescope<CR>', { desc = '[f]ind [t]odos' })
map('n', '<leader>fw', ':Telescope live_grep<CR>', { desc = '[f]ind [w]ords' })
map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ winblend = 0, previewer = false }))
end, { desc = '[/] Fuzzy search current buffer' })

-- todo-comments
map('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })
map('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

-- trouble
map('n', '<leader>xw', ':Trouble diagnostics toggle<CR>', { desc = 'Open trouble [w]orkspace diagnostics' })
map('n', '<leader>xd', ':Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble [d]ocument diagnostics' })
map('n', '<leader>xq', ':Trouble quickfix toggle<CR>', { desc = 'Open trouble [q]uickfix list' })
map('n', '<leader>xl', ':Trouble loclist toggle<CR>', { desc = 'Open trouble [l]ocation list' })
map('n', '<leader>xt', ':Trouble todo toggle<CR>', { desc = 'Open [t]odos in trouble' })

-- undotree
map('n', '<leader>u', ":lua require('undotree').toggle()<CR>", { desc = '[u]ndo-tree toggle' })

-- zen-mode
map('n', '<leader>zz', ':ZenMode<CR>', { desc = '[z]en [z]en', silent = true })
