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
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- DEFAULT LSP CONFIGURATIONS
    "neovim/nvim-lspconfig",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "javascript",
                "typescript",
                "go",
                "rust",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
    },

    -- AUTO COMPLETION
    {
      'saghen/blink.cmp',
      dependencies = { 'rafamadriz/friendly-snippets' },
      version = '1.*',
      opts = {
        keymap = { 
            preset = 'default',
            ["<CR>"] = {
                "accept",
                "fallback"
            },
        },
        appearance = {
          nerd_font_variant = 'mono'
        },
        completion = { documentation = { auto_show = false } },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
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
