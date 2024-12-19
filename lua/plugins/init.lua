return {
    -- My plugins here
    -- which key
    {
        "folke/which-key.nvim",
        opts = {
            preset = "classic",
        },
        config = function()
            require("which-key").add({
                -- Leader key bindings
                {
                    "<leader>/",
                    function()
                        require("Comment.api").toggle.linewise.current()
                    end,
                    desc = "Comment",
                },
                {
                    "<leader>`",
                    "<cmd>Cheatsheet<CR>",
                    desc = "Show cheatsheet",
                },
                {
                    "<leader>b",
                    function()
                        require("snipe").open_buffer_menu()
                    end,
                    -- desc = "Open Snipe buffer menu",
                    -- function()
                    --     require("telescope").extensions.hbac.buffers(
                    --         require("telescope.themes").get_dropdown({ previewer = false })
                    --     )
                    -- end,
                    desc = "Buffers",
                },
                {
                    "<leader>c",
                    "<cmd>Bdelete!<CR>",
                    desc = "Close Buffer",
                },
                {
                    "<leader>C",
                    "<cmd>Telescope commands<cr>",
                    desc = "Find commands",
                },
                {
                    "<leader>e",
                    "<cmd>NvimTreeToggle<cr>",
                    desc = "Explorer",
                },
                {
                    "<leader>E",
                    "<cmd>Silicon<cr>",
                    desc = "Export PNG",
                },
                {
                    "<leader>f",
                    function()
                        require("telescope.builtin").find_files(
                            require("telescope.themes").get_dropdown({ previewer = false })
                        )
                    end,
                    desc = "Find files",
                },
                {
                    "<leader>F",
                    "<cmd>Telescope live_grep_args theme=ivy<cr>",
                    desc = "Find Text",
                },
                {
                    "<leader>h",
                    "<cmd>nohlsearch<CR>",
                    desc = "No Highlight",
                },
                {
                    "<leader>M",
                    "<cmd>! open -a 'Marked 2' %:p<cr>",
                    desc = "Markdown Preview",
                },
                {
                    "<leader>n",
                    "<cmd>enew<CR>",
                    desc = "New Buffer",
                },
                {
                    "<leader>N",
                    function()
                        require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
                            previewer = false,
                            cwd = vim.fn.stdpath("config"),
                            prompt_title = "Find Config File",
                        }))
                    end,
                    desc = "Find Config File",
                },
                {
                    "<leader>o",
                    function()
                        require("telescope.builtin").oldfiles(
                            require("telescope.themes").get_dropdown({ previewer = false })
                        )
                    end,
                    desc = "Old Files",
                },
                {
                    "<leader>P",
                    "<cmd>Lazy<cr>",
                    desc = "Lazy",
                },
                {
                    "<leader>q",
                    "<cmd>q!<CR>",
                    desc = "Quit",
                },
                {
                    "<leader>u",
                    "<cmd>Telescope undo<cr>",
                    desc = "Undo Tree",
                },
                {
                    "<leader>v",
                    "<cmd>Telescope env<cr>",
                    desc = "Env Vars",
                },
                {
                    "<leader>w",
                    "<cmd>w!<CR>",
                    desc = "Save",
                },

                -- Git bindings
                { "<leader>g", group = "Git" },
                {
                    "<leader>gg",
                    function()
                        _LAZYGIT_TOGGLE()
                    end,
                    desc = "Lazygit",
                },
                {
                    "<leader>gi",
                    "<cmd>Gitignore<cr>",
                    desc = "Generate gitignore",
                },
                {
                    "<leader>gj",
                    function()
                        require("gitsigns").next_hunk()
                    end,
                    desc = "Next Hunk",
                },
                {
                    "<leader>gk",
                    function()
                        require("gitsigns").prev_hunk()
                    end,
                    desc = "Prev Hunk",
                },
                {
                    "<leader>gl",
                    function()
                        require("gitsigns").blame_line()
                    end,
                    desc = "Blame",
                },
                {
                    "<leader>gp",
                    function()
                        require("gitsigns").preview_hunk()
                    end,
                    desc = "Preview Hunk",
                },
                {
                    "<leader>gr",
                    function()
                        require("gitsigns").reset_hunk()
                    end,
                    desc = "Reset Hunk",
                },
                {
                    "<leader>gR",
                    function()
                        require("gitsigns").reset_buffer()
                    end,
                    desc = "Reset Buffer",
                },
                {
                    "<leader>gs",
                    function()
                        require("gitsigns").stage_hunk()
                    end,
                    desc = "Stage Hunk",
                },
                {
                    "<leader>gu",
                    function()
                        require("gitsigns").undo_stage_hunk()
                    end,
                    desc = "Undo Stage Hunk",
                },
                {
                    "<leader>go",
                    "<cmd>Telescope git_status<cr>",
                    desc = "Open changed file",
                },
                {
                    "<leader>gb",
                    "<cmd>Telescope git_branches<cr>",
                    desc = "Checkout branch",
                },
                {
                    "<leader>gc",
                    "<cmd>Telescope git_commits<cr>",
                    desc = "Checkout commit",
                },
                {
                    "<leader>gd",
                    "<cmd>Gitsigns diffthis HEAD<cr>",
                    desc = "Diff",
                },

                -- LSP bindings
                { "<leader>l", group = "LSP" },
                {
                    "<leader>la",
                    function()
                        vim.lsp.buf.code_action()
                    end,
                    desc = "Code Action",
                },
                {
                    "<leader>lc",
                    "<cmd>:CondaActivate<cr>",
                    desc = "Conda Envs",
                },
                {
                    "<leader>ld",
                    "<cmd>Trouble diagnostics toggle<cr>",
                    desc = "Document Diagnostics",
                },
                {
                    "<leader>lw",
                    "<cmd>Telescope lsp_workspace_diagnostics<cr>",
                    desc = "Workspace Diagnostics",
                },
                {
                    "<leader>lf",
                    function()
                        vim.lsp.buf.format({ timeout_ms = 100000 })
                    end,
                    desc = "Format",
                },
                {
                    "<leader>li",
                    "<cmd>LspInfo<cr>",
                    desc = "Info",
                },
                {
                    "<leader>lI",
                    "<cmd>LspInstallInfo<cr>",
                    desc = "Installer Info",
                },
                {
                    "<leader>lj",
                    function()
                        vim.diagnostic.goto_next()
                    end,
                    desc = "Next Diagnostic",
                },
                {
                    "<leader>lk",
                    function()
                        vim.diagnostic.goto_prev()
                    end,
                    desc = "Prev Diagnostic",
                },
                {
                    "<leader>lm",
                    function()
                        vim.lsp.buf.rename()
                    end,
                    desc = "Rename",
                },
                {
                    "<leader>ll",
                    function()
                        require("lsp_lines").toggle()
                    end,
                    desc = "Toggle LSP lines",
                },
                {
                    "<leader>lq",
                    function()
                        vim.diagnostic.set_loclist()
                    end,
                    desc = "Quickfix",
                },
                {
                    "<leader>lr",
                    function()
                        require("telescope.builtin").lsp_document_symbols(
                            require("telescope.themes").get_dropdown({ previewer = false })
                        )
                    end,
                    desc = "Document Symbols",
                },
                {
                    "<leader>lR",
                    function()
                        require("telescope.builtin").lsp_dynamic_workspace_symbols(
                            require("telescope.themes").get_dropdown({ previewer = false })
                        )
                    end,
                    desc = "Workspace Symbols",
                },
                {
                    "<leader>lv",
                    function()
                        require("nvim-toggler").toggle()
                    end,
                    desc = "Invert",
                },

                -- Replace bindings
                { "<leader>r", group = "Replace" },
                {
                    "<leader>rs",
                    "<CMD>SearchReplaceSingleBufferSelections<CR>",
                    desc = "SearchReplaceSingleBuffer [s]elction list",
                },
                {
                    "<leader>ro",
                    "<CMD>SearchReplaceSingleBufferOpen<CR>",
                    desc = "[o]pen",
                },
                {
                    "<leader>rw",
                    "<CMD>SearchReplaceSingleBufferCWord<CR>",
                    desc = "[w]ord",
                },
                {
                    "<leader>rW",
                    "<CMD>SearchReplaceSingleBufferCWORD<CR>",
                    desc = "[W]ORD",
                },
                {
                    "<leader>re",
                    "<CMD>SearchReplaceSingleBufferCExpr<CR>",
                    desc = "[e]xpr",
                },
                {
                    "<leader>rf",
                    "<CMD>SearchReplaceSingleBufferCFile<CR>",
                    desc = "[f]ile",
                },

                -- Search bindings
                { "<leader>s", group = "Search" },
                {
                    "<leader>sc",
                    "<cmd>Telescope colorscheme<cr>",
                    desc = "Colorscheme",
                },
                {
                    "<leader>sh",
                    "<cmd>Telescope help_tags<cr>",
                    desc = "Find Help",
                },
                {
                    "<leader>sM",
                    "<cmd>Telescope man_pages<cr>",
                    desc = "Man Pages",
                },
                {
                    "<leader>sr",
                    "<cmd>Telescope oldfiles<cr>",
                    desc = "Open Recent File",
                },
                {
                    "<leader>sR",
                    "<cmd>Telescope registers<cr>",
                    desc = "Registers",
                },
                {
                    "<leader>sk",
                    "<cmd>Telescope keymaps<cr>",
                    desc = "Keymaps",
                },
                {
                    "<leader>sC",
                    "<cmd>Telescope commands<cr>",
                    desc = "Commands",
                },
                {
                    "<leader>ss",
                    "<cmd>Telescope persisted theme=dropdown<cr>",
                    desc = "Sessions",
                },

                -- Terminal bindings
                { "<leader>t", group = "Terminal" },
                {
                    "<leader>tt",
                    function()
                        _HTOP_TOGGLE()
                    end,
                    desc = "Htop",
                },
                {
                    "<leader>tf",
                    "<cmd>ToggleTerm direction=float<cr>",
                    desc = "Float",
                },
                {
                    "<leader>th",
                    "<cmd>ToggleTerm size=20 direction=horizontal<cr>",
                    desc = "Horizontal",
                },
                {
                    "<leader>tv",
                    "<cmd>ToggleTerm size=80 direction=vertical<cr>",
                    desc = "Vertical",
                },
                {
                    "<leader>tr",
                    function()
                        require("telescope").extensions.toggletasks.spawn(require("telescope.themes").get_ivy())
                    end,
                    desc = "Tasks",
                },
                {
                    "<leader>to",
                    function()
                        require("telescope").extensions.toggletasks.select(require("telescope.themes").get_ivy())
                    end,
                    desc = "Task Outputs",
                },
            })
        end,
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "awk",
                    "bash",
                    "bibtex",
                    "c",
                    "c_sharp",
                    "clojure",
                    "cmake",
                    "comment",
                    "commonlisp",
                    "cpp",
                    "css",
                    "csv",
                    "diff",
                    "disassembly",
                    "dockerfile",
                    "dot",
                    "doxygen",
                    "dtd",
                    "fish",
                    "fortran",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "gnuplot",
                    "go",
                    "gpg",
                    "haskell",
                    "hcl",
                    "html",
                    "http",
                    "ini",
                    "java",
                    "javascript",
                    "jq",
                    "jsdoc",
                    "json",
                    "json5",
                    "jsonc",
                    "jsonnet",
                    "julia",
                    "kotlin",
                    "llvm",
                    "lua",
                    "luadoc",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "matlab",
                    "mermaid",
                    "nim",
                    "nim_format_string",
                    "nix",
                    "objc",
                    "objdump",
                    "pascal",
                    "passwd",
                    "pem",
                    "perl",
                    "php",
                    "php_only",
                    "phpdoc",
                    "printf",
                    "properties",
                    "pymanifest",
                    "python",
                    "r",
                    "readline",
                    "regex",
                    "requirements",
                    "rst",
                    "ruby",
                    "rust",
                    "scss",
                    "sql",
                    "ssh_config",
                    "tcl",
                    "terraform",
                    "tmux",
                    "todotxt",
                    "toml",
                    "tsv",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
                    "zig",
                },
                sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
                auto_install = true,
                ignore_install = { "" }, -- List of parsers to ignore installing
                autopairs = {
                    enable = true,
                },
                autotag = {
                    enable = true,
                },
                highlight = {
                    enable = true, -- false will disable the whole extension
                    disable = { "" }, -- list of language that will be disabled
                    additional_vim_regex_highlighting = true,
                },
                indent = { enable = true, disable = { "yaml" } },
            })
        end,
    },
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
    "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    { "windwp/nvim-ts-autotag", lazy = true }, -- Autocomplete and rename tags
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    }, -- Easily comment stuff
    "kyazdani42/nvim-web-devicons", -- Use fancy icons for various file types
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                disable_netrw = true,
                hijack_cursor = true,
                reload_on_bufenter = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                    ignore_list = {},
                },
                git = {
                    enable = true,
                    ignore = true,
                    timeout = 500,
                },
                view = {
                    width = 40,
                    side = "left",
                },
                renderer = {
                    highlight_git = true,
                    icons = {
                        glyphs = {
                            default = "",
                            symlink = "",
                            git = {
                                unstaged = "",
                                staged = "S",
                                unmerged = "",
                                renamed = "➜",
                                deleted = "",
                                untracked = "U",
                                ignored = "◌",
                            },
                            folder = {
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                            },
                        },
                    },
                },
            })
        end,
    },
    -- "kyazdani42/nvim-tree.lua",             -- Use a fancy filetree side bar
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
    { "j-hui/fidget.nvim", config = true }, -- Show LSP progress, if available

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
    { "lewis6991/gitsigns.nvim", config = true },

    -- Indentline
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight

    -- neogen
    {
        "danymat/neogen",
        config = function()
            require("neogen").setup({
                enabled = true,
                snippet_engine = "luasnip",
                languages = {
                    python = {
                        template = {
                            annotation_convention = "numpydoc",
                        },
                    },
                },
            })
        end,
    },

    -- colorizer
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },

    -- sessions
    {
        "olimorris/persisted.nvim",
        lazy = true,
        config = function()
            require("persisted").setup({
                autoload = true,
                autosave = true,
                branch_separator = "_",
                before_save = function()
                    vim.cmd("NvimTreeClose")
                end,
            })
        end,
    },

    -- stabilize
    {
        "luukvbaal/stabilize.nvim",
        config = function()
            require("stabilize").setup()
        end,
    },

    -- cheatsheets
    {
        "sudormrfbin/cheatsheet.nvim",
        config = function()
            require("cheatsheet").setup()
        end,
    },

    -- cursorline modes
    {
        "mvllow/modes.nvim",
        config = function()
            require("modes").setup({
                colors = {
                    copy = "#f5c359",
                    delete = "#c75c6a",
                    insert = "#669fa8",
                    visual = "#9745be",
                },

                -- Cursorline highlight opacity
                line_opacity = 0.2,

                -- Highlight cursor
                set_cursor = false,

                -- Highlight in active window only
                focus_only = false,
            })
        end,
    },

    -- advanced text objects
    "wellle/targets.vim",

    -- remove trailing whitespace and extra empty lines at the end
    {
        "mcauley-penney/tidy.nvim",
        config = function()
            require("tidy").setup()
        end,
    },

    -- show colorcolumn but in virtual text
    {
        "lukas-reineke/virt-column.nvim",
        config = function()
            require("virt-column").setup()
        end,
    },

    -- plugin for easy browsing
    { "lalitmee/browse.nvim", lazy = true },

    -- plugin for surround operation
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end,
    },

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
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
            require("nvim-treesitter.configs").setup({
                textobjects = {
                    select = {
                        enable = true,
                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                },
            })
        end,
    },

    -- treesitter context
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup()
        end,
    },

    -- nvim notify
    "rcarriga/nvim-notify",

    -- substitute
    {
        "gbprod/substitute.nvim",
        lazy = true,
        config = function()
            require("substitute").setup()
        end,
    },

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
    {
        "jedrzejboczar/toggletasks.nvim",
        lazy = true,
        config = function()
            require("toggletasks").setup()
        end,
    },

    -- better sorting
    {
        "SQVe/sort.nvim",
        lazy = true,
        config = function()
            require("sort").setup()
        end,
    },

    -- better integration with system clipboard
    "ojroques/nvim-osc52",

    -- better folding
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            require("ufo").setup({
                provider_selector = function()
                    return { "treesitter", "indent" }
                end,
            })
        end,
    },

    -- better lsp diagnostics
    { "ErichDonGubler/lsp_lines.nvim", lazy = true },

    -- easy swapping of things
    { "mizlan/iswap.nvim" },

    -- better highlighting/filtering of todos etc. in comments
    {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup()
        end,
    },

    -- smart inverter for words
    {
        "nguyenvukhang/nvim-toggler",
        lazy = true,
        config = function()
            require("nvim-toggler").setup({
                remove_default_keybinds = true,
            })
        end,
    },

    -- autolist plugin for markdown
    {
        "gaoDean/autolist.nvim",
        ft = {
            "markdown",
            "text",
            "tex",
            "plaintex",
            "norg",
        },
        config = function()
            require("autolist").setup()

            vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
            vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
            -- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
            vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
            vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
            vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
            vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
            -- vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

            -- cycle list types with dot-repeat
            vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
            vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

            -- if you don't want dot-repeat
            -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
            -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

            -- functions to recalculate list on edit
            vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
            vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
            vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
            vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
        end,
    },
    -- plugin for fancy code screenshots
    {
        "mistricky/codesnap.nvim",
        build = "make build_generator",
        config = function()
            require("codesnap").setup({
                mac_window_bar = true,
                title = "",
                code_font_family = "FiraCode Nerd Font Mono",
                watermark_font_family = "Pacifico",
                watermark = "",
                bg_color = "#8877ff",
                breadcrumbs_separator = "/",
                has_breadcrumbs = true,
                has_line_number = true,
                show_workspace = false,
                save_path = "/Users/nmadnani/Desktop",
            })
        end,
    },

    -- plugin to support nim
    { "alaviss/nim.nvim", ft = "nim" },

    -- plugin for typos in files and directory names
    {
        "axieax/typo.nvim",
        config = function()
            require("typo").setup()
        end,
    },

    -- plugin for generating gitignore files
    { "wintermute-cell/gitignore.nvim" },

    --- conda env selector
    {
        "kmontocam/nvim-conda",
        dependencies = { "nvim-lua/plenary.nvim" },
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

    {
        "OXY2DEV/helpview.nvim",
        lazy = false, -- Recommended
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },

    {
        {
            "CopilotC-Nvim/CopilotChat.nvim",
            branch = "main",
            dependencies = {
                { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
                { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
            },
            build = "make tiktoken", -- Only on MacOS or Linux
            opts = {
                debug = false, -- Enable debugging
                -- See Configuration section for rest
            },
            -- See Commands section for default commands if you want to lazy load on them
        },
    },
    {
        "leath-dub/snipe.nvim",
        keys = {
            {
                "gb",
                function()
                    require("snipe").open_buffer_menu()
                end,
                desc = "Open Snipe buffer menu",
            },
        },
        opts = {},
    },
}
