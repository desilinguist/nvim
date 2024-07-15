return {
	-- My plugins here
	-- Treesitter
	{
		"folke/which-key.nvim",
		event = "BufReadPost",
        tag = "v2.1.0",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	{ "windwp/nvim-ts-autotag", lazy = true }, -- Autocomplete and rename tags
	"numToStr/Comment.nvim", -- Easily comment stuff
	"kyazdani42/nvim-web-devicons", -- Use fancy icons for various file types
	"kyazdani42/nvim-tree.lua", -- Use a fancy filetree side bar
	"akinsho/bufferline.nvim", -- Easy graphical switching between open buffers
	"moll/vim-bbye", -- Easy buffer closing without messing up layouts
	"nvim-lualine/lualine.nvim", -- Fancy status line at the bottom
	"akinsho/toggleterm.nvim", -- Open terminals and terminal programs in floating windows

	-- Colorschemes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
			styles = {
				functions = { italic = true },
			},
			on_colors = function(colors)
				colors.hint = colors.orange
				colors.error = "#ff0000"
			end,
		},
	},

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp", -- lsp completions
	"hrsh7th/cmp-nvim-lua", -- nvim lua completions
	"hrsh7th/cmp-calc", -- calculator completions
	"lukas-reineke/cmp-under-comparator", -- better sort completion items that start with underlines

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim", -- simple to use language server installer
	"williamboman/mason-lspconfig.nvim",
	-- "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"nvimtools/none-ls.nvim", -- for formatters and linters
	"tamago324/nlsp-settings.nvim", -- Common null-ls settings
	"ray-x/lsp_signature.nvim", -- Show signature of any function while typing it
	"b0o/SchemaStore.nvim", -- Use SchemaStore for various JSON/YAML schemas
	{ "j-hui/fidget.nvim" }, -- Show LSP progress, if available

	-- Telescope
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "LinArcX/telescope-env.nvim" },
	{
		"princejoogie/dir-telescope.nvim",
		config = function()
			require("dir-telescope").setup({
				hidden = false,
				respect_gitignore = true,
			})
		end,
	},
	{ "nvim-telescope/telescope-live-grep-args.nvim" },

	-- Git
	"lewis6991/gitsigns.nvim",

	-- Indentline
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	"antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight

	-- neogen
	{ "danymat/neogen", lazy = true },

	-- colorizer
	"norcalli/nvim-colorizer.lua",

	-- sessions
	{ "olimorris/persisted.nvim", lazy = true },

	-- stabilize
	"luukvbaal/stabilize.nvim",

	-- cheatsheets
	{ "sudormrfbin/cheatsheet.nvim", lazy = true },

	-- cursorline modes
	"mvllow/modes.nvim",

	-- advanced text objects
	"wellle/targets.vim",

	-- remove trailing whitespace and extra empty lines at the end
	"mcauley-penney/tidy.nvim",

	-- show colorcolumn but in virtual text
	"lukas-reineke/virt-column.nvim",

	-- plugin for easy browsing
	{ "lalitmee/browse.nvim", lazy = true },

	-- plugin for surround operation
	"kylechui/nvim-surround",

	-- plugin to show current scope in status line
	"SmiteshP/nvim-navic",

	-- undo-tree telescope plugin
	{ "debugloop/telescope-undo.nvim", lazy = true },

	-- plugin to make j/k movement faster
	{
		"PHSix/faster.nvim",
		event = { "VimEnter *" },
		config = function()
			-- vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_j)", { noremap = false, silent = true })
			-- vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_k)", { noremap = false, silent = true })
			-- or
			vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_gj)", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_gk)", { noremap = false, silent = true })
			-- if you need map in visual mode
			-- vim.api.nvim_set_keymap('v', 'j', '<Plug>(faster_vmove_j)', {noremap=false, silent=true})
			-- vim.api.nvim_set_keymap('v', 'k', '<Plug>(faster_vmove_k)', {noremap=false, silent=true})
		end,
	},

	-- treesitter text objects
	"nvim-treesitter/nvim-treesitter-textobjects",

	-- treesitter context
	"nvim-treesitter/nvim-treesitter-context",

	-- nvim notify
	"rcarriga/nvim-notify",

	-- substitute
	{ "gbprod/substitute.nvim", lazy = true },

	-- color picker
	{
		"ziontee113/color-picker.nvim",
		config = function()
			require("color-picker")
		end,
		lazy = true,
	},

	-- icon picker
	"stevearc/dressing.nvim",

	-- task runner
	{ "jedrzejboczar/toggletasks.nvim", lazy = true },

	-- better sorting
	{ "SQVe/sort.nvim", lazy = true },

	-- better integration with system clipboard
	"ojroques/nvim-osc52",

	-- better folding
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },

	-- better lsp diagnostics
	{ "ErichDonGubler/lsp_lines.nvim", lazy = true },

	-- easy swapping of things
	{ "mizlan/iswap.nvim" },

	-- better highlighting/filtering of todos etc. in comments
	"folke/todo-comments.nvim",

	-- smart inverter for wordsr
	{ "nguyenvukhang/nvim-toggler", lazy = true },

	-- autolist plugin for markdown
	{ "gaoDean/autolist.nvim", lazy = true },

	-- plugin for fancy code screenshots
	-- {
	-- 	"krivahtoo/silicon.nvim",
	-- 	build = "./install.sh build",
	-- },
    { "mistricky/codesnap.nvim", build = "make build_generator" },

	-- plugin to support nim
	{ "alaviss/nim.nvim", ft = "nim" },

	-- plugin for typos in files and directory names
	{ "axieax/typo.nvim" },

	-- plugin for generating gitignore files
	{ "wintermute-cell/gitignore.nvim" },

	-- codegpt plugin
	{
		"dpayne/CodeGPT.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("codegpt.config")
		end,
	},

	-- allow selecting conda environments from within neovim
	{
		"linux-cultist/venv-selector.nvim",
		opts = {
			anaconda_base_path = "/Users/nmadnani/anaconda",
			anaconda_envs_path = "/Users/nmadnani/anaconda/envs",
			search = false,
			search_workspace = false,
		},
		branch = "regexp",
	},

	-- better search/replace experience
	{
		"roobert/search-replace.nvim",
		config = function()
			require("search-replace").setup({
				-- optionally override defaults
				default_replace_single_buffer_options = "gcI",
				default_replace_multi_buffer_options = "egcI",
			})
		end,
	},

	-- center buffers for better editing
	{ "shortcuts/no-neck-pain.nvim", version = "*" },

	-- add github copilot integration
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},

	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	-- add gen.nvim for local LLM integration
	{ "David-Kunz/gen.nvim" },

	-- heuristic buffer auto close
	{
		"axkirillov/hbac.nvim",
		config = true,
	},

	-- add bigfile.nvim to make editing of large files much faster
	-- by disabling certain features
	{
		"LunarVim/bigfile.nvim",
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
	},
}
