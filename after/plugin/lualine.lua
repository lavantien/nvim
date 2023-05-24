local custom_auto = require("lualine.themes.auto")
custom_auto.normal.c.bg = nil

require("lualine").setup({
	options = {
		theme = custom_auto,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
})
