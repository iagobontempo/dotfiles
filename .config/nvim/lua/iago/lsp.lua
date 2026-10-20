vim.lsp.config('vtsls', {
  cmd = { 'vtsls', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'package.json', 'tsconfig.json', '.git', 'bun.lockb', 'bun.lock',},
  -- Optional adjustments
  init_options = {
    hostInfo = "neovim"
  }
})

-- 2. Enable the server
vim.lsp.enable('vtsls')
--vim.lsp.enable('ts_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('lua_ls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('gopls')

