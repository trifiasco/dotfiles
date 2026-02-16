
-- [[ Configure LSP ]]
local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("<leader>ld", vim.diagnostic.open_float, "[L]oad Diagnostic")
	nmap("[d", function() vim.diagnostic.jump({ count = -1 }) end, "Prev diagnostic")
	nmap("]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")

	-- Navigation keymaps (gd, gr, gi, etc.) handled by snacks.lua pickers

	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

local servers = {
	pyright = {
		single_file_support = true,
		settings = {
			pyright = {
				disableOrganizeImports = true,
			},
			python = {
				analysis = {
	                   -- using ruff for linting
	                   ignore = { '*' }
				},
			},
		},
	},
    ruff = {
        cmd = { "ruff", "server" },
        filetypes = { "python" },
        settings = {
            ruff = {
                lint = {
                    enabled = true,
                },
            },
        },
    },
    -- don't call setup for rust_analyzer, rustacean.nvim manages it
	rust_analyzer = {
        cmd = { "rust-analyzer" },
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                },
                cargo = {
                    allFeatures = true,
                },
            },
        },
    },
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim", "Snacks" },
			},
			defaultConfig = {
				indent_style = "space",
				indent_size = "2",
			},
		},
	},
}

local config = function()
    -- blink.cmp auto-extends capabilities; only add folding range for nvim-ufo
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
    }

    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
    })

    local util = require('lspconfig/util')
    local path = util.path

    local function get_python_path(workspace)
        -- Case 01: activated virtual env
        if vim.env.VIRTUAL_ENV then
            return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
        end

        -- Case 02: .venv in project root
        if workspace then
            local root = util.find_git_ancestor(workspace) or workspace
            local venv = path.join(root, '.venv')
            if path.exists(venv) then
                return path.join(venv, 'bin', 'python')
            end
        end

        -- Case 03: Fallback to system Python
        return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
    end

    mason_lspconfig.setup_handlers({
        function(server_name)
            require("lspconfig")[server_name].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes,
                on_init = function (client)
                    if server_name == 'pyright' then
                        client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
                    end
                end
            })
        end,
    })
end

return {
    "neovim/nvim-lspconfig",
    version = "1.*",
    config = config,
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        { "williamboman/mason-lspconfig.nvim", version = "1.*" },
    },
}
