local augroup = require("steschw.utils.autocmd").augroup
local do_lint = require("steschw.utils.linting").lint

return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- MasonInstall revive

        local lint = require("lint")
        lint.linters_by_ft = {
            go = { "revive" },
            javascript = { "eslint" },
            javascriptreact = { "eslint" },
            typescript = { "eslint" },
            typescriptreact = { "eslint" },
        }

        local revive_linter = lint.linters.revive
        revive_linter.args = { "-config", vim.fn.expand("~/.config/revive/revive.toml") }

        vim.api.nvim_create_autocmd({
            "BufReadPost",
            "BufWritePost",
            "InsertLeave",
            "CursorHold",
        }, {
            group = augroup("lint"),
            callback = do_lint,
        })
    end,
}
