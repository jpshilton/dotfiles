return {
  "sindrets/winshift.nvim",
  config = function()
    require("winshift").setup({
      highlight_moving_win = true,  -- Highlight the window being moved
      focused_hl_group = "Visual",  -- The highlight group used for the moving window
      moving_win_options = {
        -- These are local options applied to the moving window while it's
        -- being moved. They are unset when you leave Win-Move mode.
        wrap = false,
        cursorline = false,
        cursorcolumn = false,
        colorcolumn = "",
      },
      keymaps = {
        disable_defaults = false, -- Disable the default keymaps
        win_move_mode = {
          ["h"] = "left",
          ["j"] = "down",
          ["k"] = "up",
          ["l"] = "right",
          ["H"] = "far_left",
          ["J"] = "far_down",
          ["K"] = "far_up",
          ["L"] = "far_right",
          ["<left>"] = "left",
          ["<down>"] = "down",
          ["<up>"] = "up",
          ["<right>"] = "right",
          ["<S-left>"] = "far_left",
          ["<S-down>"] = "far_down",
          ["<S-up>"] = "far_up",
          ["<S-right>"] = "far_right",
        },
      },
      ---A function that should prompt the user to select a window.
      ---
      ---The window picker is used to select a window while swapping windows with
      ---`:WinShift swap`.
      ---@return integer? winid # Either the selected window ID, or `nil` to
      ---   indicate that the user cancelled / gave an invalid selection.
      window_picker = function()
        return require("winshift.lib").pick_window({
          -- A string of chars used as identifiers by the window picker.
          picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          filter_rules = {
            -- This table allows you to indicate to the window picker that a window
            -- should be ignored if its buffer matches any of the following criteria.
            cur_win = true, -- Filter out the current window
            floats = true,  -- Filter out floating windows
            filetype = {},  -- List of ignored file types
            buftype = {},   -- List of ignored buftypes
            bufname = {},   -- List of vim regex patterns matching ignored buffer names
          },
          ---A function used to filter the list of selectable windows.
          ---@param winids integer[] # The list of selectable window IDs.
          ---@return integer[] filtered # The filtered list of window IDs.
          filter_func = nil,
        })
      end,
    })

    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<C-W><C-M>", "<cmd>WinShift<cr>", { desc = "WinShift: Start Win-Move mode" })
    keymap.set("n", "<C-W>", "<cmd>WinShift<cr>", { desc = "WinShift: Start Win-Move mode" })
    keymap.set("n", "<C-W>X", "<cmd>WinShift swap<cr>", { desc = "WinShift: Swap Two Windows" })
    keymap.set("n", "<C-M-H>", "<cmd>WinShift left<cr>", { desc = "WinShift: Move left" })
    keymap.set("n", "<C-M-J>", "<cmd>WinShift down<cr>", { desc = "WinShift: Move down" })
    keymap.set("n", "<C-M-K>", "<cmd>WinShift up<cr>", { desc = "WinShift: Move up" })
    keymap.set("n", "<C-M-L>", "<cmd>WinShift right<cr>", { desc = "WinShift: Move right" })
  end,
}
