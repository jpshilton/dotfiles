return  {
  'Shatur/neovim-session-manager',
  config = function()
    require('session_manager').setup {
      autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
      autosave_last_session = true,
    }

    vim.keymap.set("n", "<leader>wr", "<cmd>SessionManager load_last_session<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    vim.keymap.set("n", "<leader>ws", "<cmd>SessionManager save_current_session<CR>", { desc = "Save session for auto session root dir" }) --
  end,
}
