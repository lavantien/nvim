--[[
local custom_auto = require("lualine.themes.auto")
custom_auto.normal.c.bg = nil
custom_auto.insert.c.bg = nil
custom_auto.visual.c.bg = nil
custom_auto.replace.c.bg = nil
custom_auto.command.c.bg = nil
--]]

require("lualine").setup({
    options = {
        theme = 'tokyonight',
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
    },
})
