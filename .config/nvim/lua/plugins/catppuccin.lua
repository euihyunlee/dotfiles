return {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            transparent_background = true,
            no_italic = true,
            integrations = {
                mason = true,
                which_key = true,
            },
        })

        vim.cmd.colorscheme 'catppuccin'
    end,
}
