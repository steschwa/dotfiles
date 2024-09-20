local augroup = require("steschw.utils.autocmd").augroup
local do_lint = require("steschw.utils.linting").lint

return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters.revive.args = {
            "-formatter",
            "json",
            "-config",
            vim.fn.expand("~/.config/revive/revive.toml"),
        }

        -- MasonInstall revive
        lint.linters_by_ft = {
            go = { "revive" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
            group = augroup("lint"),
            callback = do_lint,
        })
    end,
}
