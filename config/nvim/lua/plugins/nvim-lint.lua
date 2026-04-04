-- ~/.config/nvim/lua/plugins/linting.lua
return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "mypy" },
		}

		-- Configure mypy for virtual environment support
		local function get_python_executable()
			local venv_path = os.getenv("VIRTUAL_ENV")
			local conda_path = os.getenv("CONDA_PREFIX")

			if venv_path then
				return venv_path .. "/bin/python3"
			elseif conda_path then
				return conda_path .. "/bin/python3"
			else
				return vim.g.python3_host_prog or "/usr/bin/python3"
			end
		end

		-- Override mypy configuration for virtual environments
		lint.linters.mypy.args = {
			"--show-column-numbers",
			"--show-error-end",
			"--hide-error-context",
			"--no-color-output",
			"--no-error-summary",
			"--no-pretty",
			"--python-executable",
			get_python_executable(),
		}

		-- Setup autocommands for linting
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- Debug keymap
		vim.keymap.set("n", "<leader>ld", function()
			print("Running linters:", vim.inspect(lint.get_running()))
			print("Python executable:", get_python_executable())
			lint.try_lint()
		end, { desc = "Debug lint" })
	end,
}
