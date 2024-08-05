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
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        --vim.keymap.set('n', '<leader>fg', builtin.gid_files, { desc = 'Find Git files' })
        vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc = 'Find live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
    end,
}
