-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optional: Set gruvbox background and style
			vim.o.background = "dark" -- or "light"
			require("gruvbox").setup({
				contrast = "hard", -- options: "hard", "soft", "medium"
				palette_overrides = {},
				overrides = {},
				italic = {
					strings = false,
					comments = true,
					operators = false,
					folds = true,
				},
			})
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
}
