return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, o)
    local overseer = require("overseer")
    table.insert(o.sections.lualine_x, 1, {
      "overseer",
      -- label = "", -- Prefix for task counts
      -- colored = true, -- Color the task icons and counts
      symbols = {
        [overseer.STATUS.FAILURE] = "",
        [overseer.STATUS.CANCELED] = "",
        [overseer.STATUS.SUCCESS] = "",
        [overseer.STATUS.RUNNING] = "",
      },
      -- unique = false, -- Unique-ify non-running task count by name
      -- name = nil, -- List of task names to search for
      -- name_not = false, -- When true, invert the name search
      -- status = nil, -- List of task statuses to display
      -- status_not = false, -- When true, invert the status search
    })
  end,
}
