vim.g.mapleader = ' '

local map = vim.keymap.set

-----------------------
--- general keymaps ---
-----------------------

map('n', ';', ':', { desc = 'Command mode w/ semi-colon' })

map('n', '<Esc>', ':nohl<CR>', { desc = 'Clear hlsearch', silent = true })

map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

map('n', 'Y', 'y$', { desc = 'Yank to eol' })

map('n', 'x', '"_x', { desc = 'Delete char without yanking' })

map('v', 'p', 'pgvy', { desc = 'Paste over selection without overriding reg' })

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

map('n', '<leader>bn', ':bnext<CR>', { desc = '[b]uffer [n]ext' })
map('n', '<leader>bp', ':bprev<CR>', { desc = '[b]uffer [p]revious' })

map('n', '<leader>cs', ':setlocal spell! spell?<CR>', { desc = '[c]heck [s]pell toggle' })

-- Disable conflicting keybinds with tmux
map('', '<C-n>', '<Nop>', { noremap = true, silent = true })
map('', '<C-p>', '<Nop>', { noremap = true, silent = true })

-- Disable Ex Mode
map('n', 'Q', '<Nop>', { noremap = true, silent = true })

----------------------
--- plugin keymaps ---
----------------------

-- Auto-session
map('n', '<leader>wr', ':SessionRestore<CR>', { desc = 'Session [s]ave' })
map('n', '<leader>ws', ':SessionSave<CR>', { desc = 'Session [r]estore' })

-- Conform
map({ 'n', 'v' }, '<leader>p', function()
  require('conform').format()
end, { desc = 'Format(in range)' })

map('n', '<leader>ci', ':ConformInfo<CR>', { desc = '[C]onform [I]nfo' })

-- Flash
map('n', '<leader><leader>f', function()
  require('flash').jump()
end, { desc = '[f]lash' })

-- Gitsings
map('n', '<leader>hc', ':q1<CR>', { desc = 'Diff [c]lose' })

-- Haproon
local mod = '<M-'

-- TODO: Use command key for macOS
-- if vim.loop.os_uname().sysname == 'Darwin' then
--   mod = ''
-- end

map('n', mod .. 'u>', function()
  require('harpoon'):list():add()
end, { desc = '[h]arpoon File' })

map('n', mod .. 'i>', function()
  local harpoon = require('harpoon')
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Harpoon [e]dit' })

map('n', mod .. 'h>', function()
  require('harpoon'):list():select(1)
end, { desc = 'Harpoon to 1' })

map('n', mod .. 'j>', function()
  require('harpoon'):list():select(2)
end, { desc = 'Harpoon to 2' })

map('n', mod .. 'k>', function()
  require('harpoon'):list():select(3)
end, { desc = 'Harpoon to 3' })

map('n', mod .. 'l>', function()
  require('harpoon'):list():select(4)
end, { desc = 'Harpoon to 4' })

-- Hlslens
local function hlslens_key(key)
  return string.format("<Cmd>execute('normal! ' .. v:count1 .. '%szz')<CR><Cmd>lua require('hlslens').start()<CR>", key)
end
map('n', 'n', hlslens_key('n'), { desc = 'Next hlsearch', noremap = true, silent = true })
map('n', 'N', hlslens_key('N'), { desc = 'Prev hlsearch', noremap = true, silent = true })

-- Lazygit
map('n', '<leader>hg', ':LazyGit<CR>', { desc = 'Lazy[g]it' })

-- Live server
map('n', '<leader>lo', ':LiveServerStart<CR>', { desc = '[l]ive server [o]pen' })
map('n', '<leader>lc', ':LiveServerStop<CR>', { desc = '[l]ive server [c]lose' })
map('n', '<leader>lt', ':LiveServerToggle<CR>', { desc = '[l]ive server [t]oggle' })

-- Tree
map('n', '<leader>ee', ':NvimTreeToggle<CR>', { desc = '[e]xplorer toggle' })
map('n', '<leader>ef', ':NvimTreeFindFileToggle<CR>', { desc = '[e]xplorer on current [f]ile' })
map('n', '<leader>ec', ':NvimTreeCollapse<CR>', { desc = '[e]explorer [c]ollapse' })
map('n', '<leader>er', ':NvimTreeRefresh<CR>', { desc = '[e]xplorer [r]efresh' })

-- Todo-comments
map('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })
map('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

-- Undo Tree
map('n', '<leader>u', ":lua require('undotree').toggle()<CR>", { desc = 'Toggle Undo Tree', noremap = true, silent = true })

-- Oil
map('n', '-', ':Oil<CR>', { desc = 'Open parent directory', silent = true })

-- Telescope
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

-- Trouble
map('n', '<leader>xw', ':Trouble diagnostics toggle<CR>', { desc = 'Open trouble [w]orkspace diagnostics' })
map('n', '<leader>xd', ':Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble [d]ocument diagnostics' })
map('n', '<leader>xq', ':Trouble quickfix toggle<CR>', { desc = 'Open trouble [q]uickfix list' })
map('n', '<leader>xl', ':Trouble loclist toggle<CR>', { desc = 'Open trouble [l]ocation list' })
map('n', '<leader>xt', ':Trouble todo toggle<CR>', { desc = 'Open [t]odos in trouble' })

-- Vim-maximizer
map('n', '<leader>sm', ':MaximizerToggle<CR>', { desc = '[s]plit to [m]ax/min' })
