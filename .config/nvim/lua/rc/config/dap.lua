-- require("dap.ext.vscode").json_decode = require("json5").parse
vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "SignColumn", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = " ", texthl = "LspWarningText", linehl = "Visual", numhl = "Visual" })
require("dap").adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode",
  name = "lldb"
}
require("dap").adapters.cppdbg = {
  type = "executable",
  command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/OpenDebugAD7",
  id = "cppdbg",
  options = {
    detached = false
  },
}
require("dap").configurations.cpp = {
  {
    name = "Launch (lldb)",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
  {
    name = "Remote attach (8080)",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:8080",
    miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
  },
  {
    name = "Remote attach (8081)",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:8081",
    miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
  },
}
require("dap").configurations.c = require("dap").configurations.cpp
require("dap").configurations.rust = require("dap").configurations.cpp
if vim.fn.filereadable('.vscode/launch.json') then
  require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })
end
