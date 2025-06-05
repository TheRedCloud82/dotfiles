return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			local conf = require("telescope.config").values

			-- ===== Core Setup =====
			harpoon:setup({
				settings = {
					save_on_toggle = true, -- Auto-save when toggling marks
					sync_on_ui_close = true, -- Sync on UI close
					key = function() -- Custom mark symbols
						return vim.loop.cwd()
					end,
				},
			})

			-- ===== Essential Keymaps =====
			local map = vim.keymap.set

			-- Mark Management
			map("n", "<leader>hm", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon [M]enu" })
			map("n", "<leader>ha", function()
				harpoon:list():append()
			end, { desc = "Harpoon [A]dd file" })
			map("n", "<leader>hr", function()
				harpoon:list():remove()
			end, { desc = "Harpoon [R]emove file" })

			-- Quick Navigation (Alt+1 to Alt+4)
			map("n", "<C-1>", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon goto 1" })
			map("n", "<C-2>", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon goto 2" })
			map("n", "<C-3>", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon goto 3" })
			map("n", "<C-4>", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon goto 4" })

			-- ===== Advanced Features =====
			-- Telescope Integration (if installed)
			if pcall(require, "telescope") then
				map("n", "<leader>hf", function()
					require("telescope").extensions.harpoon.marks({
						layout_config = { width = 0.5, height = 0.4 },
						previewer = false,
					})
				end, { desc = "Harpoon [F]ind marks" })
			end

			-- Project-Specific Lists (Example)
			map("n", "<leader>hp", function()
				local project_name = vim.fn.fnamemodify(vim.loop.cwd(), ":t")
				harpoon:list():set_current_list(project_name)
				print("Harpoon list: " .. project_name)
			end, { desc = "Harpoon [P]roject list" })
		end,
	},
}
