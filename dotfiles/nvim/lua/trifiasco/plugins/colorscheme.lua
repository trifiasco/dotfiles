return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            italic = {
                strings = false,
                emphasis = true,
                comments = true,
                operators = false,
            },
        })
        vim.cmd.colorscheme("gruvbox")
    end,
}
