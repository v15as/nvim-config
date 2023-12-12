return require('packer').startup({
    function(use)
        ---------------------
        -- Package Manager --
        ---------------------

        use('wbthomason/packer.nvim')

        ----------------------
        -- Required plugins --
        ----------------------

        use('nvim-lua/plenary.nvim')

        use({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup()
            end,
        })

        use { "bluz71/vim-nightfly-colors", as = "nightfly" }
        use { "rebelot/kanagawa.nvim", as = "kanagawa" }

        use {
            'nvim-lualine/lualine.nvim',

            config = function()
                require('MicoMan.plugins.lualine')
            end,
        }
        -----------------------------------
        -- Treesitter: Better Highlights --
        -----------------------------------

        use({
            {
                'nvim-treesitter/nvim-treesitter',
                event = 'CursorHold',
                run = ':TSUpdate',
                config = function()
                    require('MicoMan.plugins.treesitter')
                end,
            },
            { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
            { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
            { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
        })

        use 'mfussenegger/nvim-jdtls'
        -------------------------
        -- Editor UI Niceties --
        --------------------------
        -- Lua
        use {
            "folke/which-key.nvim",
            config = function()
                require('MicoMan.plugins.whichkey.whichkey')
            end
        }

        use({
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            main = "ibl"
            -- config = function()
            --     require('MicoMan.plugins.indentline')
            -- end,
        })

        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }

        use({
           'norcalli/nvim-colorizer.lua',
           event = 'CursorHold',
           config = function()
               require('MicoMan.plugins.colorizer')
           end,
         })

        use({'tpope/vim-surround'})

        ---------------------------------
        -- Navigation and Fuzzy Search --
        ---------------------------------

        use({
            'nvim-tree/nvim-tree.lua',
            event = 'CursorHold',
            config = function()
                require('MicoMan.plugins.nvim-tree')
            end,
        })

        use({
            {
                'nvim-telescope/telescope.nvim',
                event = 'CursorHold',
                config = function()
                    require('MicoMan.plugins.telescope')
                end,
            },
            {
                'nvim-telescope/telescope-symbols.nvim',
                after = 'telescope.nvim',
            },
        })

        --------------
        -- Terminal --
        --------------

        use({
            'numToStr/FTerm.nvim',
            event = 'CursorHold',
            config = function()
                require('MicoMan.plugins.fterm')
            end,
        })

        -----------------------------------
        -- LSP, Completions and Snippets --
        -----------------------------------

        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            requires = {
                --- Uncomment these if you want to manage LSP servers from neovim
                {'williamboman/mason.nvim'},
                {'williamboman/mason-lspconfig.nvim'},

                -- LSP Support
                {'neovim/nvim-lspconfig'},
                -- Autocompletion
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'L3MON4D3/LuaSnip'},
            }
        }

    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
