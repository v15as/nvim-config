vim.loader.enable()
if vim.g.vscode ~= nil then
    return require('MicoMan.vscode')
end
require('MicoMan.settings')
require('MicoMan.autocmd')
require('MicoMan.plugins')
require('MicoMan.keybinds')
