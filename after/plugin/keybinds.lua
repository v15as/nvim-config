------------------------------------------
-- This keybinds DON'T need prefix      --
-- that why they're in a different file --
------------------------------------------

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N')

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Mimic shell movements
map('i', '<C-E>', '<C-o>$')
map('i', '<C-A>', '<C-o>^')

--Shortcut to yank register
-- map({ 'n', 'x' }, '<leader>p', '"0p')
--
-- 
-- Move to last buffer
map('n', "''", '<CMD>b#<CR>')
-- 
-- Copying the vscode behaviour of making tab splits
-- To change between windows is <C-WW>
map('n', '<C-\\>', '<CMD>vsplit<CR>')
map('n', '<A-\\>', '<CMD>split<CR>')
-- 
-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")
-- 
-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')
-- 
map('n', '<Up>', '10k')
map('n', '<Down>', '10j')
-- 
map('v', '<Up>', '10k')
map('v', '<Down>', '10j')
-- 
map('n','<Left>','<C-W><')
map('n','<Right>','<C-W>>')
