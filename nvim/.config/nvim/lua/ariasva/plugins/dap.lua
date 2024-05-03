local dap, dapui = require("dap"), require("dapui")

require("mason-nvim-dap").setup({
    ensure_installed = { "python" }
})

require('dap-python').setup(
    vim.fn.stdpath("data") .. "\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe"
)

dapui.setup()
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
