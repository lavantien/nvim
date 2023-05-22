local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

local sources = {
	formatting.gofumpt,
	formatting.goimports_reviser,
	formatting.dart_format,
	formatting.rustfmt,
	formatting.autopep8,
	formatting.htmlbeautifier,
	--formatting.xmlformatter,
	formatting.stylua,
	formatting.yamlfmt,
	formatting.shfmt,
	formatting.sqlfmt,
	formatting.nixfmt,
	formatting.nginx_beautifier,
	formatting.prettier,
	formatting.clang_format,
	formatting.markdownlint,
	formatting.eslint,

	diagnostics.golangci_lint,
	diagnostics.protolint,
	diagnostics.hadolint,
	diagnostics.yamllint,
	diagnostics.markdownlint,
	diagnostics.terraform_validate,
	diagnostics.eslint,
	diagnostics.flake8,
	--diagnostics.dotenv_lint,
	--diagnostics.checkmate,
	diagnostics.clang_check,
	--diagnostics.spellcheck,

	actions.gomodifytags,
	actions.impl,
	actions.eslint,
	actions.refactoring,
	actions.shellcheck,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = sources,

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
				--[=====[
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
                --]=====]
			})
		end
	end,
})
