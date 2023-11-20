
local wk = require("which-key")

local mappings = {
    ["D"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>","Go to declaration"},
    ["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition"},
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
    ["i"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Previous buffer"},
    ["r"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Next buffer"},
    ["nn"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename (nn = new name)"},
    ["c"] = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action"},


}

local opts = {
    prefix = "g"
}

wk.register(mappings, opts)
