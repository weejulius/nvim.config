return {
  "rcarriga/nvim-dap-ui",
  keys = {
    { "<leader>c2", "<cmd>lua require('dapui').toggle()<CR>", desc = "flutter:debug-ui" },
    { "<leader>cb", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "flutter:toggle breakpoint" },
    {
      "<leader>cB",
      "<cmd>lua require('dap').set_breakpoint(vim.fn.input('condition:'))<CR>",
      desc = "flutter:set breakpoint condition",
    },
    { "<leader>c.", "<cmd>lua require('dapui').eval()<CR>", desc = "flutter:eval expression", mode = { "v", "n" } },
    { "<leader>c3", "<cmd>lua require('dap').continue()<CR>", desc = "debug:continue" },
    {
      "<leader>c4",
      "<cmd>lua require('dap').step_into()<CR>",
      desc = "debug:step into",
    },
    {
      "<leader>c5",
      "<cmd>lua require('dap').step_over()<CR>",
      desc = "debug:step over",
    },
    { "<leader>c6", "<cmd>lua require('dap').set_exception_breakpoints()<CR>", desc = "debug:exception breakpoint" },
    { "<leader>c7", "<cmd>lua require('dap').terminate()<CR>", desc = "debug:terminate" },
  },
  dependencies = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text" },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end
    vim.fn.sign_define("DapBreakpoint", { text = "󰄴", texthl = "DapUIBreakpointsInfo", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapUIStop", linehl = "", numhl = "" })
    require("dap").adapters.lldb = {
      type = "executable",
      command = "/usr/local/Cellar/llvm/16.0.2/bin/lldb-vscode",
      name = "lldb",
    }
    require("dap").configurations.zig = {
      {
        type = "lldb",
        request = "launch",
        name = "Debug",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        -- program = "${workspaceFolder}/zig-out/bin/zig_demo",
        args = {},
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        runInTerminal = true,
      },
    }
    require("dapui").setup({
      -- layouts = {
      --   {
      --     elements = {
      --       {
      --         id = "scopes",
      --         size = 0.3,
      --       },
      --       {
      --         id = "breakpoints",
      --         size = 0.25,
      --       },
      --       {
      --         id = "stacks",
      --         size = 0.25,
      --       },
      --       {
      --         id = "watches",
      --         size = 0.2,
      --       },
      --     },
      --     position = "left",
      --     size = 40,
      --   },
      --   {
      --     elements = { {
      --       id = "repl",
      --       size = 1,
      --     } },
      --     position = "bottom",
      --     size = 10,
      --   },
      -- },
    })
  end,
}
