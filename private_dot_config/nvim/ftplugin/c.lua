function Run()
    vim.cmd('write')
    vim.cmd('!gcc %:p -o %:t:r')
    vim.cmd('!./%:t:r')
end

vim.keymap.set('n', '<leader>s', ':source /home/mouad/.config/nvim/ftplugin/c.lua<CR>')
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c', ':lua Run()<LF>', { silent = false })
