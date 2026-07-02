local M = {}

function M.lint()
    pcall(function()
        if not vim.diagnostic.is_enabled({ bufnr = 0 }) then
            return
        end

        require("lint").try_lint(nil, {
            ignore_errors = true,
        })
    end)
end

local function fix_oxlint()
    vim.cmd.LspOxlintFixAll()
end

function M.fix()
    pcall(fix_oxlint)
end

return M
