local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", tag = "v0.6" }) -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/toggleterm.nvim")

	-- Colorschemes
	use("folke/tokyonight.nvim")
	use("lunarvim/darkplus.nvim")
	use("sainnhe/sonokai")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-calc")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("tamago324/nlsp-settings.nvim")
	use("folke/trouble.nvim")
	use("ray-x/lsp_signature.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "LinArcX/telescope-env.nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		commit = "6a437db0124823f9fe89c1de9a3b536ce1f103f3",
	})

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Project
	-- use("ahmedkhalf/project.nvim")

	-- Impatient for lua caching
	use("lewis6991/impatient.nvim")

	-- Indentline
	use("lukas-reineke/indent-blankline.nvim")

	-- alpha greeter
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

	-- whichkey
	use("folke/which-key.nvim")

	-- neogen
	use("danymat/neogen")

	-- colorizer
	use("norcalli/nvim-colorizer.lua")

	-- filetype plugin replacing slow built-in filetype.vim
	use("nathom/filetype.nvim")

	-- sessions
	use("rmagatti/auto-session")

	-- stabilize
	use("luukvbaal/stabilize.nvim")

	-- octo for github integration
	use("pwntester/octo.nvim")

	-- cheatsheets
	use("sudormrfbin/cheatsheet.nvim")

	-- cursorline modes
	use("mvllow/modes.nvim")

	-- advanced text objects
	use("wellle/targets.vim")

	-- remove trailing whitespace and extra empty lines at the end
	use({ "mcauley-penney/tidy.nvim", branch = "cfg" })

	-- show colorcolumn but in virtual text
	use("lukas-reineke/virt-column.nvim")

	-- use a session manager and finder
	use("rmagatti/session-lens")

	-- plugin for easy browsing
	use("lalitmee/browse.nvim")

	-- plugin for surround operation
	use("tpope/vim-surround")

	-- plugin to show current scope in status line
	use("SmiteshP/nvim-gps")

	-- plugin to make j/k movement faster
	use({
		"PHSix/faster.nvim",
		event = { "VimEnter *" },
		config = function()
			-- vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_j)", { noremap = false, silent = true })
			-- vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_k)", { noremap = false, silent = true })
			-- or
			vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_gj)', {noremap=false, silent=true})
			vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_gk)', {noremap=false, silent=true})
			-- if you need map in visual mode
			-- vim.api.nvim_set_keymap('v', 'j', '<Plug>(faster_vmove_j)', {noremap=false, silent=true})
			-- vim.api.nvim_set_keymap('v', 'k', '<Plug>(faster_vmove_k)', {noremap=false, silent=true})
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
