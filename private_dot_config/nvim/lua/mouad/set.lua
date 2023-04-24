vim.cmd('filetype plugin on')

-- don't automcomment on new lines
vim.cmd('autocmd FileType * set formatoptions-=cro')

-- autocomplete
vim.opt.wildmenu = true
vim.opt.wildmode = {'longest', 'list', 'full'}

vim.opt.number = true
vim.opt.relativenumber = true

-- leave as is
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

-- no swap, long undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.updatetime = 50

vim.g.AngryReviewerEnglish = 'british'

vim.g.netrw_browsex_viewer = "librewolf"
