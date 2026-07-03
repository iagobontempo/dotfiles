vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Allow to easily move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Allow usage of TAB to change between windows
vim.keymap.set("n", "<Tab>", "<C-w>w")

-- Allow going back with jumplist (bug on some terminals)
vim.keymap.set("n", "<C-I>", "<C-I>", { noremap = true })

-- Allow to run through the QuickFixList
vim.keymap.set("n", "]]", "<cmd>cnext<CR>", { silent = true })
vim.keymap.set("n", "[[", "<cmd>cprev<CR>", { silent = true })


-- Show diagnostics
vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float)
-- Allow to find diagnostics and auto open full floating description (needs custom function to run)
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true})
end)
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end)

-- Allow copy path
vim.keymap.set("n", "<leader>pa", ':let @+ = expand("%:p")<CR>', { desc = "Copy absolute path" })
vim.keymap.set("n", "<leader>pr", ':let @+ = expand("%")<CR>', { desc = "Copy relative path" })
