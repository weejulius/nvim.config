return {
  "folke/noice.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = false,
      },
    },
    routes = {
      {
        filter = {
          any = {
            { error = true, find = "error drawing label for" },
            { error = true, find = "to set cursor for log window" },
          },
        },
        opts = { skip = true },
      },
    },
    presets = {
      lsp_doc_border = true,
    },
  },
}
