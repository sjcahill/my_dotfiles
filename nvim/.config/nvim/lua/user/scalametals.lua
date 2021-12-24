metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"
vim.cmd[[
  augroup lsp
  au! 
  au FileType scala,sbt lua require("metals").initialize_or_attach({metals_config})
  augroup end
]]

