local M = {}

function M.setup()
    local neotest = require("neotest")
    neotest.setup({
        adapters = {
            require("neotest-golang")({ runner = "go" }),
            require("neotest-jest")({}),
            require("neotest-python")({}),
            require("neotest-rust"),
            require("neotest-vitest"),
        },
        output = {
            open_on_run = true,
        },
        status = {
            virtual_text = true,
        },
    })

    vim.keymap.set("n", "<leader>tt", neotest.run.run, { desc = "Run nearest test" })
    vim.keymap.set("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run test file" })
    vim.keymap.set("n", "<leader>tl", neotest.run.run_last, { desc = "Run last test" })
    vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "Toggle test summary" })
    vim.keymap.set("n", "<leader>to", function()
        neotest.output.open({ enter = true })
    end, { desc = "Show test output" })
    vim.keymap.set("n", "<leader>tx", neotest.run.stop, { desc = "Stop test" })
end

return M
