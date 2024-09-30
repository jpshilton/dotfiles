return {
  'folke/zen-mode.nvim',
  cmd = 'ZenMode',
  keys = {
    { '<Leader>zz', '<cmd>ZenMode<CR>', noremap = true, desc = 'Zen Mode' },
  },
  opts = {
    plugins = {
      twilight = { enabled = true },
      gitsigns = { enabled = true },
      tmux = { enabled = vim.env.TMUX ~= nil },
    },
    on_open = function(win)
      require('incline').disable()
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()
      require('incline').enable()
    end,
  },
}
