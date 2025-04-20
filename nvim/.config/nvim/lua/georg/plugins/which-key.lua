return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function ()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- you config here
    -- leaving empy uses default settings
  }
}
