local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

function AddFile()
    print('Added '.. tostring(vim.fn.expand('%:p')));
    mark.add_file()
end

vim.keymap.set('n', '<leader>a', AddFile)
vim.keymap.set('n', '<leader>m', ui.toggle_quick_menu)

vim.keymap.set('n', '<a-a>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<a-z>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<a-e>', function() ui.nav_file(3) end)
vim.keymap.set('n', "<a-r>", function() ui.nav_file(4) end)

