function Run()
    vim.cmd('write')
    vim.cmd('!firefox % &')
end

function FormatWithPrettier()
    vim.cmd('write')
    vim.cmd('!prettier --write --tab-width=4 --bracket-same-line --print-width=200 %')
end

vim.keymap.set('n', '<leader>s', function() vim.cmd('source /home/mouad/.config/nvim/ftplugin/html.lua') end, { silent = false })
vim.keymap.set('n', '<leader>c', Run, { silent = false })
vim.keymap.set('n', '<leader>pr', FormatWithPrettier, { silent = true, noremap = true })
