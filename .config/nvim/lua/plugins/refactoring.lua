return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local refactoring = require("refactoring")
    refactoring.setup()

    vim.keymap.set("n", "<leader>rbf", function() refactoring.refactor('Extract Block To File') end, { desc = "Extract Block To File" })
  end
}
