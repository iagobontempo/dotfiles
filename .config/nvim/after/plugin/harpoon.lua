local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-m>", mark.add_file)
vim.keymap.set("n", "<C-f>", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>mf", mark.add_file)
vim.keymap.set("n", "<leader>fm", ui.toggle_quick_menu)


