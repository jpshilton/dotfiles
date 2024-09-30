return {
  'echasnovski/mini.files',
  version = '*',
  config = function()
    local mf = require('mini.files')
    mf.setup()

    vim.keymap.set("n", "<leader>ed", mf.open, { desc = "Open Mini.Files" })
  end
}
