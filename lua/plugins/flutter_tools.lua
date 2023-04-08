return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap",
  },
  ft = "dart",
  opts = {
    dev_log = {
      enabled = true,
    },
    closing_tags = {
      enabled = true,
    },
    dev_tools = {
      autostart = false,
    },
    lsp = {
      color = { enabled = true },
    },
    debugger = { -- integrate with nvim dap + install dart code debugger
      enabled = true,
      run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
      -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
      -- see |:help dap.set_exception_breakpoints()| for more info
      exception_breakpoints = {},
      register_configurations = function()
        require("dap").configurations.dart = {
          {
            type = "dart",
            request = "launch",
          },
        }
      end,
    },
  },
}
