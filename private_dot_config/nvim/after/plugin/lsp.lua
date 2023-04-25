require('mason').setup({
	ui = {
		border = 'rounded'
	}
})

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mapping = lsp.defaults.cmp_mappings({
	['C-p'] = cmp.mapping.select_prev_item(cmp_select),
	['C-n'] = cmp.mapping.select_next_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mapping,
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	}
})


cmp.setup({
	formatting = {
		-- changing the order of fields so the icon is the first
		fields = { 'menu', 'abbr', 'kind' },
		-- here is where the change happens
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
				nvim_lua = 'Π',
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	-- vim.keymap.set('n', '<leader>n', function() vim.diagnostic.goto_next() end, opts)
	-- vim.keymap.set('n', '<leader>p', function() vim.diagnostic.goto_prev() end, opts)
	-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
end)

-- lsp.format_on_save({
-- 	servers = {
-- 		['lua_ls'] = { 'lua' },
-- 		['pylsp'] = { 'python' },
-- 		['html-lsp'] = { 'html' }
-- 	}
-- })

lsp.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

lsp.setup()
