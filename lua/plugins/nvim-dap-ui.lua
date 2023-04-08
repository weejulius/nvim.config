return {
  "rcarriga/nvim-dap-ui",
  keys = {
    { "<leader>c2", "<cmd>lua require('dapui').toggle()<CR>", desc = "flutter:debug-ui" },
    { "<leader>cb", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "flutter:toggle breakpoint" },
    {
      "<leader>cB",
      "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
      desc = "flutter:set breakpoint",
    },
    { "<leader>c.", "<cmd>lua require('dapui').eval()<CR>", desc = "flutter:eval expression", mode = "v" },
    { "<leader>c3", "<cmd>lua require('dap').continue()<CR>", desc = "debug:continue" },
    {
      "<leader>c4",
      "<cmd>lua require('dap').step_into()<CR>",
      desc = "debug:step into",
    },
    {
      "<leader>c5",
      "<cmd>lua require('dap').step_over(steppingGranularity:'instruction'})<CR>",
      desc = "debug:step over",
    },
    { "<leader>c6", "<cmd>lua require('dap').set_exception_breakpoints()<CR>", desc = "debug:exception breakpoint" },
  },
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    vim.fn.sign_define("DapBreakpoint", { text = "󰄴", texthl = "DapUIBreakpointsInfo", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapUIStop", linehl = "", numhl = "" })
    require("dapui").setup({
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.3,
            },
            {
              id = "breakpoints",
              size = 0.25,
            },
            {
              id = "stacks",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.2,
            },
          },
          position = "left",
          size = 40,
        },
        {
          elements = { {
            id = "repl",
            size = 1,
          } },
          position = "bottom",
          size = 10,
        },
      },
    })
  end,
}
