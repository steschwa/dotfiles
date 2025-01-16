local M = {}

function M.lint()
    pcall(function()
        require("lint").try_lint(nil, {
            ignore_errors = true,
        })
    end)
end

local function fix_eslint()
    vim.cmd.EslintFixAll()
end

local function fix_pyright()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({
        bufnr = bufnr,
        name = "pyright",
    })
    if #clients == 0 then
        return
    end

    local client = clients[1]
    client.request_sync("workspace/executeCommand", {
        command = "pyright.organizeimports",
        arguments = { vim.uri_from_bufnr(0) },
    }, 500, bufnr)
end

function M.fix()
    pcall(fix_eslint)
    pcall(fix_pyright)
end

return M
