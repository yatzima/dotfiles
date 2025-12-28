return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Get current weekday
		local weekday = os.date("%A, %B %d")
		local weekday_text = " " .. weekday .. " "

		-- Add weekday below the ASCII art
		-- local header = dashboard.section.header.val
		-- made using https://www.patorjk.com/software/taag/#p=display&f=BlurVision+ASCII
		local logo = [[
<-. (`-')_  (`-')  _                 (`-')  _     <-. (`-')  
   \( OO) ) ( OO).-/     .->        _(OO ) (_)       \(OO )_ 
,--./ ,--/ (,------.(`-')----. ,--.(_/,-.\ ,-(`-'),--./  ,-.)
|   \ |  |  |  .---'( OO).-.  '\   \ / (_/ | ( OO)|   `.'   |
|  . '|  |)(|  '--. ( _) | |  | \   /   /  |  |  )|  |'.'|  |
|  |\    |  |  .--'  \|  |)|  |_ \     /_)(|  |_/ |  |   |  |
|  | \   |  |  `---.  '  '-'  '\-'\   /    |  |'->|  |   |  |
`--'  `--'  `------'   `-----'     `-'     `--'   `--'   `--'
    ]]
		-- 		local logo = [[
		-- ,---.   .--.    .-''-.      ,-----.    ,---.  ,---..-./`) ,---.    ,---.
		-- |    \  |  |  .'_ _   \   .'  .-,  '.  |   /  |   |\ .-.')|    \  /    |
		-- |  ,  \ |  | / ( ` )   ' / ,-.|  \ _ \ |  |   |  .'/ `-' \|  ,  \/  ,  |
		-- |  |\_ \|  |. (_ o _)  |;  \  '_ /  | :|  | _ |  |  `-'`"`|  |\_   /|  |
		-- |  _( )_\  ||  (_,_)___||  _`,/ \ _/  ||  _( )_  |  .---. |  _( )_/ |  |
		-- | (_ o _)  |'  \   .---.: (  '\_/ \   ;\ (_ o._) /  |   | | (_ o _) |  |
		-- |  (_,_)\  | \  `-'    / \ `"/  \  ) /  \ (_,_) /   |   | |  (_,_)  |  |
		-- |  |    |  |  \       /   '. \_/``".'    \     /    |   | |  |      |  |
		-- '--'    '--'   `'-..-'      '-----'       `---`     '---' '--'      '--'
		--     ]]
		-- 		local logo = [[
		-- ░▒▓███████▓▒░░▒▓████████▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓██████████████▓▒░
		-- ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
		-- ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
		-- ░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
		-- ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
		-- ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▓█▓▒░ ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
		-- ░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓██████▓▒░   ░▒▓██▓▒░  ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░
		--     ]]
		-- 		local logo = [[
		-- ░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░▒▓████████▓▒░▒▓████████▓▒░▒▓█▓▒░▒▓██████████████▓▒░ ░▒▓██████▓▒░
		-- ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░          ░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
		-- ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓██▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
		--  ░▒▓██████▓▒░░▒▓████████▓▒░ ░▒▓█▓▒░      ░▒▓██▓▒░  ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░
		--    ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░    ░▒▓██▓▒░    ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
		--    ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
		--    ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓████████▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░
		--     ]]

		local header = vim.split(logo, "\n")

		-- Find the width of the logo (use the first line as reference)
		local logo_width = vim.fn.strdisplaywidth(header[1])
		local weekday_width = vim.fn.strdisplaywidth(weekday_text)
		local padding = math.floor((logo_width - weekday_width) / 2)

		-- Center the weekday text
		local centered_weekday = string.rep(" ", padding) .. weekday_text

		table.insert(header, "")
		table.insert(header, centered_weekday)
		table.insert(header, "")
		dashboard.section.header.val = header

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
			dashboard.button("n", " " .. " New file", [[<cmd> ene <BAR> startinsert <cr>]]),
			dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
			--dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
			dashboard.button(
				"p",
				" " .. " Projects",
				[[<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~/Projects'), find_command = {'fd', '--type', 'd', '--max-depth', '1', '--base-directory', vim.fn.expand('~/Projects')} })<cr>]]
				-- [[<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~/Projects') })<cr>]]
			),
			dashboard.button(
				"c",
				" " .. " Config",
				[[<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })<cr>]]
			),
			dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
			dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
			dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
		}

		-- Set footer
		local function footer()
			local total_plugins = require("lazy").stats().count
			-- local datetime = os.date("%d-%m-%Y  %H:%M:%S")
			local version = vim.version()
			local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

			-- return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
			return total_plugins .. " plugins" .. nvim_version_info
		end

		dashboard.section.footer.val = footer()

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		-- Disable statusline in alpha
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				-- Disable statusline in alpha
				vim.opt_local.laststatus = 0
			end,
		})
		-- Re-enable statusline when leaving alpha
		vim.api.nvim_create_autocmd("BufUnload", {
			buffer = 0,
			callback = function()
				-- Re-enable the statusline when leaving alpha
				vim.opt_local.laststatus = 3
			end,
		})
	end,
}
