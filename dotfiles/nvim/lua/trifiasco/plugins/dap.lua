return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
        { "<F5>", function() require("dap").continue() end, desc = "DAP Continue" },
        { "<F10>", function() require("dap").step_over() end, desc = "DAP Step Over" },
        { "<F11>", function() require("dap").step_into() end, desc = "DAP Step Into" },
        { "<F12>", function() require("dap").step_out() end, desc = "DAP Step Out" },
        { "<localleader>b", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
        { "<leader>B", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional Breakpoint" },
        { "<leader>dr", function() require("dap").repl.open() end, desc = "DAP REPL" },
        { "<leader>dl", function() require("dap").run_last() end, desc = "DAP Run Last" },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Initialize DAP UI
        dapui.setup({
            icons = { expanded = "▾", collapsed = "▸" },
            mappings = {
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
            },
            layouts = {
                {
                    elements = {
                        "scopes",
                        "breakpoints",
                        "stacks",
                        "watches",
                    },
                    size = 40,
                    position = "left",
                },
                {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 10,
                    position = "bottom",
                },
            },
        })

        -- Enable virtual text
        require("nvim-dap-virtual-text").setup()

        -- Automatically open/close DAP UI
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end,
}
