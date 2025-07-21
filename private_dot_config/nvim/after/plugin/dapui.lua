local dapui = require("dapui")

dapui.setup()

vim.keymap.set('n', '<leader>o', ':lua require("dapui").open()<CR>')
vim.keymap.set('n', '<leader>O', ':lua require("dapui").close()<CR>')
