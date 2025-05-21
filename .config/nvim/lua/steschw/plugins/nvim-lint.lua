-- MasonInstall actionlint
-- MasonInstall golangci-lint
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

        lint.linters_by_ft = {
            go = { "golangcilint" },
            sql = { "sqruff" },
            ["yaml.github-action"] = { "actionlint" },
        }
    end,
}
