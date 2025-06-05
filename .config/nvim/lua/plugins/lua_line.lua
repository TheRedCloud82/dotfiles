return {
	"nvim-lualine/lualine.nvim", -- The Lualine plugin
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- Dependency for icons
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true, -- Enable icons (requires nvim-web-devicons)
				--theme = "everforest", -- Set the theme (you can change this to your favorite theme)
				theme = "gruvbox_dark",
				component_separators = { left = "", right = "" }, -- Separator between components
				section_separators = { left = "", right = "" }, -- Separator between sections
			},
			sections = {
				lualine_a = { "mode" }, -- Show current mode (Normal, Insert, etc.)
				lualine_b = { "branch" }, -- Show Git branch
				lualine_c = { "filename" }, -- Show filename
				lualine_x = { "encoding", "filetype" }, -- Show encoding and filetype
				lualine_y = { "progress" }, -- Show progress (line number)
				lualine_z = { "location" }, -- Show current line and column
			},
			inactive_sections = {
				lualine_a = { "filename" }, -- Show filename in inactive buffers
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
