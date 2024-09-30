vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

-- Package-manager
keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Open Lazy UI' })
keymap.set('n', '<leader>mx', '<cmd>LazyExtras<CR>', { desc = 'Open Plugin Extras' })

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set({ "n", "v" }, "<C-S-s>", "<cmd>w<CR>", { desc = "Save current buffer" })
keymap.set({ "n", "v" }, "<leader>;", "<cmd>w<CR>", { desc = "Save current buffer" })
keymap.set({ "n", "v" }, "<leader>", "<cmd>wa<CR>", { desc = "Save current buffer" })

-- Paste non-linewise text above or below current line, see https://stackoverflow.com/a/1346777/6064933
keymap.set("n", "<leader>p", "m`o<ESC>p``", { desc = "paste below current line" })
keymap.set("n", "<leader>P", "m`O<ESC>p``", { desc = "paste above current line" })

-- Quit all opened buffers
keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })

keymap.set("n", "<leader><space>", "a<space><Esc>", { desc = "Space after" })

-- Easier line-wise movement
keymap.set('n', 'gh', 'g^', { desc = 'Jump to first screen character' })
keymap.set('n', 'gl', 'g$', { desc = 'Jump to last screen character' })

-- Navigation in command line
keymap.set('c', '<C-h>', '<Home>')
keymap.set('c', '<C-l>', '<End>')
keymap.set('c', '<C-f>', '<Right>')
keymap.set('c', '<C-b>', '<Left>')

-- Diagnostic movement
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	local severity_int = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity_int })
	end
end
keymap.set('n', '<Leader>ce', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
keymap.set('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
keymap.set('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
keymap.set('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
keymap.set('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
keymap.set('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
keymap.set('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- Move selected line(s) vertically and auto-indent
keymap.set('n', '<M-Up>', '<cmd>move-2<CR>==', { silent = true, desc = 'Move line up' })
keymap.set('n', '<M-Down>', '<cmd>move+<CR>==', { silent = true, desc = 'Move line down' })
keymap.set('x', '<M-Up>', ":move'<-2<CR>gv=gv", { silent = true, desc = 'Move selection up' })
keymap.set('x', '<M-Down>', ":move'>+<CR>gv=gv", { silent = true, desc = 'Move selection down' })

-- Insert blank lines
keymap.set('n', '<S-Up>', 'O<Esc>', { silent = true, desc = 'Blankline before current' })
keymap.set('n', '<S-Down>', 'o<Esc>k', { silent = true, desc = 'Blankline after current' })
keymap.set('n', '<S-Left>', 'i<CR><Esc>', { silent = true, desc = 'Blankline before cursor' })
keymap.set('n', '<S-Right>', 'a<CR><Esc>', { silent = true, desc = 'Blankline after cursor' })
