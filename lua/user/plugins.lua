local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
local plugins = {
	-- My plugins here
    "lewis6991/impatient.nvim", -- cache everything
    {
        "folke/which-key.nvim",
        event = 'BufReadPost',
    },
	-- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
    "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    { "windwp/nvim-ts-autotag", lazy=true }, -- Autocomplete and rename tags
    "numToStr/Comment.nvim", -- Easily comment stuff
    "kyazdani42/nvim-web-devicons", -- Use fancy icons for various file types
    "kyazdani42/nvim-tree.lua", -- Use a fancy filetree side bar
    "akinsho/bufferline.nvim", -- Easy graphical switching between open buffers
    "moll/vim-bbye", -- Easy buffer closing without messing up layouts
    "nvim-lualine/lualine.nvim", -- Fancy status line at the bottom
    "akinsho/toggleterm.nvim", -- Open terminals and terminal programs in floating windows

	-- Colorschemes
    { "folke/tokyonight.nvim", lazy=false, priority=1000 },

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
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    "tamago324/nlsp-settings.nvim", -- Common null-ls settings
    "folke/trouble.nvim", -- Nice way to show LSP diagnostics
    "ray-x/lsp_signature.nvim", -- Show signature of any function while typing it
    "b0o/SchemaStore.nvim", -- Use SchemaStore for various JSON/YAML schemas
    "j-hui/fidget.nvim", -- Show LSP progress, if available

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


	-- Git
    "lewis6991/gitsigns.nvim",

	-- Indentline
    "lukas-reineke/indent-blankline.nvim",

	-- alpha greeter
    "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight

	-- neogen
    { "danymat/neogen", lazy=true },

	-- colorizer
    "norcalli/nvim-colorizer.lua",

	-- filetype plugin replacing slow built-in filetype.vim
    "nathom/filetype.nvim",

	-- sessions
    { "olimorris/persisted.nvim", lazy=true },

	-- stabilize
    "luukvbaal/stabilize.nvim",

	-- cheatsheets
    { "sudormrfbin/cheatsheet.nvim", lazy=true },

	-- cursorline modes
    "mvllow/modes.nvim",

	-- advanced text objects
    "wellle/targets.vim",

	-- remove trailing whitespace and extra empty lines at the end
    "mcauley-penney/tidy.nvim",

	-- show colorcolumn but in virtual text
    "lukas-reineke/virt-column.nvim",

	-- plugin for easy browsing
    { "lalitmee/browse.nvim", lazy=true },

	-- plugin for surround operation
    "kylechui/nvim-surround",

	-- plugin to show current scope in status line
    "SmiteshP/nvim-navic",

    -- undo-tree telescope plugin
    { "debugloop/telescope-undo.nvim", lazy=true },

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
    { "gbprod/substitute.nvim", lazy=true },

	-- color picker
    {
        "ziontee113/color-picker.nvim",
        config = function()
            require("color-picker")
        end,
        lazy=true
    },

	-- icon picker
    "stevearc/dressing.nvim",

	-- task runner
    { "jedrzejboczar/toggletasks.nvim", lazy=true },

	-- better sorting
    { "SQVe/sort.nvim", lazy=true },

	-- better integration with system clipboard
    "ojroques/nvim-osc52",

	-- better folding
    { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },

	-- better lsp diagnostics
    { "ErichDonGubler/lsp_lines.nvim", lazy=true },

	-- easy swapping of things
    { "mizlan/iswap.nvim", lazy=true },

	-- better highlighting/filtering of todos etc. in comments
    "folke/todo-comments.nvim",

	-- smart inverter for wordsr
    { "nguyenvukhang/nvim-toggler", lazy=true },

	-- autolist plugin for markdown
    { "gaoDean/autolist.nvim", lazy=true },

	-- silicon plugin for fancy code screenshots
    { "narutoxy/silicon.lua", lazy=true },

	-- plugin to support nim
    { "alaviss/nim.nvim", ft="nim" },
}

local opts = {}
require("lazy").setup(plugins, opts)
