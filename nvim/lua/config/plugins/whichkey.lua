return {
        {
                "folke/which-key.nvim",
                config = function()
                        require("which-key").setup({
                                window = {
                                        border = "rounded",
                                        position = "bottom",
                                        margin = { 1, 0, 1, 0 },
                                        padding = { 1, 2, 1, 2 },
                                        winblend = 0,
                                },
                                layout = {
                                        height = { min = 4, max = 15 },
                                        width = { min = 20, max = 50 },
                                        spacing = 3,
                                        align = "left",
                                },
                        })
                end,
        },
}
