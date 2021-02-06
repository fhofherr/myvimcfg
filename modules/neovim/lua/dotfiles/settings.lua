local M = {}

local completion = require("dotfiles.settings.completion")
local lsp = require("dotfiles.settings.lsp")
local treesitter = require("dotfiles.settings.treesitter")

function M.setup()
    completion.setup()
    lsp.setup()
    treesitter.setup()
end

return M
