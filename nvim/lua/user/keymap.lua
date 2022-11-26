local keymap = vim.keymap.set

local opts = { noremap = true }

-- Buffer navigation
vim.keymap.set('n', '<leader>c', '<cmd>bdelete<CR>', opts)
vim.keymap.set('n', '<S-l>', '<cmd>bnext<CR>', opts)
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<CR>', opts)


-- window navigation
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)

vim.keymap.set('n', '<leader>sr', ':vsplit<CR>', opts)
vim.keymap.set('n', '<leader>sb', ':split<CR>', opts)
vim.keymap.set('n', '<leader>sc', '<c-w>c', opts)
vim.keymap.set('n', '<leader>ev', ':edit $MYVIMRC<CR>', opts)
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>', opts)
