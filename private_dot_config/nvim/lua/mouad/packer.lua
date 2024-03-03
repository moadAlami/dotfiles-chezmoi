-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')
    use('nvim-lua/plenary.nvim')
    use('nvim-telescope/telescope.nvim')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	requires = {
	    -- LSP Support
	    { 'neovim/nvim-lspconfig' }, -- Required
	    {
		-- Optional
		'williamboman/mason.nvim',
		run = function()
		    pcall(vim.cmd, 'MasonUpdate')
		end,
	    },
	    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

	    -- Autocompletion
	    { 'hrsh7th/nvim-cmp' }, -- Required
	    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
	    { 'L3MON4D3/LuaSnip' }, -- Required
	}
    }

    use { 'tpope/vim-surround' }
    use { 'anufrievroman/vim-angry-reviewer' }
    use { 'tpope/vim-commentary' }
    use {
	'nvim-lualine/lualine.nvim',
	requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use { 'tommcdo/vim-lion' }
    use { 'potamides/pantran.nvim' } -- translation

    use { 'lewis6991/gitsigns.nvim' }

    -- colorschemes
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "rose-pine/neovim", as = "rose-pine" }

    use {
	'nvim-treesitter/nvim-treesitter',
	run = function()
	    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	    ts_update()
	end,
    }

    use { 'dstein64/vim-startuptime' }
end)
