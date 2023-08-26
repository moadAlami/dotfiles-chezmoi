-- function FullCompile()
--     vim.cmd('write')
--     vim.cmd('silent !mkdir out')
--     vim.cmd('!latexmk -outdir=out/ --output-format=pdf -file-line-error -interaction=errorstopmode -synctex=1 %:p')
-- end

function Compile()
    vim.cmd('write')
    vim.cmd('silent !mkdir out')
    vim.cmd('!pdflatex -outdir=out/ --output-format=pdf -file-line-error -interaction=errorstopmode -synctex=1 %:p')
end

function Xelatex()
    vim.cmd('write')
    local fp = vim.fn.expand('%:t')
    if fp == 'main.tex' then
	vim.cmd('cd %:p:h')
    else
	vim.cmd('cd %:p:h:h')
    end
    vim.cmd('!xelatex main.tex -synctex=1')
    vim.cmd('cd -')
end

function Bibtex()
    local fp = vim.fn.expand('%:t')
    if fp == 'main.tex' then
	vim.cmd('cd %:p:h')
    else
	vim.cmd('cd %:p:h:h')
    end
    vim.cmd('!bibtex main')
    vim.cmd('cd -')
end

function OpenPdf()
    local pdf_path = tostring(vim.fn.expand('%:p:h:') .. '/out/' .. vim.fn.expand('%:t:r') .. '.pdf')
    local opta = "--synctex-forward "
    local optb = tostring(vim.fn.line('.')) .. ":" .. tostring(vim.fn.col('.')) .. ":" .. vim.fn.expand('%:p')
    vim.fn.system('zathura "' .. pdf_path .. '" ' .. opta .. optb .. " & disown")
end

function OpenLocalPdf()
    local pdf_path = tostring(vim.fn.expand('%:p:r') .. '.pdf')
    vim.fn.system('zathura ' .. pdf_path .. '& disown')
end

vim.keymap.set('n', '<leader>ar', ':AngryReviewer<CR>')
vim.keymap.set('n', '<leader>s', ':source /home/mouad/.config/nvim/ftplugin/tex.lua<CR>')
vim.keymap.set('n', '<leader>lf', ':!textidote --check fr --output html % > report.html; firefox report.html <c-r><CR><CR>')
vim.keymap.set('n', '<leader>le', ':!textidote --check en --output html % > report.html; firefox report.html <c-r><CR><CR>')

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c', ':write<CR>:!make<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>xc', ':lua Xelatex()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>o', ':lua OpenPdf()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>xb', ':lua Bibtex()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>xo', ':lua OpenLocalPdf()<LF>', { silent = true })
