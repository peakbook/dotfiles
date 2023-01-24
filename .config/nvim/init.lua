-- install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) == 1 then
  vim.fn.system({
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path
  })
end

require("rc/plugins")
require("rc/general")
require("rc/mappings")
