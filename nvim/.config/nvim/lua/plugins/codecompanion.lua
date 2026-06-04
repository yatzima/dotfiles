return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- NOTE: The log_level is in `opts.opts`
		opts = {
			log_level = "DEBUG", -- or "TRACE"
		},
	},
	config = function()
		local codecompanion = require("codecompanion")
		codecompanion.setup({
			strategies = {
				chat = { adapter = "copilot" },
			},
		})
		vim.keymap.set("n", "<leader>aa", function()
			codecompanion.toggle({ window_opts = { width = 0.4 } })
		end, { desc = "Open [A]I Chat" })
	end,
}
