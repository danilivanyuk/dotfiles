-- LSP Support
return {
	-- LSP Configuration
	-- https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	lazy = false,
	dependencies = {
		-- LSP Management
		-- https://github.com/williamboman/mason.nvim
		{ "williamboman/mason.nvim" },
		-- https://github.com/williamboman/mason-lspconfig.nvim
		{ "williamboman/mason-lspconfig.nvim" },
		-- Useful status updates for LSP
		-- https://github.com/j-hui/fidget.nvim
		{ "j-hui/fidget.nvim", opts = {} },
		-- Additional lua configuration, makes nvim stuff amazing!
		-- https://github.com/folke/neodev.nvim
		{ "folke/neodev.nvim", opts = {} },
		-- main one completion
	},
	-- init = function()
	-- 	vim.g.coq_settings = {
	-- 		auto_start = true, -- if you want to start COQ at startup
	-- 		-- Your COQ settings here
	-- 	}
	-- end,
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			-- Install these LSPs automatically
			ensure_installed = {
				-- 'bashls', -- requires npm to be installed
				"cssls", -- requires npm to be installed
				"html", -- requires npm to be installed
				"lua_ls",
				-- 'jsonls', -- requires npm to be installed
				"lemminx",
				"marksman",
				-- "tsserver", -- requires npm to be installed
				"ts_ls", -- requires npm to be installed
				-- 'yamlls', -- requires npm to be installed
				"basedpyright",
			},
		})

		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lsp_attach = function(client, bufnr)
			-- Create your keybindings here...
			--
		end

		-- Call setup on each LSP server EXCEPT basedpyright (we'll handle it separately)
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				-- Skip basedpyright here since we configure it separately
				if server_name ~= "basedpyright" then
					lspconfig[server_name].setup({
						on_attach = lsp_attach,
						capabilities = lsp_capabilities,
					})
				end
			end,
		})

		-- Lua LSP settings
		lspconfig.lua_ls.setup({
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		-- BasedPyright LSP settings (configured separately to avoid override)
		lspconfig.basedpyright.setup({
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
			-- Try multiple approaches to ensure settings are applied
			-- Это все равно не работает
			settings = {
				python = {
					analysis = {
						diagnosticMode = "openFilesOnly",
						typeCheckingMode = "basic",
						useLibraryCodeForTypes = true,
						autoSearchPaths = true,
						diagnosticSeverityOverrides = {
							reportGeneralTypeIssues = "none",
							reportOptionalMemberAccess = "none",
							reportOptionalSubscript = "none",
							reportPrivateImportUsage = "none",
							reportUnusedCallResult = "none",
							reportUnusedExpression = "none", -- Alternative name
							reportArgumentType = "none",
							reportUnknownMemberType = "none",
							reportAssignmentType = "none",
						},
					},
				},
			},
			-- Alternative: use init_options
			init_options = {
				settings = {
					python = {
						analysis = {
							diagnosticSeverityOverrides = {
								reportUnusedCallResult = "none",
								reportGeneralTypeIssues = "none",
								reportArgumentType = "none",
								reportUnknownMemberType = "none",
								reportAssignmentType = "none",
							},
						},
					},
				},
			},
			-- Force settings on attach with delay
			on_attach = function(client, bufnr)
				lsp_attach(client, bufnr)

				-- Force configuration update after a short delay
				vim.defer_fn(function()
					if client.server_capabilities then
						client.notify("workspace/didChangeConfiguration", {
							settings = client.config.settings,
						})
					end
				end, 1000)
			end,
		})

		-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
		local open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or "rounded" -- Set border to rounded
			return open_floating_preview(contents, syntax, opts, ...)
		end
	end,
}
