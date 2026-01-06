return {
	"gruvw/strudel.nvim",
	build = "npm ci",
	config = function()
		-- Set up filetype detection for .str files
		vim.filetype.add({
			extension = {
				str = "strudel",
			},
		})
		require("strudel").setup({
			-- Strudel web user interface related options
			ui = {
				-- Maximise the menu panel
				-- (optional, default: true)
				maximise_menu_panel = true,
				-- Hide the Strudel menu panel (and handle)
				-- (optional, default: false)
				hide_menu_panel = true,
				-- Hide the default Strudel top bar (controls)
				-- (optional, default: false)
				hide_top_bar = true,
				-- Hide the Strudel code editor
				-- (optional, default: false)
				-- Set `hide_code_editor = false` if you want to overlay the code editor
				-- hide_code_editor = true,
				-- Hide the Strudel eval error display under the editor
				-- (optional, default: false)
				hide_error_display = true,
			},
			-- Automatically start playback when launching Strudel
			-- (optional, default: true)
			start_on_launch = false,
			-- Set to `true` to automatically trigger the code evaluation after saving the buffer content
			-- Only works if the playback was already started (doesn't start the playback on save)
			-- (optional, default: false)
			update_on_save = true,
			-- Enable two-way cursor position sync between Neovim and Strudel editor
			-- (optional, default: true)
			sync_cursor = true,
			-- Report evaluation errors from Strudel as Neovim notifications
			-- (optional, default: true)
			report_eval_errors = true,
			-- Path to a custom CSS file to style the Strudel web editor (base64-encoded and injected at launch)
			-- This allows you to override or extend the default Strudel UI appearance
			-- (optional, default: nil)
			-- custom_css_file = vim.fn.expand("~/.config/nvim/strudel-custom.css"),
			-- Headless mode: set to `true` to run the browser without launching a window
			-- (optional, default: false)
			headless = false,
			-- Path to the directory where Strudel browser user data (cookies, sessions, etc.) is stored
			-- (optional, default: `~/.cache/strudel-nvim/`)
			browser_data_dir = "~/.cache/strudel-nvim/",
			-- Path to a (chromium-based) browser executable of choice
			-- (optional, default: nil)
			-- browser_exec_path = "/Applications/Brave Browser.app/Contents/MacOS/Brave Browser",
		})
		-- Set up buffer-local keymaps for .str files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "strudel",
			callback = function(event)
				local map = vim.keymap.set
				local opts = { buffer = event.buf } -- buffer-local keymaps

				map("n", "<localleader>l", function()
					require("strudel").launch()
				end, vim.tbl_extend("force", opts, { desc = "Launch Strudel" }))
				map("n", "<localleader>q", function()
					require("strudel").quit()
				end, vim.tbl_extend("force", opts, { desc = "Quit Strudel" }))
				map("n", "<localleader>t", function()
					require("strudel").toggle()
				end, vim.tbl_extend("force", opts, { desc = "Toggle Play/Stop" }))
				map("n", "<localleader>u", function()
					require("strudel").update()
				end, vim.tbl_extend("force", opts, { desc = "Update (Trigger code evaluation)" }))
				map("n", "<localleader>s", function()
					require("strudel").stop()
				end, vim.tbl_extend("force", opts, { desc = "Stop Playback" }))
				map("n", "<localleader>b", function()
					require("strudel").set_buffer()
				end, vim.tbl_extend("force", opts, { desc = "Set current buffer" }))
				map("n", "<localleader>x", function()
					require("strudel").execute()
				end, vim.tbl_extend("force", opts, { desc = "Set current buffer and update" }))
			end,
		})
	end,
}
