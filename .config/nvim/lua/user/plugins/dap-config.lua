-- dap ui
require("dapui").setup()

-- dap virtual text
require("nvim-dap-virtual-text").setup()

-- -- dap python
-- local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")

-- dap c/c++
require("mason").setup()
require("mason-nvim-dap").setup {
  ensure_installed = { "python", "codelldb" },
  handlers = {}, -- sets up dap in the predefined manner
}

-- dap config (to auto open/close dapui)
local dap, dapui = require "dap", require "dapui"
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- dap signs
vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointDisabled", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointUnverified", { text = "", texthl = "", linehl = "", numhl = "" })
