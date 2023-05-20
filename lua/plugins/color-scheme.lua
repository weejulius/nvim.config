return {
  {
    "olivercederborg/poimandres.nvim",
    enabled = true,
  },
  {
    "nocksock/bloop.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },
  { "marko-cerovac/material.nvim" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "rebelot/kanagawa.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "sainnhe/everforest" },
  {
    "morhetz/gruvbox",
    config = function()
      vim.cmd("set background=light")
    end,
  },
  --{ "sainnhe/sonokai" },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "mcchrish/zenbones.nvim",
    config = function()
      vim.g.zenbones = {
        solid_line_nr = true,
        solid_float_border = true,
        darken_cursor_line = 25,
        darken_comments = 14,
        darken_noncurrent_window = true,
      }
      local lush = require("lush")
      local base = require("zenbones")

      -- Create some specs
      local specs = lush.parse(function()
        return {
          TabLine({ base.TabLine, gui = "italic" }), -- setting gui to "italic"
        }
      end)
      -- Apply specs using lush tool-chain
      lush.apply(lush.compile(specs))
    end,
  },
  --{ "kartikp10/noctis.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-lotus", --"zenbones", --"noctis",
    },
  },
}
