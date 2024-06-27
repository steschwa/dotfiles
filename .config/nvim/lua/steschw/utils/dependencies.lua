local M = {}

--- @param tool string
function M.mason(tool)
    return {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            table.insert(opts.tools, tool)
        end,
    }
end

return M
