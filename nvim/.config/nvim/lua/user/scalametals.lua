-- LSP
vim.cmd[[
  augroup lsp
  au! 
  au FileType scala setlocal omnifun=v:lua.vim.lsp.omnifunc
  au FileType scala,sbt lua require("metals").initialize_or_attach({metals_config})
  augroup end
]]

-- Needed for symbol highlights to work correctly
vim.cmd[[
  hi! link LspReferenceText CursorColumn
  hi! link LspReferenceRead CursorColumn
  hi! link LspReferenceWrite CursorColumn
]]

-- LSP Setup
metals_config = require("metals").bare_config()

-- Custom Settings
metals_config.settings = {
  showImplicitArguments = true,
}

-- Overide default handler behavior
metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = { prefix = "" },
})

-- Status Bar
metals_config.init_options.statusBarProvider = "on"

-- Snippet Support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

metals_config.capabilities = capabilities

-- Should link to something to see your code lenses
vim.cmd[[hi! link LspCodeLens CursorColumn]]
-- Should link to something so workspace/symbols are highlighted
vim.cmd[[hi! link LspReferenceText CursorColumn]]
vim.cmd[[hi! link LspReferenceRead CursorColumn]]
vim.cmd[[hi! link LspReferenceWrite CursorColumn]]

-- Provides a niec little format command (:Format)
vim.cmd[[command! Format lua vim.lsp.buf.formatting()]]
