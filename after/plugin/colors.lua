require("tokyonight").setup({
    -- rose-pine
    disable_background = true,
    disable_float_background = true,
    -- tokyonight
    transparent = true,
    on_highlights = function(hl, c)
        local textColor = c.fg_dark
        hl.TelescopeNormal = {
            -- bg = c.bg_dark,
            bg = 'none',
            fg = textColor,
        }
        hl.TelescopeBorder = {
            -- bg = c.bg_dark,
            bg = 'none',
            fg = textColor,
        }
        hl.TelescopePromptNormal = {
            -- bg = prompt,
            bg = 'none',
            fg = textColor,
        }
        hl.TelescopePromptBorder = {
            -- bg = prompt,
            bg = 'none',
            fg = textColor,
        }
        hl.TelescopePromptTitle = {
            -- bg = prompt,
            bg = 'none',
            fg = textColor,
        }
        hl.TelescopePreviewTitle = {
            -- bg = c.bg_dark,
            bg = 'none',
            fg = textColor,
        }
        hl.TelescopeResultsTitle = {
            -- bg = c.bg_dark,
            bg = 'none',
            fg = textColor,
        }
    end,
})

function ColorMyPencils(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
