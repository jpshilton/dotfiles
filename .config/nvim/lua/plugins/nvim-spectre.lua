return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function () 
    local spectre = require('spectre')
    spectre.setup()

    vim.keymap.set('n', '<leader>S', spectre.toggle, { desc = "Toggle Spectre" })
    vim.keymap.set('n', '<leader>sw', function () spectre.open_visual({select_word=true}) end, { desc = "Search current word" })
    vim.keymap.set('v', '<leader>sw', spectre.open_visual, { desc = "Search current word" })
    vim.keymap.set('n', '<leader>sp', function () spectre.open_file_search({select_word=true}) end, { desc = "Search on current file" })
  end,
}