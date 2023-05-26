local builtin = require("telescope.builtin")

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>vp", builtin.commands, {})
vim.keymap.set("n", "<leader>vk", builtin.keymaps, {})
vim.keymap.set("n", "<leader>vq", builtin.quickfix, {})
vim.keymap.set("n", "<leader>vj", builtin.jumplist, {})
vim.keymap.set("n", "<leader>vf", builtin.current_buffer_fuzzy_find, {})

vim.keymap.set("n", "<leader>lc", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>lw", builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, {})
vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>lt", builtin.lsp_type_definitions, {})
