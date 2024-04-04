require("neotest").setup({
    adapters = {
        require("neotest-python")({
            python = ".venv/Scripts/python.exe",
            dap = { justMyCode = false },
            args = { "--log-level", "DEBUG" },
            runner = "pytest"
        })
    }
})
