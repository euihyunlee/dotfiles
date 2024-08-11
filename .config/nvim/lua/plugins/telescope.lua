return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-y>'] = 'select_default',
                        ['<C-s>'] = 'select_horizontal',
                    },
                },
            },
        })
        require('telescope').load_extension('fzf')

        local builtin = require 'telescope.builtin'

        -- File Pickers
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>fF', builtin.git_files, { desc = 'Find Git files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find grep' })

        -- Vim Pickers
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
        vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Find quickfix' })
        vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = 'Find in jumplist' })
    end,
}
