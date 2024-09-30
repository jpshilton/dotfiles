return {
  'rhysd/git-messenger.vim',
  cmd = 'GitMessenger',
  -- stylua: ignore
  keys = {
    { '<Leader>gm', '<Plug>(git-messenger)', desc = 'Reveal commit under cursor'}
  },
  init = function()
    vim.g.git_messenger_include_diff = 'current'
    vim.g.git_messenger_no_default_mappings = true
    vim.g.git_messenger_floating_win_opts = { border = 'rounded' }
    vim.g.git_messenger_max_popup_height = math.ceil(vim.o.lines / 1.15)
  end,
}
