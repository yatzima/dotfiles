-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Define local variable to save on chars
local map = vim.keymap.set

-- Remap <Esc> to CapsLock
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- SEARCH MAPPINGS - See `:help hlsearch`
map("n", "*", "*N", { desc = "Highlight and jump back to previous search" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = " Clear highlights on search when pressing <Esc> " })

-- Move lines up/down in visual mode (super useful!)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Diagnostic keymaps
map("n", "<leader>xq", vim.diagnostic.setqflist, { desc = "Quickfix Diagnostics (All)" })
map("n", "<leader>xl", vim.diagnostic.setloclist, { desc = "Location List Diagnostics (Buffer)" })

-- Generic quickfix/location list
map("n", "<leader>xQ", "<cmd>copen<cr>", { desc = "Open Quickfix List" })
map("n", "<leader>xL", "<cmd>lopen<cr>", { desc = "Open Location List" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Arrow Keys are disabled in Normal Mode!"<CR>')
map("n", "<right>", '<cmd>echo "Arrow Keys are disabled in Normal Mode!"<CR>')
map("n", "<up>", '<cmd>echo "Arrow Keys are disabled in Normal Mode!"<CR>')
map("n", "<down>", '<cmd>echo "Arrow Keys are disabled in Normal Mode!"<CR>')

-- Keybinds to make split navigation easier. - Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize windows with arrows
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Stay in visual mode when indenting
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Tab management
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Better paste (don't yank replaced text)
map("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Better up/down (deals with word wrap)
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Center screen when scrolling
-- DOESN'T WORK WELL WITH SNACKS.NVIM
-- map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
-- map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Center screen when searching
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Formatting
map({ "n", "x" }, "<leader>cf", function()
	require("conform").format({ async = true })
end, { desc = "Format code" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
