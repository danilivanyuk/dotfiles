return {
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup()
		require("which-key").add({
			{ "<leader>t", group = "[T]ab" },
			{ "<leader>s", group = "[S]plit window" },
			-- { '<leader>c', group = '[C]ode' },
			-- { '<leader>d', group = '[D]ocument' },
			-- { '<leader>r', group = '[R]ename' },
			-- { '<leader>s', group = '[S]earch' },
			-- { '<leader>w', group = '[W]orkspace' },
			-- { '<leader>t', group = '[T]oggle' },
			-- { '<leader>l', group = '[L]azy[G]it' },
			-- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
		})
	end,
}
