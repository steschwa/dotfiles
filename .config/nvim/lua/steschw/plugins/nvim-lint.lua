local do_lint = require("steschw.utils.linting").lint

return {
    "mfussenegger/nvim-lint",
    lazy = true,
    init = function()
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
            callback = do_lint,
        })
    end,
    config = function()
        -- MasonInstall revive
        -- MasonInstall actionlint
        -- MasonInstall sqruff

        local lint = require("lint")

        lint.linters.revive.args = {
            "-formatter",
            "json",
            "-config",
            vim.fn.expand("~/.config/revive/revive.toml"),
        }

        lint.linters_by_ft = {
            go = { "revive" },
            sql = { "sqruff" },
            ["yaml.github-action"] = { "actionlint" },
        }
    end,
}
