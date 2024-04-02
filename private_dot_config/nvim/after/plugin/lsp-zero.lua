local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  -- lsp_zero.default_keymaps(opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>fo", function() vim.lsp.buf.format() end, opts)
end)

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md

require('mason').setup({
    ui = {
	icons = {
	    package_installed = "✓",
	    package_pending = "➜",
	    package_uninstalled = "✗"
	}
    }
})

require('mason-lspconfig').setup({
  ensure_installed = {'biome', 'cssls', 'html', 'pylsp'},
  handlers = {
    lsp_zero.default_setup,

    biome = function()
	require('lspconfig').biome.setup({
	    single_file_support = true,
	})
    end,

  },
})
