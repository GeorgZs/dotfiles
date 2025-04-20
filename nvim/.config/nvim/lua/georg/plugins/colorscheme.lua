return {
  {
    -- https://github.com/sainnhe/sonokai
      'sainnhe/sonokai',
      lazy = false,
      priority = 1000,
      config = function()
        local transparent = true
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.

        vim.g.sonokai_enable_italic = true
        vim.cmd.colorscheme('sonokai')
      end
    }
}
