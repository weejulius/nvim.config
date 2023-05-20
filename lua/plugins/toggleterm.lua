function term_flutter_buildrunner()
  local Terminal = require("toggleterm.terminal").Terminal
  local br = Terminal:new({
    cmd = "flutter pub run build_runner watch --delete-conflicting-outputs ",
    direction = "tab",
    close_on_exit = false,
    hidden = true,
    count = 1,
    dir = "git_dir",
  })

  br:toggle()
end

return {
  "akinsho/toggleterm.nvim",
  lazy = false,
  enabled = true,
  version = "*",
  keys = {
    { "<leader>c0", "<cmd>lua term_flutter_buildrunner()<CR>", desc = "flutter:build runner" },
  },
  config = true,
}
