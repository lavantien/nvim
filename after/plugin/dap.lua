require("dapui").setup()
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})
require("nvim-dap-virtual-text").setup()
require('dap-go').setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F6>', require 'dap'.step_over)
vim.keymap.set('n', '<F7>', require 'dap'.step_into)
vim.keymap.set('n', '<F8>', require 'dap'.step_out)
vim.keymap.set('n', '<F9>',
    function()
        require 'dap'.disconnect({ terminateDebuggee = true })
        require 'dap'.close()
    end)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>B',
    function()
        require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end)
vim.keymap.set('n', '<leader>lp',
    function()
        require 'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end)
vim.keymap.set('n', '<leader>E', require 'dap'.repl.open)
vim.keymap.set('n', '<leader>e', require 'dap-go'.debug_test)
