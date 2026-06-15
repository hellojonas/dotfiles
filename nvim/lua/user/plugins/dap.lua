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

		dapui.setup()

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

		-- Debugger
		vim.keymap.set("n", "<leader>dui", require("dapui").toggle, { desc = "[D]ebugger [UI]" })
		vim.keymap.set("n", "<leader>ds", "<CMD>DapNew<CR>", { desc = "[D]ebugger Start" })
		vim.keymap.set("n", "<leader>dd", "<CMD>DapDisconnect<CR>", { desc = "[D]ebugger [D]isconnect" })
		vim.keymap.set("n", "<leader>tb", "<CMD>DapToggleBreakpoint<CR>", { desc = "Debugger [T]oggle [B]reakpoint" })
		vim.keymap.set("n", "<leader>cb", "<CMD>DapClearBreakpoint<CR>", { desc = "Debugger [T]oggle [B]reakpoint" })
		vim.keymap.set("n", "<leader>si", "<CMD>DapStepInto<CR>", { desc = "Debugger [S]tep [I]nto" })
		vim.keymap.set("n", "<leader>st", "<CMD>DapStepOut<CR>", { desc = "Debugger [S]tep Ou[t]" })
		vim.keymap.set("n", "<leader>so", "<CMD>DapStepOver<CR>", { desc = "Debugger [S]tep O[v]er" })
		vim.keymap.set("n", "<leader>dc", "<CMD>DapContinue<CR>", { desc = "[D]ebugger [C]ontinue" })
		vim.keymap.set("n", "<leader>dr", "<CMD>DapRestartFrame<CR>", { desc = "[D]ebugger [R]estart Frame" })
		vim.keymap.set("n", "<leader>dt", "<CMD>DapTerminate<CR>", { desc = "[D]ebugger [T]erminate" })
	end,
}
