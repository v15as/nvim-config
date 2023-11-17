-- Fix Undefined global 'vim'
-- lsp_zero.configure('lua-language-server', {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- })
---
-- Replace these language servers
-- with the ones you have installed in your system
---
-- require('lspconfig').lua_ls.setup({})
-- require('lspconfig').rust_analyzer.setup({})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {
        'tsserver',
        'rust_analyzer',
        'clangd',
        'jdtls',
    },
    handlers = {
        lsp_zero.default_setup,
        jdtls = lsp_zero.noop,
    },
})
