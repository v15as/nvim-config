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

        -------------------------
        -- Editor UI Niceties --
        --------------------------

        use({
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            config = function()
                require('MicoMan.plugins.indentline')
            end,
        })

       use({
          'norcalli/nvim-colorizer.lua',
          event = 'CursorHold',
          config = function()
              require('colorizer').setup()
          end,
        })

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

        use({
            'neovim/nvim-lspconfig',
            event = 'BufRead',
            config = function()
                require('MicoMan.plugins.lsp.servers')
            end,
            requires = {
                {
                    -- WARN: Unfortunately we won't be able to lazy load this
                    'hrsh7th/cmp-nvim-lsp',
                },
            },
        })

        use({
            'jose-elias-alvarez/null-ls.nvim',
            event = 'BufRead',
            config = function()
                require('MicoMan.plugins.lsp.null-ls')
            end,
        })

        use({
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                config = function()
                    require('MicoMan.plugins.lsp.nvim-cmp')
                end,
                requires = {
                    {
                        'L3MON4D3/LuaSnip',
                        event = 'InsertEnter',
                        config = function()
                            require('MicoMan.plugins.lsp.luasnip')
                        end,
                        requires = {
                            {
                                'rafamadriz/friendly-snippets',
                                event = 'CursorHold',
                            },
                        },
                    },
                },
            },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        })

    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
