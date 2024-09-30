return {
	"b0o/incline.nvim",
	event = "VeryLazy",
	priority = 1200,
	config = function()
		local devicons = require 'nvim-web-devicons'
		local helpers = require 'incline.helpers'
		require('incline').setup({
			window = {
				padding = 1,
				margin = { horizontal = 1, vertical = 1 },
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':.')
				if filename == '' then
					filename = '[No Name]'
				end
				local ft_icon, ft_color = devicons.get_icon_color(filename)
				local modified = vim.bo[props.buf].modified
				return {
					ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
					' ',
					{ filename, gui = modified and 'bold,italic' or 'bold' },
					' ',
					guibg = '#44406e',
				}
			end,
		})
	end,
}
