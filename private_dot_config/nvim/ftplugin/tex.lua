function FullCompile()
    vim.cmd('write')
    vim.cmd('silent !mkdir out')
    vim.cmd('!latexmk -outdir=out/ --output-format=pdf -file-line-error -interaction=errorstopmode -synctex=1 %:p')
end

function Compile()
    vim.cmd('write')
    vim.cmd('silent !mkdir out')
    vim.cmd('!pdflatex -outdir=out/ --output-format=pdf -file-line-error -interaction=errorstopmode -synctex=1 %:p')
end

function Xelatex()
    vim.cmd('write')
    vim.cmd('cd %:p:h')
    vim.cmd('!xelatex %:p -synctex=1')
    vim.cmd('cd -')
end

function Bibtex()
    vim.cmd('cd %:p:h')
    vim.cmd('!bibtex %:t:r')
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

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c', ':lua FullCompile()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>xc', ':lua Xelatex()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>o', ':lua OpenPdf()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>xb', ':lua Bibtex()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>xo', ':lua OpenLocalPdf()<LF>', { silent = true })
