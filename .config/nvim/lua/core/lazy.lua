-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
    { import = "plugins.keybinding" },
    { import = "plugins.lsp" },
    { import = "plugins.motion" },
    { import = "plugins.session" },
    { import = "plugins.windows" },
  },
  -- automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false
  },
  change_detection = {
    notify = false
  }
})

vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
