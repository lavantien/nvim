local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.extend_cmp()

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({
		buffer = bufnr,
		preserve_mapping = false,
	})
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "<C-f>", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>a", function()
		vim.lsp.buf.code_action()
	end, opts)
	lsp.buffer_autoformat()
end)

--[[
require('lspconfig').jdtls.setup({
  on_attach = function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
	lsp.buffer_autoformat()
  end
})

lsp.set_server_config({
	single_file_support = false,
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
			completion = {
				completionItem = {
					snippetSupport = true,
					resolveSupport = {
						properties = {
							"documentation",
							"detail",
							"additionalTextEdits",
						},
					},
				},
			},
		},
	},
})
--]]

lsp.setup()

local cmp = require("cmp")

cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping.complete(),
	},
})

vim.diagnostic.config({
	virtual_text = true,
})
