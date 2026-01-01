return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  -- Completion for `blink.cmp`
  -- dependencies = { "saghen/blink.cmp" },
  --
  --
  config = function()
    require("markview").setup({
      preview = { enable = false },
    })

    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>mt", "<CMD>Markview<CR>", { desc = "Toggles `markview` previews globally." })
    keymap.set("n", "<leader>ms", "<CMD>Markview splitToggle<CR>", { desc = "Toggles `splitview` for current buffer." })
  end,
}
