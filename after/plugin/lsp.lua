local lsp = require("lsp-zero")

lsp.preset({
	name = "recommended",
	call_servers = "global",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
})

lsp.ensure_installed({
	"jsonls",
	"yamlls",
	"sqlls",
	"pyright",
	"marksman",
	"jdtls",
	"html",
	"helm_ls",
	"graphql",
	"gopls",
	"dockerls",
	"docker_compose_language_service",
	"cssls",
	"clangd",
	"bashls",
	"rust_analyzer",
	"lua_ls",
	"eslint",
	"tsserver",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.on_attach(function()
	lsp.default_keymaps({ buffer = bufnr })

	local opts = { buffer = bufnr }

	vim.keymap.set("n", "<C-f>", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>a", function()
		vim.lsp.buf.code_action()
	end, opts)
end)

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

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["ansible-language-server"] = { "yaml.ansible", "yml", "yaml", "cfg" },
		["asm_lsp"] = { "asm", "nasm", "s", "S" },
		["bash-language-server"] = { "sh", "bash" },
		["bufls"] = { "proto" },
		["clangd"] = { "c", "cpp", "h", "hpp" },
		["codeql"] = { "ql" },
		["vscode-css-language-server"] = { "css", "scss" },
		["docker-compose-langserver"] = { "yaml", "yml" },
		["docker-langserver"] = { "dockerfile" },
		["vscode-eslint-language-server"] = { "js", "jsx", "ts", "tsx" },
		["golangci-lint-langserver"] = { "go", "mod", "work", "sum" },
		["gopls"] = { "go", "mod", "work", "sum" },
		["graphql-lsp"] = { "graphql" },
		["helm_ls"] = { "helm*", "yaml", "yml" },
		["vscode-html-language-server"] = { "html" },
		["java-language-server"] = { "java" },
		["jdtls"] = { "java" },
		["vscode-json-language-server"] = { "json" },
		["ltex-ls"] = { "latex" },
		["lua-language-server"] = { "lua" },
		["marksman"] = { "md" },
		["nginx-language-server"] = { "conf" },
		["nimls"] = { "nim" },
		["phpactor"] = { "php" },
		["pyright-langserver"] = { "py" },
		["rnix-lsp"] = { "toml", "cfg" },
		["ruby-lsp"] = { "rb" },
		["rust_analyzer"] = { "rs" },
		["sql-language-server"] = { "sql" },
		["svelteserver"] = { "svelte" },
		["tailwindcss-language-server"] = { "html", "jsx", "tsx" },
		["terraform-ls"] = { "tf", "tf.module" },
		["typescript-language-server"] = { "ts", "tsx" },
		["vim-language-server"] = { "vim" },
		["vue-language-server"] = { "vue", "ts", "ext" },
		["yaml-language-server"] = { "yaml", "yml" },
		["zls"] = { "zig" },
	},
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
