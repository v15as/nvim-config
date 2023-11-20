local wk = require("which-key")

local mappings = {
    ["ex"] = { "<cmd>Ex<cr>","Exit"},
    ["w"] = { "<cmd>update<cr>", "Save"},
    ["W"] = { "<cmd>wall<cr>", "Save all buffers" },
    ["["] = { "<cmd>bp<cr>", "Previous buffer"},
    ["]"] = { "<cmd>np<cr>", "Next buffer"},

    -- In this section the commands are defined in telescope.lua.
    -- They are declared here so they can appear on the which-key popup, but it doesn't have any function
    ["H"] = { "", "Telescope help tags"},
    ["r"] = { "", "live grep"},
    ["b"] = { "", "Telescope buffers"},
    ["c"] = { "", "Changed files"},
    ["P"] = { "", "File Finder"}
}

local opts = {
    prefix = "<leader>"
}

wk.register(mappings, opts)
