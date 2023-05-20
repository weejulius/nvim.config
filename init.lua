-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/code/snips" } })
vim.cmd("hi NeoTreeTitleBar guifg=#999999 guibg=#171922")
vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])
