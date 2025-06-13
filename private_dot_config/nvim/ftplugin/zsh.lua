function Run()
    vim.cmd('write')
    vim.cmd('!zsh  %')
end

vim.keymap.set('n', '<leader>s', ':source /home/mouad/.config/nvim/ftplugin/zsh.lua<CR>')
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c', ':lua Run()<LF>', { silent = false })
