function Run()
    vim.cmd('write')
    -- vim.cmd('cd %:p:h')
    vim.cmd('!python %:p')
    -- vim.cmd('cd -')
end

vim.keymap.set('n', '<leader>s', ':source /home/mouad/.config/nvim/ftplugin/python.lua<CR>')

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c', ':lua Run()<LF>', { silent = true })
