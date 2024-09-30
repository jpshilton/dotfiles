return {
  {
    'echasnovski/mini.files',
    version = '*',
    config = function()
      local mf = require('mini.files')
      mf.setup()

      vim.keymap.set("n", "<leader>ed", mf.open, { desc = "Open Mini.Files" })
    end
  },
  {
    'echasnovski/mini.clue',
    version = '*',
    config = function()
      local miniclue = require('mini.clue')
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },
        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
          { mode = 'n', keys = '<leader>c', desc = '+Code Actions' },
          { mode = 'n', keys = '<leader>e', desc = '+Explorer' },
          { mode = 'n', keys = '<leader>f', desc = '+Find' },
          { mode = 'n', keys = '<leader>g', desc = '+GoTo' },
          { mode = 'n', keys = '<leader>h', desc = '+Git' },
          { mode = 'n', keys = '<leader>s', desc = '+Splits' },
          { mode = 'n', keys = '<leader>t', desc = '+Tabs' },
          { mode = 'n', keys = '<leader>w', desc = '+Sessions' },
          { mode = 'n', keys = '<leader>x', desc = '+Diagnostics' },
        },
        window = {
          config = {
            width = 'auto'
          },
          delay = 600
        }
      })
    end,
  }
}
