function Run()
    vim.cmd('write')
    vim.cmd('!remind -c1 -p %:p | rem2ps > %:p:h/calendar.ps ')
end

vim.keymap.set('n', '<leader>s', ':source /home/mouad/.config/nvim/ftplugin/remind.lua<CR>')
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c', ':lua Run()<LF><LF>', { silent = false })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>o', ':!zathura $HOME/.config/remind/calendar.ps & disown<CR><CR>', { silent = true })
