local status, dap = pcall(require, "dap")
if (not status) then return end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "LspWarningText", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "LspWarningText", linehl = "Visual", numhl = "Visual" })
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode",
  name = "lldb"
}
dap.adapters.cppdbg = {
  type = "executable",
  command = os.getenv("HOME") .. "/.local/share/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
  id = "cppdbg",
  options = {
    detached = false
  },
}
dap.configurations.cpp = {
  {
    name = "Launch",
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
    name = "Remote attach",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    miMode = "gdb",
    miDebuggerServerAddress = "localhost:8080",
    miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
