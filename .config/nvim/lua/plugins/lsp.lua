return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local builtin = require 'telescope.builtin'

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                    local map = function(keys, func, desc)
                        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
                    end

                    map('K', vim.lsp.buf.hover, 'Hover')
                    --map('gd', builtin.lsp_definitions, 'Go to definition')
                    map('gd', vim.lsp.buf.definition, 'Go to definition')
                    map('gD', vim.lsp.buf.declaration, 'Go to declaration')
                    map('gr', builtin.lsp_references, 'Go to references')
                end
            })

            local capabilities = vim.tbl_deep_extend(
                'force',
                {},
                vim.lsp.protocol.make_client_capabilities(),
                require('cmp_nvim_lsp').default_capabilities()
            )

            require('mason').setup()

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                },
                handlers = {
                    function(server)
                        require('lspconfig')[server].setup({
                            capabilities = capabilities
                        })
                    end,
                },
            })
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            --'hrsh7th/cmp-buffer',
            --'hrsh7th/cmp-path',
            --'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                --sources = cmp.config.sources({
                --    { name = 'nvim_lsp' },
                --    { name = 'luasnip' },
                --}),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                }),
            })
        end,
    },
}
