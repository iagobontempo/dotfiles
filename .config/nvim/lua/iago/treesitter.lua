vim.treesitter.language.register("typescript", "typescript")
vim.treesitter.language.register("typescript", "typescriptreact")
vim.treesitter.language.register("go", "go")
vim.treesitter.language.register("rust", "rust")
vim.treesitter.language.register("html", "html")
vim.treesitter.language.register("markdown", "markdown")

-- Enable Tree-sitter highlighting (global)

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "go", "rust", "html", "markdown" },
  callback = function(args)
    vim.treesitter.start(args.buf)
  end,
})

