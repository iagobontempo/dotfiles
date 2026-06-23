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

require("lazy").setup({
    -- COLORS
    {
        "Shadorain/shadotheme",
        lazy = false,
        priority = 1000,
        name = "shado",
        config = function()
            vim.cmd([[colorscheme shado]])
        end,
    },

    -- LSP AND TREESITTER
    { "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" } },
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig", tag = 'v1.8.0', pin = true },
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",

            -- Snippets
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",

        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "javascript", "typescript", "lua", "rust", "toml", "yaml", "go", "html" },
                sync_install = false,
                highlight = {
                    enable = true,
                },
                indent = { enable = true },
            })
        end
    },

    -- OTHER STUFF
    "theprimeagen/harpoon",
    "tpope/vim-fugitive",
    "sindrets/diffview.nvim",
    "lewis6991/gitsigns.nvim",
    "preservim/nerdcommenter",
    "folke/todo-comments.nvim",
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
    },
    "voldikss/vim-floaterm",
    "nvim-lualine/lualine.nvim",

    -- Hides .env and secret files
    {
        "laytan/cloak.nvim",
        opts = {
            patterns = {
                {
                    file_pattern = ".env*",
                    cloak_pattern = "=.+",
                    replace = nil,
                },
                {
                    file_pattern = "auth.json",
                    cloak_pattern = ":.+",
                    replace = nil,
                },
            },
        },
    },

    -- Request Client
    {
        "mistweaverco/kulala.nvim",
        ft = { "http", "rest" },
        opts = {
            global_keymaps = false,
        },
    },
})
