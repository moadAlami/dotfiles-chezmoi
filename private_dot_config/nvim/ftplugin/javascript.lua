function FormatWithPrettier()
    vim.cmd('write')
    vim.cmd('!prettier --write --tab-width=4 --bracket-same-line --print-width=200 %')
end

vim.keymap.set('n', '<leader>s', function() vim.cmd('source /home/mouad/.config/nvim/ftplugin/javascript.lua') end, { silent = false })
vim.keymap.set('n', '<leader>pr', FormatWithPrettier, { silent = true, noremap = true })
