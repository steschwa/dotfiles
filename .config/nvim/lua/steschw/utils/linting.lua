local M = {}

function M.lint()
    pcall(function()
        require("lint").try_lint(nil, {
            ignore_errors = true,
        })
    end)
end

function M.fix()
    pcall(vim.cmd.EslintFixAll)
    pcall(vim.cmd.PyrightOrganizeImports)
end

return M
