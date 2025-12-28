-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Remap <Esc> to CapsLock
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- SEARCH MAPPINGS - See `:help hlsearch`
vim.keymap.set("n", "*", "*N", { desc = "Highlight and jump back to previous search" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = " Clear highlights on search when pressing <Esc> " })
vim.keymap.set("n", "<CR>", ":noh<CR>", { desc = "Clear highlights on search when hitting return" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>xq", vim.diagnostic.setqflist, { desc = "Quickfix Diagnostics (All)" })
vim.keymap.set("n", "<leader>xl", vim.diagnostic.setloclist, { desc = "Location List Diagnostics (Buffer)" })

-- Generic quickfix/location list
vim.keymap.set("n", "<leader>xQ", "<cmd>copen<cr>", { desc = "Open Quickfix List" })
vim.keymap.set("n", "<leader>xL", "<cmd>lopen<cr>", { desc = "Open Location List" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Arrow Keys are disabled in Normal Mode!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Arrow Keys are disabled in Normal Mode!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Arrow Keys are disabled in Normal Mode!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Arrow Keys are disabled in Normal Mode!"<CR>')

-- Keybinds to make split navigation easier. - Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize windows with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Decrease window width" })

-- Stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Tab management
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Better paste (don't yank replaced text)
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Better up/down (deals with word wrap)
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Center screen when scrolling
-- DOESN'T WORK WELL WITH SNACKS.NVIM
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Center screen when searching
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Formatting
vim.keymap.set({ "n", "x" }, "<leader>cf", function()
	require("conform").format({ async = true })
end, { desc = "Format code" })

-- Buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- New file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
