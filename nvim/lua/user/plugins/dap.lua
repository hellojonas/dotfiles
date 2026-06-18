return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- vim.api.nvim.create_user_command("DapStop", function()
		--       end, { desc = "Stop DAP and kill server" })
		-- {
		-- 	breakpoints = {
		-- 		icon = "",
		-- 		color = "#ff0000", -- bright red for high visibility
		-- 	},
		-- }
		dapui.setup({
			controls = {
				element = "repl",
				enabled = true,
				icons = {
					disconnect = "",
					pause = "",
					play = "",
					run_last = "",
					step_back = "",
					step_into = "",
					step_out = "",
					step_over = "",
					terminate = "",
				},
			},
			element_mappings = {},
			expand_lines = true,
			floating = {
				border = "single",
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			force_buffers = true,
			icons = {
				collapsed = "",
				current_frame = "",
				expanded = "",
			},
			layouts = {
				{
					elements = {
						{
							id = "repl",
							size = 0.5,
						},
						{
							id = "console",
							size = 0.5,
						},
					},
					position = "bottom",
					size = 10,
				},
				{
					elements = {
						{
							id = "scopes",
							size = 0.33,
						},
						{
							id = "breakpoints",
							size = 0.1,
						},
						-- {
						-- 	id = "stacks",
						-- 	size = 0.25,
						-- },
						{
							id = "watches",
							size = 0.33,
						},
					},
					position = "left",
					size = 60,
				},
			},
			mappings = {
				edit = "e",
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t",
			},
			render = {
				indent = 1,
				max_value_lines = 100,
			},
		})

		vim.cmd("hi DapBreakpointColor guifg=#ff0000")
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor", linehl = "", numhl = "" })

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.api.nvim_create_user_command("DapStop", function()
			local bufs = vim.api.nvim_list_bufs()
			for _, buf in ipairs(bufs) do
				local name = vim.api.nvim_buf_get_name(buf)
				if name:match("%[?dap%-terminal%]?") then
					dap.terminate()
					vim.api.nvim_buf_delete(buf, { force = true, unload = true })
				end
			end
		end, { desc = "Terminate sessiont and kill development server" })

		-- Debugger
		vim.keymap.set("n", "<leader>dui", function()
			require("dapui").toggle({ reset = true })
		end, { desc = "[D]ebugger [UI]" })
		vim.keymap.set("n", "<leader>ds", "<CMD>DapNew<CR>", { desc = "[D]ebugger Start" })
		vim.keymap.set("n", "<F12>", "<CMD>DapToggleBreakpoint<CR>", { desc = "Debugger [T]oggle [B]reakpoint" })
		vim.keymap.set("n", "<leader>cb", "<CMD>DapClearBreakpoint<CR>", { desc = "Debugger [T]oggle [B]reakpoint" })
		vim.keymap.set("n", "<F5>", "<CMD>DapStepInto<CR>", { desc = "Debugger [S]tep [I]nto" })
		vim.keymap.set("n", "<F4>", "<CMD>DapStepOut<CR>", { desc = "Debugger [S]tep Ou[t]" })
		vim.keymap.set("n", "<F6>", "<CMD>DapStepOver<CR>", { desc = "Debugger [S]tep O[v]er" })
		vim.keymap.set("n", "<F3>", "<CMD>DapContinue<CR>", { desc = "[D]ebugger [C]ontinue" })
		vim.keymap.set("n", "<leader>dr", "<CMD>DapRestartFrame<CR>", { desc = "[D]ebugger [R]estart Frame" })
		vim.keymap.set("n", "<leader>dt", "<CMD>DapStop<CR>", { desc = "[D]ebugger [T]erminate" })
	end,
}
