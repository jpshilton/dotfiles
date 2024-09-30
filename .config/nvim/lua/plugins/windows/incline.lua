return {
	"b0o/incline.nvim",
	event = "BufReadPre",
	priority = 1200,
	config = function()
		local devicons = require 'nvim-web-devicons'
		local helpers = require 'incline.helpers'
		require('incline').setup({
			window = {
				padding = 0,
				margin = {
					vertical = 0,
					horizontal = 1
				},
			 },
			hide = {
				cursorline = true
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":.")
				if vim.bo[props.buf].modified then
					filename = "[+] " .. filename
				end

				local icon, color = require("nvim-web-devicons").get_icon_color(filename)
				return { { icon, guifg = color }, { " " }, { filename } }
			end,
		})
	end,
}
