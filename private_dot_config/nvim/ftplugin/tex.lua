function OpenPdf()
    local pdf_path = tostring(vim.fn.expand('%:p:r') .. '.pdf')
    vim.fn.system('zathura ' .. pdf_path .. '& disown')
end

vim.keymap.set('n', '<leader>ar', ':AngryReviewer<CR>')
vim.keymap.set('n', '<leader>s', ':source /home/mouad/.config/nvim/ftplugin/tex.lua<CR>')
vim.keymap.set('n', '<leader>lf', ':!textidote --check fr --output html % > report.html; firefox report.html <c-r><CR><CR>')
vim.keymap.set('n', '<leader>le', ':!textidote --check en --output html % > report.html; firefox report.html <c-r><CR><CR>')

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>m', ':!make<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c', ':write<CR>:!latexmk --output-format=pdf %:p<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>xc', ':write<CR>:!latexmk -pdfxe %:p<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>o', ':lua OpenPdf()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>xb', ':lua Bibtex()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>xo', ':lua OpenLocalPdf()<LF>', { silent = true })
