return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = function()
    -- Get the current nvim width
    local width = vim.o.columns

    -- Decide the pane based on terminal width
    local terminal_pane = width < 100 and 2 or 1

    -- Custom terminal opening keymap
    vim.keymap.set("n", "<C-t>", function()
      Snacks.terminal.toggle()
    end, { desc = "Toggle terminal", noremap = true, silent = true })
    vim.keymap.set("t", "<C-t>", function()
      Snacks.terminal.toggle()
    end, { desc = "Toggle close the terminal" })

    return {
      dashboard = {
        width = 50,
        row = nil,
        col = nil,
        preset = {
          pick = nil,
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Live Grep Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "w", desc = "Restore Session", action = "<cmd>SessionRestore<CR>" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          {
            section = "terminal",
            cmd = "pokemon-colorscripts -n giratina -s --no-title; sleep .1",
            random = 100,
            pane = terminal_pane,
            indent = 3,
            height = 17,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
      image = {}, -- image display
      terminal = {}, -- vscode style terminal panes
    }
  end,
}
