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

local function fix_eslint()
    vim.cmd.LspEslintFixAll()
end

local function fix_pyright()
    vim.cmd.LspPyrightOrganizeImports()
end

function M.fix()
    pcall(fix_eslint)
    pcall(fix_pyright)
end

return M
