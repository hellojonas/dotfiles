local keymap = vim.keymap.set

-- Buffer navigation
vim.keymap.set('n', '<leader>bc', '<cmd>bdelete<CR>', {})
vim.keymap.set('n', '<S-l>', '<cmd>bnext<CR>', {})
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<CR>', {})
