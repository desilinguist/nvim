-- Plugin management via vim.pack (Neovim 0.12+)

-- PackChanged hooks for build steps (must be defined BEFORE vim.pack.add)
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
        if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
        vim.cmd('TSUpdate')
    end
    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
        local dir = vim.fn.stdpath('data') .. '/site/pack/core/opt/telescope-fzf-native.nvim'
        vim.fn.system({ 'make', '-C', dir })
    end
    if name == 'codesnap.nvim' and (kind == 'install' or kind == 'update') then
        local dir = vim.fn.stdpath('data') .. '/site/pack/core/opt/codesnap.nvim'
        vim.fn.system({ 'make', '-C', dir })
    end
end })

vim.pack.add({
    -- Utility libraries (load first, others depend on these)
    'https://github.com/nvim-lua/popup.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/MunifTanjim/nui.nvim',
    'https://github.com/kevinhwang91/promise-async',
    'https://github.com/folke/snacks.nvim',

    -- Colorschemes (load early)
    'https://github.com/folke/tokyonight.nvim',
    'https://github.com/tiagovla/tokyodark.nvim',

    -- Treesitter
    'https://github.com/nvim-treesitter/nvim-treesitter',
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
    'https://github.com/nvim-treesitter/nvim-treesitter-context',

    -- Completion
    { src = 'https://github.com/saghen/blink.cmp', version = 'v1.*' },
    'https://github.com/giuxtaposition/blink-cmp-copilot',

    -- Snippets
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/rafamadriz/friendly-snippets',

    -- LSP
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
    'https://github.com/nvimtools/none-ls.nvim',
    'https://github.com/tamago324/nlsp-settings.nvim',
    'https://github.com/ray-x/lsp_signature.nvim',
    'https://github.com/b0o/SchemaStore.nvim',
    'https://github.com/j-hui/fidget.nvim',

    -- Telescope
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/LinArcX/telescope-env.nvim',
    'https://github.com/princejoogie/dir-telescope.nvim',
    'https://github.com/nvim-telescope/telescope-live-grep-args.nvim',
    'https://github.com/debugloop/telescope-undo.nvim',

    -- Git
    'https://github.com/lewis6991/gitsigns.nvim',

    -- UI
    'https://github.com/folke/which-key.nvim',
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/akinsho/bufferline.nvim',
    'https://github.com/moll/vim-bbye',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/akinsho/toggleterm.nvim',
    'https://github.com/lukas-reineke/indent-blankline.nvim',
    'https://github.com/antoinemadec/FixCursorHold.nvim',
    'https://github.com/NvChad/nvim-colorizer.lua',
    'https://github.com/mvllow/modes.nvim',
    'https://github.com/lukas-reineke/virt-column.nvim',
    'https://github.com/SmiteshP/nvim-navic',
    'https://github.com/rcarriga/nvim-notify',
    'https://github.com/stevearc/dressing.nvim',
    'https://github.com/leath-dub/snipe.nvim',
    'https://github.com/PHSix/faster.nvim',
    'https://github.com/luukvbaal/stabilize.nvim',
    'https://github.com/axkirillov/hbac.nvim',
    'https://github.com/OXY2DEV/markview.nvim',
    'https://github.com/folke/trouble.nvim',

    -- Text manipulation
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/windwp/nvim-ts-autotag',
    'https://github.com/numToStr/Comment.nvim',
    'https://github.com/kylechui/nvim-surround',
    'https://github.com/mcauley-penney/tidy.nvim',
    'https://github.com/gbprod/substitute.nvim',
    'https://github.com/roobert/search-replace.nvim',
    'https://github.com/SQVe/sort.nvim',
    'https://github.com/wellle/targets.vim',
    'https://github.com/nguyenvukhang/nvim-toggler',
    'https://github.com/gaoDean/autolist.nvim',

    -- Folding
    'https://github.com/kevinhwang91/nvim-ufo',

    -- Sessions
    'https://github.com/olimorris/persisted.nvim',

    -- Code screenshots
    { src = 'https://github.com/mistricky/codesnap.nvim', version = 'v2.0.0-beta.17' },

    -- Misc
    'https://github.com/axieax/typo.nvim',
    'https://github.com/wintermute-cell/gitignore.nvim',
    'https://github.com/ojroques/nvim-osc52',
    'https://github.com/jedrzejboczar/toggletasks.nvim',
    'https://github.com/ziontee113/color-picker.nvim',
    'https://github.com/folke/todo-comments.nvim',

    -- Copilot
    'https://github.com/zbirenbaum/copilot.lua',

    -- Neovim tips
    'https://github.com/saxon1964/neovim-tips',

    -- Claude Code
    'https://github.com/snirt/claudecode.nvim',
})

-------------------------------------------------------------------------------
-- Plugin configurations
-------------------------------------------------------------------------------

-- Tokyonight
require("tokyonight").setup({
    style = "night",
    styles = {
        functions = { italic = true },
    },
    on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
    end,
})

-- Tokyodark
require("tokyodark").setup({})

-- Treesitter
local treesitter = require("nvim-treesitter")
treesitter.setup()
treesitter.install({ 'awk', 'bash', 'bibtex', 'c', 'c_sharp', 'clojure', 'cmake', 'comment', 'commonlisp', 'cpp', 'css', 'csv', 'diff', 'disassembly', 'dockerfile', 'dot', 'doxygen', 'dtd', 'fish', 'fortran', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore', 'gnuplot', 'go', 'gpg', 'haskell', 'hcl', 'html', 'http', 'ini', 'java', 'javascript', 'jq', 'jsdoc', 'json', 'json5', 'jsonnet', 'julia', 'kotlin', 'llvm', 'lua', 'luadoc', 'make', 'markdown', 'markdown_inline', 'matlab', 'mermaid', 'nim', 'nim_format_string', 'nix', 'objc', 'objdump', 'pascal', 'passwd', 'pem', 'perl', 'php', 'php_only', 'phpdoc', 'printf', 'properties', 'pymanifest', 'python', 'r', 'readline', 'regex', 'requirements', 'rst', 'ruby', 'rust', 'scss', 'sql', 'ssh_config', 'tcl', 'terraform', 'tmux', 'todotxt', 'toml', 'tsv', 'typescript', 'vim', 'vimdoc', 'xml', 'yaml', 'zig' })

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'python', 'lua', 'json' },
    callback = function()
        vim.treesitter.start()
    end
})

require("nvim-treesitter-textobjects").setup({
    select = {
        lookahead = true,
        selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
        },
        include_surrounding_whitespace = false,
    },
    move = {
        set_jumps = true,
    },
})

vim.keymap.set({"x", "o"}, "af", function()
    require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({"x", "o"}, "if", function()
    require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({"x", "o"}, "ac", function()
    require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({"x", "o"}, "ic", function()
    require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end)
vim.keymap.set({"n", "x", "o"}, "]m", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({"n", "x", "o"}, "]]", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({"n", "x", "o"}, "]o", function()
    require("nvim-treesitter-textobjects.move").goto_next_start({"@loop.inner", "@loop.outer"}, "textobjects")
end)
vim.keymap.set({"n", "x", "o"}, "]M", function()
    require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({"n", "x", "o"}, "[m", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({"n", "x", "o"}, "[[", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)

-- Treesitter context
require("treesitter-context").setup()

-- Which-key
require("which-key").setup({ preset = "classic" })
require("which-key").add({
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
        "<cmd>lua vim.pack.update()<cr>",
        desc = "Plugin Update",
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
        "<cmd>checkhealth lsp<cr>",
        desc = "Info",
    },
    {
        "<leader>lI",
        "<cmd>Mason<cr>",
        desc = "Mason",
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

    -- Neovim tips
    { "<leader>nt", group = "Neovim Tips" },
    { "<leader>nto", ":NeovimTips<CR>",       desc = "Neovim tips" },
    { "<leader>ntr", ":NeovimTipsRandom<CR>", desc = "Show random tip" },
    { "<leader>nte", ":NeovimTipsEdit<CR>",   desc = "Edit your tips" },
    { "<leader>nta", ":NeovimTipsAdd<CR>",    desc = "Add your tip" },
    { "<leader>ntp", ":NeovimTipsPdf<CR>",    desc = "Open tips PDF" },

    -- Claude Code
    { "<leader>a",  nil,                              desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", function() vim.cmd("ClaudeCodeAdd " .. vim.fn.expand("%")) end, desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
    { "<leader>an", "<cmd>ClaudeCodeNew<cr>",        desc = "New Claude session" },
    { "<leader>al", "<cmd>ClaudeCodeSessions<cr>",   desc = "List Claude sessions" },
})

-- Buffer-local mapping for tree filetypes
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
    callback = function(ev)
        vim.keymap.set('n', '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>',
            { buffer = ev.buf, desc = "Add file" })
    end,
})

-- NvimTree
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
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                },
            },
        },
    },
})

-- Comment
require("Comment").setup()

-- Gitsigns
require("gitsigns").setup()

-- Fidget
require("fidget").setup()

-- Indent blankline
require("ibl").setup()

-- Colorizer
require("colorizer").setup()

-- Persisted (sessions)
require("persisted").setup({
    autoload = true,
    autosave = true,
    branch_separator = "_",
    before_save = function()
        vim.cmd("NvimTreeClose")
    end,
})

-- Stabilize
require("stabilize").setup()

-- Modes (cursorline)
require("modes").setup({
    colors = {
        copy = "#f5c359",
        delete = "#c75c6a",
        insert = "#669fa8",
        visual = "#9745be",
    },
    line_opacity = 0.2,
    set_cursor = false,
    focus_only = false,
})

-- Tidy
require("tidy").setup()

-- Virt-column
require("virt-column").setup()

-- Nvim-surround
require("nvim-surround").setup({})

-- Faster.nvim
vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_gj)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_gk)", { noremap = false, silent = true })

-- Substitute
require("substitute").setup()

-- Color picker
require("color-picker")

-- Toggletasks
require("toggletasks").setup()

-- Sort
require("sort").setup()

-- UFO (folding)
require("ufo").setup({
    provider_selector = function()
        return { "treesitter", "indent" }
    end,
})

-- Todo comments
require("todo-comments").setup()

-- Nvim toggler
require("nvim-toggler").setup({
    remove_default_keybinds = true,
})

-- Autolist (markdown)
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown', 'text', 'tex', 'plaintex', 'norg' },
    once = true,
    callback = function()
        require("autolist").setup()

        vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
        vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
        vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
        vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
        vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
        vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
        vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })
        vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
        vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
    end,
})

-- Codesnap
require("codesnap").setup({
    snapshot_config = {
        watermark = {
            content = "",
        },
        background = "#00000000",
    },
})

-- Typo
require("typo").setup()

-- Search-replace
require("search-replace").setup({
    default_replace_single_buffer_options = "gcI",
    default_replace_multi_buffer_options = "egcI",
})

-- Snacks
require("snacks").setup({
    bigfile = { enabled = true },
})

-- Copilot
require("copilot").setup()

-- Dir-telescope
require("dir-telescope").setup({
    hidden = false,
    respect_gitignore = true,
})

-- Hbac
require("hbac").setup()

-- Trouble
require("trouble").setup()

-- Snipe
require("snipe").setup()
vim.keymap.set("n", "gb", function()
    require("snipe").open_buffer_menu()
end, { desc = "Open Snipe buffer menu" })

-- Neovim tips
require("neovim_tips").setup({
    daily_tip = 0,
    bookmark_symbol = "🌟 ",
})

-- Claude Code
require("claudecode").setup()
