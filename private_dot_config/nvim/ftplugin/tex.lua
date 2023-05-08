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
    vim.cmd('silent !mkdir out')
    vim.cmd('!xelatex %:p')
    vim.cmd('cd -')
end

function OpenPdf()
    local pdf_path = tostring(vim.fn.expand('%:p:h:') .. '/out/' .. vim.fn.expand('%:t:r') .. '.pdf')
    local opta = "--synctex-forward "
    local optb = tostring(vim.fn.line('.')) .. ":" .. tostring(vim.fn.col('.')) .. ":" .. vim.fn.expand('%:p')
    vim.fn.system('zathura "' .. pdf_path .. '" ' .. opta .. optb .. " & disown")
end

vim.keymap.set('n', '<leader>ar', ':AngryReviewer<CR>')
vim.keymap.set('n', '<leader>s', ':source /home/mouad/.config/nvim/ftplugin/tex.lua<CR>')

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>c', ':lua FullCompile()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>lc', ':lua Xelatex()<LF>', { silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>o', ':lua OpenPdf()<LF>', { silent = true })
