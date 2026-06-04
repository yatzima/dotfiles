return {
	"mfussenegger/nvim-dap",
	recommended = true,
	desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

	dependencies = {
		"rcarriga/nvim-dap-ui",
		-- virtual text for the debugger
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},
	},

  -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },
	config = function()
		vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

		local dap_icons = {
			Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
			Breakpoint = " ",
			BreakpointCondition = " ",
			BreakpointRejected = { " ", "DiagnosticError" },
			LogPoint = ".>",
		}
		for name, sign in pairs(dap_icons) do
			sign = type(sign) == "table" and sign or { sign }
			vim.fn.sign_define(
				"Dap" .. name,
				{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
			)
		end

		-- Python (debugpy) adapter for Docker attach
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		dap.adapters.python = {
			type = "server",
			host = "localhost",
			port = 5678,
		}
		dap.configurations.python = {
			{
				type = "python",
				request = "attach",
				name = "Attach Debugger to Docker",
				connect = { host = "localhost", port = 5678 },
				pathMappings = {
					{ localRoot = vim.fn.getcwd(), remoteRoot = "/" },
				},
				justMyCode = true,
			},
		}

		-- load .vscode/launch.json if present
		local vscode = require("dap.ext.vscode")
		local json = require("plenary.json")
		vscode.json_decode = function(str)
			return vim.json.decode(json.json_strip_comments(str))
		end

		-- nvim-dap uses the legacy sign API, which snacks statuscolumn ignores on
		-- Neovim >=0.10 (it only reads extmarks). Mirror DAP legacy signs as extmarks
		-- so snacks can display them.
		local ns = vim.api.nvim_create_namespace("dap_extmarks")

		local function sync_dap_signs(buf)
			buf = buf or vim.api.nvim_get_current_buf()
			if not vim.api.nvim_buf_is_loaded(buf) then
				return
			end
			vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
			for _, sign in ipairs(vim.fn.sign_getplaced(buf, { group = "dap_breakpoints" })[1].signs) do
				local def = vim.fn.sign_getdefined(sign.name)[1]
				if def then
					vim.api.nvim_buf_set_extmark(buf, ns, sign.lnum - 1, 0, {
						sign_text = def.text,
						sign_hl_group = def.texthl or "DiagnosticInfo",
						priority = sign.priority,
					})
				end
			end
		end

		for _, fn_name in ipairs({ "toggle_breakpoint", "set_breakpoint" }) do
			local orig = dap[fn_name]
			dap[fn_name] = function(...)
				orig(...)
				vim.schedule(sync_dap_signs)
			end
		end

		local orig_clear = dap.clear_breakpoints
		dap.clear_breakpoints = function(...)
			orig_clear(...)
			vim.schedule(function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					sync_dap_signs(buf)
				end
			end)
		end
	end,
}
