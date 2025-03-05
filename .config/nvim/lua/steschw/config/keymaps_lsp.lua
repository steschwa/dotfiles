local keymap = require("steschw.utils.keys").keymap

local M = {}

function M.set(buf)
    keymap("n", "<leader>d", M.diagnostics, { buffer = buf })
    keymap("n", "gr", M.references, { buffer = buf })
    keymap("n", "gd", M.definition, { buffer = buf })
    keymap({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, { buffer = buf })
    keymap("n", "gh", vim.lsp.buf.hover, { buffer = buf })
    keymap("n", "gH", vim.diagnostic.open_float, { buffer = buf })
    keymap("n", "gR", vim.lsp.buf.rename, { buffer = buf })
    keymap("n", "ga", vim.lsp.buf.code_action, { buffer = buf })
end

function M.diagnostics()
    local filename = vim.fn.fnamemodify(vim.fn.expand("%"), ":t")
    local diagnostics = vim.diagnostic.get(0)

    local what = {
        title = string.format("Diagnostics (%s)", filename),
        context = "diagnostics",
        nr = "$",
        items = vim.diagnostic.toqflist(diagnostics),
    }

    vim.fn.setqflist({}, " ", what)
    vim.cmd("botright cw")
end

function M.references()
    local word = vim.fn.expand("<cword>")

    local function on_list(res)
        res.title = string.format('References "%s"', word)
        res.nr = "$"

        res.items = vim.tbl_filter(function(item)
            if type(vim.g.lsp_references_filter) == "function" then
                return vim.g.lsp_references_filter(item)
            end

            return true
        end, res.items)

        if #res.items == 0 then
            vim.notify(
                "[LSP] all references where filtered by `vim.g.lsp_references_filter`",
                vim.log.levels.INFO
            )
            return
        end

        vim.fn.setqflist({}, " ", res)
        vim.cmd("botright cw")
    end

    vim.lsp.buf.references({ includeDeclaration = false }, {
        on_list = on_list,
    })
end

function M.definition()
    -- always jump to first definition
    local function on_list(res)
        local item = res.items[1]

        -- add current location to jumplist
        vim.cmd("mark '")

        local is_current_buf = vim.api.nvim_buf_get_name(0) == item.filename
        if not is_current_buf then
            vim.cmd.edit(item.filename)
        end

        vim.fn.cursor(item.lnum, item.col)
    end

    vim.lsp.buf.definition({
        on_list = on_list,
    })
end

return M
