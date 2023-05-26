-- ensure order
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-nvim-dap").setup({
    ensure_installed = {
        'python',
        'delve',
        'chrome',
        'firefox',
        'php',
        'coreclr',
        'js',
        'corelldb',
        'bash',
        'javadbg',
        'javatest',
        'mock',
        'dart',
    },
    automatic_installation = true,
    handlers = {}
})
