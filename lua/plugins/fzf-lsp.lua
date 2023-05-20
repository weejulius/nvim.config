return {
  "gfanto/fzf-lsp.nvim",
  keys = {
    {
      "<leader>s/",
      "<cmd>lua require('fzf-lua').live_grep({cwd = vim.fn.input('Directory:','std')})<CR>",
      desc = "Live grep for directory",
    },
  },
  dependencies = { "ibhagwan/fzf-lua" },
  config = true,
}
