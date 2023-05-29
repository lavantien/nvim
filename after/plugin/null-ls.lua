local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

local sources = {
	formatting.dart_format,
	formatting.zigfmt,
	--formatting.nimpretty, -- not supported by the LS
	formatting.nixfmt,
	formatting.nginx_beautifier,
	--formatting.clang_format, -- shadowing jdtls
	formatting.prettierd,

	diagnostics.dotenv_linter,
	diagnostics.checkmake,
	diagnostics.clang_check,

	actions.refactoring,
	actions.gitsigns,
}

--local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = sources,

	--[==[
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
				end,
				--[[
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
                --]]
			})
		end
	end,
    --]==]
})
