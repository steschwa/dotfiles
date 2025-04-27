-- MasonInstall actionlint
-- MasonInstall revive
-- MasonInstall sqruff

return {
    "mfussenegger/nvim-lint",
    lazy = true,
    init = function()
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
            callback = require("steschw.utils.linting").lint,
        })
    end,
    config = function()
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
