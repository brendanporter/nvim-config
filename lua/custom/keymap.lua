local map = vim.keymap.set
local ts = require 'telescope.builtin'
--local tsproj = require('telescope').extensions.projects
--local preview = require 'goto-preview'
local tst = require 'telescope.themes'
local ts_dropdown_theme = tst.get_dropdown {
  winblend = 30, -- 70% opacity
  previewer = true, -- show the context of the highlighted option
}

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('n', '<leader>e', ':NvimTreeToggle<Enter>', { silent = true, desc = 'FileExplorer' })
map('n', '<leader>kk', ':ToggleTerm direction=float<Enter>', { silent = true, desc = 'ToggleTerm' })

map('n', '<leader>ki', ':split<Enter>', { silent = true, desc = 'Horizontal split' })
map('n', '<leader>kl', ':vsplit<Enter>', { silent = true, desc = 'Vertical split' })

map('t', '<C-h>', [[<C-\><C-n><C-W>h]], { silent = true, desc = 'Switch windows left' })
map('t', '<C-j>', [[<C-\><C-n><C-W>j]], { silent = true, desc = 'Switch windows down' })
map('t', '<C-k>', [[<C-\><C-n><C-W>k]], { silent = true, desc = 'Switch windows up' })
map('t', '<C-l>', [[<C-\><C-n><C-W>l]], { silent = true, desc = 'Switch windows right' })

-- drag a visual selection up and down with J and K
map('v', 'K', ":m '>+1<CR>gv=gv")
map('v', 'J', ":m '<-2<CR>gv=gv")

map('n', '<leader>f', function()
  ts.live_grep(ts_dropdown_theme)
end, { desc = '[f]uzzily grep' })
map('n', '<leader>F', function()
  ts.current_buffer_fuzzy_find(ts_dropdown_theme)
end, { desc = '[F]uzzily search in current buffer' })

map('n', '<leader>w', ':w<Enter>', { silent = true, desc = 'Save Buffer' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
