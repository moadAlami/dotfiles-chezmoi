vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<space>j", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<space>k", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<space>q", "<cmd>cclose<CR>zz")

vim.keymap.set('n', 'cp', '"+p')
vim.keymap.set('x', '<c-c>', '"+y')
vim.keymap.set('x', '<c-x>', '"+d')
vim.keymap.set('n', 'S', 'i<CR><Esc>')

vim.keymap.set('n', '<F6>', ':setlocal spell! spelllang=fr<CR>')
vim.keymap.set('n', '<F8>', ':setlocal spell! spelllang=en<CR>')

-- correct misspelling
vim.keymap.set('i',  '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- deadkeys
vim.keymap.set('n', "<leader><leader>d", ":call ToggleDeadKeys()<CR>")
